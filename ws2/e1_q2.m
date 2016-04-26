clear;

lambda = 4;
BETA = 0;
P = 0.1;

index = 1;
while P*lambda <= 0.98
	P_vector(index) = P * lambda;
	V(:, index) = solve_eq3(P_vector(index), BETA);

	lambda = lambda + 0.1;
	index = index + 1;
end

P_vector(index) = 0.98019998;
V(:, index) = solve_eq3(P_vector(index), 0);

plot(P_vector, V);
xlabel('P (pu)');
ylabel('V (pu)');
title('P-V curve');
