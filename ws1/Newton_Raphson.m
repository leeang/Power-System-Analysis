clear;

%% admittance
y12 = (0.01 + 0.03j)^-1;
y13 = (0.02 + 0.04j)^-1;
y23 = (0.0125 + 0.025j)^-1;

Y = zeros(3);

Y(1, 1) = y12 + y13;
Y(1, 2) = -y12;
Y(1, 3) = -y13;

Y(2, 1) = -y12;
Y(2, 2) = y12 + y23;
Y(2, 3) = -y23;

Y(3, 1) = -y13;
Y(3, 2) = -y23;
Y(3, 3) = y13 + y23;

G = real(Y);	% conductance
B = imag(Y);	% susceptance

%% conditions
P_G2 = 2;
P_D2 = 0.5;
P_2 = P_G2 - P_D2;

P_D3 = 4;
P_3 = -P_D3;

Q_D3 = 2.5;
Q_3 = -Q_D3;

V_1 = 1.05;
delta_1 = 0;

V_2 = 1.04;

S_D1 = 0.8 + 0.3j;
S_D2 = 0.5 + 0.25j;
S_D3 = 4 + 2.5j;

% initial guess
V_3 = 1;
delta_2 = 0;
delta_3 = 0;

f = ones(3, 1);
iteration_num = 0;

TOLERANCE = 1E-9;

% iteration
while norm(f) > TOLERANCE
	% P_2
	f1 = V_2 * V_1 * ( G(2, 1) * cos(delta_2-delta_1) + B(2, 1) * sin(delta_2-delta_1) ) + ...
	V_2 * V_2 * ( G(2, 2) * cos(delta_2-delta_2) + B(2, 2) * sin(delta_2-delta_2) ) + ...
	V_2 * V_3 * ( G(2, 3) * cos(delta_2-delta_3) + B(2, 3) * sin(delta_2-delta_3) ) - P_2;

	% P_3
	f2 = V_3 * V_1 * ( G(3, 1) * cos(delta_3-delta_1) + B(3, 1) * sin(delta_3-delta_1) ) + ...
	V_3 * V_2 * ( G(3, 2) * cos(delta_3-delta_2) + B(3, 2) * sin(delta_3-delta_2) ) + ...
	V_3 * V_3 * ( G(3, 3) * cos(delta_3-delta_3) + B(3, 3) * sin(delta_3-delta_3) ) - P_3;

	% Q_3
	f3 = V_3 * V_1 * ( G(3, 1) * sin(delta_3-delta_1) - B(3, 1) * cos(delta_3-delta_1) ) + ...
	V_3 * V_2 * ( G(3, 2) * sin(delta_3-delta_2) - B(3, 2) * cos(delta_3-delta_2) ) + ...
	V_3 * V_3 * ( G(3, 3) * sin(delta_3-delta_3) - B(3, 3) * cos(delta_3-delta_3) ) - Q_3;

	x = [V_3; delta_2; delta_3];
	f = [f1; f2; f3];

	J = calc_jacobian(V_3, delta_2, delta_3);

	x_1 = x - J \ f;
	% A = x - inv(J) * f;
	% For solving a system of linear equations, the inverse of a matrix is primarily of theoretical value. Never use the inverse of a matrix to solve a linear system Ax=b with x=inv(A)*b, because it is slow and inaccurate.
	% Instead of multiplying by the inverse, use matrix right division (/) or matrix left division (\). That is:
	% Replace inv(A)*b with A\b
	% Replace b*inv(A) with b/A

	V_3 = x_1(1);
	delta_2 = x_1(2);
	delta_3 = x_1(3);

	iteration_num = iteration_num + 1;
end

V_2 = V_2 * exp(1j * delta_2);
V_3 = V_3 * exp(1j * delta_3);

S_1 = V_1 * conj(Y(1, 1) * V_1 + Y(1, 2) * V_2 + Y(1, 3) * V_3);
S_2 = V_2 * conj(Y(2, 1) * V_1 + Y(2, 2) * V_2 + Y(2, 3) * V_3);

S_G1 = S_1 + S_D1;
S_G2 = S_2 + S_D2;

fprintf('precision tolerance: %e\n', TOLERANCE);
fprintf('%d iterations to converge\n', iteration_num);
fprintf('\n');
fprintf('V_3: %f\n', V_3);
fprintf('delta_2: %f deg\n', rad2deg(delta_2));
fprintf('delta_3: %f deg\n', rad2deg(delta_3));
fprintf('\n');
fprintf('S_G1: %f + j%f\n', real(S_G1), imag(S_G1));
fprintf('S_G2: %f + j%f\n', real(S_G2), imag(S_G2));
