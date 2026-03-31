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

	// b(x3.16) * x2(u0.17) = t1(s3.33); t1 LSB -> 2^-39 
	logic signed [36:0] t1;
	always_comb t1 = $signed(b) * $signed({1'b0, x2});

	// c(x2.11) * sq(u0.34) = t2(s2.45); t2 LSB -> 2^-57 
	logic signed [47:0] t2;
	always_comb t2 = $signed(c) * $signed({1'b0, sq});

	// align to y(s2.23)
	logic signed [24:0] a_aligned;
	logic signed [24:0] t1_aligned;
	logic signed [24:0] t2_aligned;
	logic signed [24:0] sum; 

	always_comb begin
		// a(s1.23) -> a_alligned(s2.23)
		a_aligned = 25'($signed(a));

		// t1(s3.33) -> t1_alligned(s2.23); 39 - 23 = 16
		t1_aligned = 25'($signed(t1) >>> 16);

		// t2(s3.45) -> t2_alligned(s2.23); 57 - 23 = 34
		t2_aligned = 25'($signed(t2)  >>> 34);

		// a(s1.23) + t1(s3.33) + t2(s3.45) = sum(s2.23)
		sum = a_aligned + t1_aligned + t2_aligned;
	end

	assign y = sum;

endmodule
