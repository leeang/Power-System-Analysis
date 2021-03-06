clear;

lambda = 1;
BETA = 0;
P = 0.1;

P_D_cr = 0.98019998;

index = 1;
while P*lambda <= P_D_cr
	P_vector(index) = P * lambda;
	V(:, index) = solve_eq3(P_vector(index), BETA);

	lambda = lambda + 0.1;
	index = index + 1;
end

P_vector(index) = P_D_cr;
V(:, index) = solve_eq3(P_vector(index), BETA);

save('e1_q2', 'P_vector', 'V');

plot(P_vector, V);
xlabel('P (pu)');
ylabel('V (pu)');
title('P-V curve (pf = 1)');
legend('stable', 'unstable');
grid on;
