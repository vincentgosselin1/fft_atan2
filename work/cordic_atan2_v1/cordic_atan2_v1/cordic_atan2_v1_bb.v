
module cordic_atan2_v1 (
	clk,
	areset,
	x,
	y,
	q,
	en);	

	input		clk;
	input		areset;
	input	[15:0]	x;
	input	[15:0]	y;
	output	[15:0]	q;
	input	[0:0]	en;
endmodule
