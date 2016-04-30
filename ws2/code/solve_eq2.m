function V_2_cr = solve_eq2(P_D_cr, BETA)
	V_1 = 1;
	Z_line = 0.01 + 0.5j;

	Y_line = 1/Z_line;
	G_line = real(Y_line);
	B_line = imag(Y_line);
	Y_line = abs(Y_line);

	V_2_cr = ( Y_line^2 * V_1^2 - 2 * P_D_cr * (G_line - BETA * B_line) ) / (2 * Y_line^2);
	V_2_cr = sqrt(V_2_cr);
end
