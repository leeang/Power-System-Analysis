function J = calc_jacobian(V_3, delta_2, delta_3)
	J = zeros(3);
	J(1, 1) = (832*sin(delta_2 - delta_3))/25 - (416*cos(delta_2 - delta_3))/25;
	J(1, 2) = (819*cos(delta_2))/25 + (273*sin(delta_2))/25 + (26*V_3*(32*cos(delta_2 - delta_3) + 16*sin(delta_2 - delta_3)))/25;
	J(1, 3) = -(26*V_3*(32*cos(delta_2 - delta_3) + 16*sin(delta_2 - delta_3)))/25;

	J(2, 1) = 52*V_3 - (21*cos(delta_3))/2 + 21*sin(delta_3) - (416*cos(delta_2 - delta_3))/25 - (832*sin(delta_2 - delta_3))/25;
	J(2, 2) = -(26*V_3*(32*cos(delta_2 - delta_3) - 16*sin(delta_2 - delta_3)))/25;
	J(2, 3) = (21*V_3*(20*cos(delta_3) + 10*sin(delta_3)))/20 + (26*V_3*(32*cos(delta_2 - delta_3) - 16*sin(delta_2 - delta_3)))/25;

	J(3, 1) = 104*V_3 - 21*cos(delta_3) - (21*sin(delta_3))/2 - (832*cos(delta_2 - delta_3))/25 + (416*sin(delta_2 - delta_3))/25;
	J(3, 2) = (26*V_3*(16*cos(delta_2 - delta_3) + 32*sin(delta_2 - delta_3)))/25;
	J(3, 3) = - (21*V_3*(10*cos(delta_3) - 20*sin(delta_3)))/20 - (26*V_3*(16*cos(delta_2 - delta_3) + 32*sin(delta_2 - delta_3)))/25;
end
