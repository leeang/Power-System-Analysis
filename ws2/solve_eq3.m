function V_2 = solve_eq3(P_D, beta)
	V_1 = 1;
	Z_line = 0.01 + 0.5j;

	Y_line = 1/Z_line;
	G_line = real(Y_line);
	B_line = imag(Y_line);
	Y_line = abs(Y_line);

	syms V_2 positive;
	% |V_2| is positive
	eqn = V_2^4 * Y_line^2 + V_2^2 * (2 * P_D * (G_line - beta * B_line) - Y_line^2 * V_1^2) + P_D^2 * (1+beta^2) == 0;
	V_2 = solve(eqn, 'Real', true);
	% |V_2| is real
	V_2 = double(V_2);
	V_2 = sort(V_2, 'descend');
end
