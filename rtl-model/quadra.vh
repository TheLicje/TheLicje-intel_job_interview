// quadra.vh

`ifndef QUADRA_VH
`define QUADRA_VH

typedef logic ck_t; // clock
typedef logic rs_t; // reset
typedef logic dv_t; // data valid

// --------------------------------------------------------------------------------
// I/O precision
// --------------------------------------------------------------------------------

// x in [0,2) -> u1.23
localparam int  X_I =  1;          //         =  1
localparam int  X_F = 23;          //         = 23
localparam int  X_W = X_I + X_F;   //  1 + 23 = 24 (u1.23)

typedef logic [X_W-1:0] x_t;

// y [-2,2) -> s2.23
localparam int  Y_I =  2;          //         =  2
localparam int  Y_F = 23;          //         = 23
localparam int  Y_W = X_I + X_F;   //  2 + 23 = 25 (s2.23)

typedef logic signed [Y_W-1:0] y_t;

// --------------------------------------------------------------------------------
// Internal precision:
// --------------------------------------------------------------------------------

// <challenge!>

// x1: x[23:17] -> u1.6
typedef logic [6:0] x1_t;

// x2: x[16:0] -> u0.17
typedef logic [16:0] x2_t;

// sq: x2[16:0] * x2[16:0] -> u0.34
typedef logic [33:0] sq_t;

// a -> s1.23
localparam int  A_I =  1;          //         =  1
localparam int  A_F = 23;          //         = 23
localparam int  A_W = A_I + A_F;   //  1 + 23 = 24 (s1.23)

typedef logic signed [A_W-1:0] a_t;

// b -> s3.16
localparam int  B_I =  3;          //         =  3
localparam int  B_F = 16;          //         = 16
localparam int  B_W = B_I + B_F;   //  3 + 16 = 19 (s3.16)

typedef logic signed [B_W-1:0] b_t;

// a -> s2.11
localparam int  C_I =  2;          //         =  2
localparam int  C_F = 11;          //         = 11
localparam int  C_W = C_I + C_F;   //  2 + 11 = 13 (s2.11)

typedef logic signed [C_W-1:0] c_t;

`endif
