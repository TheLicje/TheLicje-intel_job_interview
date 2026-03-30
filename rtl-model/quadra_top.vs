`include "quadra.vh"

module quadra_top
(
    input  ck_t clk,
    input  rs_t rst_b,
    input  x_t  x,
    input  dv_t x_dv,
    output y_t  y,
    output dv_t y_dv
);
    // Pipeline data valid (3 stages):
    dv_t dv_p0, dv_p1, dv_p2;

    always_ff @(posedge clk)
    if (!rst_b) begin
        dv_p0 <= '0;
        dv_p1 <= '0;
        dv_p2 <= '0;
    end
    else begin
        dv_p0 <= x_dv;
        dv_p1 <= dv_p0;
        dv_p2 <= dv_p1;
    end

    // <challenge!>

	x1_t x1_comb;
    x2_t x2_comb;
    a_t  a_comb;
    b_t  b_comb;
    c_t  c_comb;
    sq_t sq_comb;
    y_t  y_comb;

	x_t  x_p0;
    a_t  a_p1;
    b_t  b_p1;
    c_t  c_p1;
    x2_t x2_p1;
    sq_t sq_p1;
    y_t  y_p2;

	always_ff @(posedge clk) begin
		if (!rst_b) begin
            x_p0  <= '0;
            a_p1  <= '0;
            b_p1  <= '0;
            c_p1  <= '0;
            x2_p1 <= '0;
            sq_p1 <= '0;
            y_p2  <= '0;
		end else begin
			// stage 1
			x_p0 <= x;

			// stage 2
			a_p1  <= a_comb;
            b_p1  <= b_comb;
            c_p1  <= c_comb;
            x2_p1 <= x2_comb;
            sq_p1 <= sq_comb;

			// stage 3
			y_p2  <= y_comb;

		end
	end

	assign x1_comb = x_p0[23:17];
	assign x2_comb = x_p0[16:0];

	lut u_lut (
		.x1(x1_comb),
		.a(a_comb),
		.b(b_comb),
		.c(c_comb)
	);

	square u_square (
		.x2(x2_comb),
		.sq(sq_comb)
	);

	quadra u_quadra (
		.a(a_p1),
        .b(b_p1),
        .c(c_p1),
        .x2(x2_p1),
        .sq(sq_p1),
        .y(y_comb)
	);

    // Outputs:
    always_comb y_dv = dv_p2;
    always_comb y    = y_p2;

endmodule
