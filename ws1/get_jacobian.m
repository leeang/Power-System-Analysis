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

%% find Jacobian matrix
% create symbolic variables
syms V_3 delta_2 delta_3;

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

J = jacobian(f, x)
