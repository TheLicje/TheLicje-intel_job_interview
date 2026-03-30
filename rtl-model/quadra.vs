//
// Quadratic polynomial:  f(x) = a + b*x2 + c*(x2^2)
//

`include "quadra.vh"

module quadra
(
    // <challenge>
	input a_t a,
	input b_t b,
	input c_t c,
	input x2_t x2,
	input sq_t sq,
	output y_t y
);

    // <challenge>    

	// b(x3.16) * x2(u0.17) = t1(s3.33)
	logic signed [35:0] t1;
	always_comb t1 = b * $signed({1'b0, x2});

	// c(x2.11) * sq(u0.34) = t2(s2.45)
	logic signed [46:0] t2;
	always_comb t2 = c * $signed({1'b0, sq});

	// align to y(s2.23) with 1 guard bit 
	logic signed [25:0] a_aligned;
	logic signed [25:0] t1_aligned;
	logic signed [25:0] t2_aligned;
	logic signed [25:0] sum; 

	always_comb begin
		// a(s2.23) -> a_alligned(s2.23)
		a_aligned = 26'($signed(a));

		// t1(s3.33) -> t1_alligned(s2.23)
		t1_aligned = $signed(t1[35:10]);

		// t2(s3.45) -> t2_alligned(s2.23)
		t2_aligned = $signed(t2[46:21]);

		// a(s2.22) + t1(s3.33) + t2(s3.45) = sum(s3.23)
		sum = a_aligned + t1_aligned + t2_aligned;
	end

	// sum(s3.23) -> y(2.23)
	assign y = sum[24:0];

endmodule
