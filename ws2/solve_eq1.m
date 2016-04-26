function P_D_cr = solve_eq1(BETA)
	V_1 = 1;
	Z_line = 0.01 + 0.5j;

	Y_line = 1/Z_line;
	G_line = real(Y_line);
	B_line = imag(Y_line);
	Y_line = abs(Y_line);

	syms P_D_cr positive;
	eqn = ( 2 * P_D_cr * (G_line - BETA * B_line) - Y_line^2 * V_1^2 )^2 - 4 * Y_line^2 * P_D_cr^2 * (1 + BETA^2) == 0;

	P_D_cr = solve(eqn, 'Real', true);
	P_D_cr = double(P_D_cr);
end
