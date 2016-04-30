clear;

beta_vector = linspace(0.01, 0.03, 50);

index = 1;
for BETA = beta_vector
	V(index) = max(solve_eq3(16/50, BETA));
	index = index + 1;
end

plot(beta_vector, V);
xlabel('\beta');
ylabel('V (pu)');
title('\beta - V');
grid on;
