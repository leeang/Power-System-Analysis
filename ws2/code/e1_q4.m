clear;

lambda = 1;
pf = 0.8;
BETA = sqrt(1 - pf^2) / pf;
P = 0.1;

P_D_cr = 0.49498825;

index = 1;
while P*lambda*pf <= P_D_cr
	P_vector(index) = P * lambda * pf;
	V(:, index) = solve_eq3(P_vector(index), BETA);

	lambda = lambda + 0.1;
	index = index + 1;
end

P_vector(index) = P_D_cr;
V(:, index) = solve_eq3(P_vector(index), BETA);

save('e1_q4', 'P_vector', 'V');

plot(P_vector, V);
xlabel('P (pu)');
ylabel('V (pu)');
title('P-V curve (pf = 0.8 lagging)');
legend('stable', 'unstable');
grid on;
