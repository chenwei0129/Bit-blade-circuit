module PE_cube_with_buffer(
  input  i_clk,
  input  i_rst_n,
  input  [511:0] i_src_A,
  input  [511:0] i_src_W,
  input  [31:0] i_Psum_from_last_tile_0,
  input  [31:0] i_Psum_from_last_tile_1,
  input  [31:0] i_Psum_from_last_tile_2,
  input  [31:0] i_Psum_from_last_tile_3,
  input  [31:0] i_Psum_from_last_tile_4,
  input  [31:0] i_Psum_from_last_tile_5,
  input  [31:0] i_Psum_from_last_tile_6,
  input  [31:0] i_Psum_from_last_tile_7,
  input  [31:0] i_Psum_from_last_tile_8,
  input  [31:0] i_Psum_from_last_tile_9,
  input  [31:0] i_Psum_from_last_tile_10,
  input  [31:0] i_Psum_from_last_tile_11,
  input  [31:0] i_Psum_from_last_tile_12,
  input  [31:0] i_Psum_from_last_tile_13,
  input  [31:0] i_Psum_from_last_tile_14,
  input  [31:0] i_Psum_from_last_tile_15,
  input  [3:0] i_A_signed,
  input  [3:0] i_W_signed,
  input  [2:0] i_A_arrange,
  input  [1:0] i_A_arrange_index,
  input  [1:0] i_W_arrange,
  input  [1:0] i_W_arrange_index,
  input  [63:0] i_shift,
  input  [15:0] i_W_en,
  input  i_busy_activation,
  input  i_busy_weight,
  input  i_accumulation,
  input  i_strategy_2_en,
  output signed [20:0] o_result_0_strategy1,
  output signed [20:0] o_result_1_strategy1,
  output signed [20:0] o_result_2_strategy1,
  output signed [20:0] o_result_3_strategy1,
  output signed [20:0] o_result_4_strategy1,
  output signed [20:0] o_result_5_strategy1,
  output signed [20:0] o_result_6_strategy1,
  output signed [20:0] o_result_7_strategy1,
  output signed [20:0] o_result_8_strategy1,
  output signed [20:0] o_result_9_strategy1,
  output signed [20:0] o_result_10_strategy1,
  output signed [20:0] o_result_11_strategy1,
  output signed [20:0] o_result_12_strategy1,
  output signed [20:0] o_result_13_strategy1,
  output signed [20:0] o_result_14_strategy1,
  output signed [20:0] o_result_15_strategy1,
  output signed [31:0] o_result_0_strategy2,
  output signed [31:0] o_result_1_strategy2,
  output signed [31:0] o_result_2_strategy2,
  output signed [31:0] o_result_3_strategy2,
  output signed [31:0] o_result_4_strategy2,
  output signed [31:0] o_result_5_strategy2,
  output signed [31:0] o_result_6_strategy2,
  output signed [31:0] o_result_7_strategy2,
  output signed [31:0] o_result_8_strategy2,
  output signed [31:0] o_result_9_strategy2,
  output signed [31:0] o_result_10_strategy2,
  output signed [31:0] o_result_11_strategy2,
  output signed [31:0] o_result_12_strategy2,
  output signed [31:0] o_result_13_strategy2,
  output signed [31:0] o_result_14_strategy2,
  output signed [31:0] o_result_15_strategy2
);
  wire  [127:0] src_A_0 = i_src_A[127:0];
  wire  [127:0] src_A_1 = i_src_A[255:128];
  wire  [127:0] src_A_2 = i_src_A[383:256];
  wire  [127:0] src_A_3 = i_src_A[511:384];
  wire  [127:0] src_W_0 = i_src_W[127:0];
  wire  [127:0] src_W_1 = i_src_W[255:128];
  wire  [127:0] src_W_2 = i_src_W[383:256];
  wire  [127:0] src_W_3 = i_src_W[511:384];
  
  wire [31:0] A0;
  wire [31:0] A1;
  wire [31:0] A2;
  wire [31:0] A3;
  wire [31:0] A4;
  wire [31:0] A5;
  wire [31:0] A6;
  wire [31:0] A7;
  wire [31:0] A8;
  wire [31:0] A9;
  wire [31:0] A10;
  wire [31:0] A11;
  wire [31:0] A12;
  wire [31:0] A13;
  wire [31:0] A14;
  wire [31:0] A15;
  
  wire [31:0] W0;
  wire [31:0] W1;
  wire [31:0] W2;
  wire [31:0] W3;
  wire [31:0] W4;
  wire [31:0] W5;
  wire [31:0] W6;
  wire [31:0] W7;
  wire [31:0] W8;
  wire [31:0] W9;
  wire [31:0] W10;
  wire [31:0] W11;
  wire [31:0] W12;
  wire [31:0] W13;
  wire [31:0] W14;
  wire [31:0] W15;

  wire  [127:0] src_A_0_reg;
  wire  [127:0] src_A_1_reg;
  wire  [127:0] src_A_2_reg;
  wire  [127:0] src_A_3_reg;
  wire  [511:0] src_A_DW_0to3;
  wire  [511:0] src_A_DW_4to7;
  wire  [511:0] src_A_DW_8to11;
  wire  [511:0] src_A_DW_12to15;
  wire  [127:0] src_W_0_reg;
  wire  [127:0] src_W_1_reg;
  wire  [127:0] src_W_2_reg;
  wire  [127:0] src_W_3_reg;

  input_buffer input_buffer(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_busy_A     (i_busy_activation),
    .i_busy_W     (i_busy_weight),
    .i_src_A_0    (src_A_0),
    .i_src_A_1    (src_A_1),
    .i_src_A_2    (src_A_2),
    .i_src_A_3    (src_A_3),
    .i_src_W_0    (src_W_0),
    .i_src_W_1    (src_W_1),
    .i_src_W_2    (src_W_2),
    .i_src_W_3    (src_W_3),
    .o_src_A_0    (src_A_0_reg),
    .o_src_A_1    (src_A_1_reg),
    .o_src_A_2    (src_A_2_reg),
    .o_src_A_3    (src_A_3_reg),
    .o_src_W_0    (src_W_0_reg),
    .o_src_W_1    (src_W_1_reg),
    .o_src_W_2    (src_W_2_reg),
    .o_src_W_3    (src_W_3_reg)
  );

  activation_arrange activation_arrange(
    .i_clk            (i_clk),
    .i_rst_n          (i_rst_n),
    .i_src_A_0        (src_A_0_reg),
    .i_src_A_1        (src_A_1_reg),
    .i_src_A_2        (src_A_2_reg),
    .i_src_A_3        (src_A_3_reg),
    .i_A_arrange      (i_A_arrange),
    .i_A_arrange_index(i_A_arrange_index),
    .o_A0             (A0),       
    .o_A1             (A1),       
    .o_A2             (A2),       
    .o_A3             (A3),       
    .o_A4             (A4),       
    .o_A5             (A5),       
    .o_A6             (A6),       
    .o_A7             (A7),       
    .o_A8             (A8),       
    .o_A9             (A9),       
    .o_A10            (A10),      
    .o_A11            (A11),      
    .o_A12            (A12),      
    .o_A13            (A13),      
    .o_A14            (A14),      
    .o_A15            (A15)   
  );
  
  weight_arrange weight_arrange(
    .i_clk            (i_clk),
    .i_rst_n          (i_rst_n),
    .i_src_W_0        (src_W_0_reg),
    .i_src_W_1        (src_W_1_reg),
    .i_src_W_2        (src_W_2_reg),
    .i_src_W_3        (src_W_3_reg),
    .i_W_arrange      (i_W_arrange),  
    .i_W_arrange_index(i_W_arrange_index),
    .o_W0             (W0),       
    .o_W1             (W1),       
    .o_W2             (W2),       
    .o_W3             (W3),       
    .o_W4             (W4),       
    .o_W5             (W5),       
    .o_W6             (W6),       
    .o_W7             (W7),       
    .o_W8             (W8),       
    .o_W9             (W9),       
    .o_W10            (W10),      
    .o_W11            (W11),      
    .o_W12            (W12),      
    .o_W13            (W13),      
    .o_W14            (W14),      
    .o_W15            (W15)      
  );

  ////////////////////////////////////////////////PE array/////////////////////////////////////////////////////////////////////////////
  wire [511:0] activation = {A15, A14, A13, A12, A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0};
  wire [511:0] weight = {W15, W14, W13, W12, W11, W10, W9, W8, W7, W6, W5, W4, W3, W2, W1, W0};

  PE_cube PE_cube(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_weight_en          (i_W_en),
    .i_activation         (activation),
    .i_Psum_from_last_tile_0(i_Psum_from_last_tile_0),
    .i_Psum_from_last_tile_1(i_Psum_from_last_tile_1),
    .i_Psum_from_last_tile_2(i_Psum_from_last_tile_2),
    .i_Psum_from_last_tile_3(i_Psum_from_last_tile_3),
    .i_Psum_from_last_tile_4(i_Psum_from_last_tile_4),
    .i_Psum_from_last_tile_5(i_Psum_from_last_tile_5),
    .i_Psum_from_last_tile_6(i_Psum_from_last_tile_6),
    .i_Psum_from_last_tile_7(i_Psum_from_last_tile_7),
    .i_Psum_from_last_tile_8(i_Psum_from_last_tile_8),
    .i_Psum_from_last_tile_9(i_Psum_from_last_tile_9),
    .i_Psum_from_last_tile_10(i_Psum_from_last_tile_10),
    .i_Psum_from_last_tile_11(i_Psum_from_last_tile_11),
    .i_Psum_from_last_tile_12(i_Psum_from_last_tile_12),
    .i_Psum_from_last_tile_13(i_Psum_from_last_tile_13),
    .i_Psum_from_last_tile_14(i_Psum_from_last_tile_14),
    .i_Psum_from_last_tile_15(i_Psum_from_last_tile_15),
    .i_weight             (weight),
    .i_A_signed           (i_A_signed),
    .i_W_signed           (i_W_signed),
    .i_shift              (i_shift),
    .i_accumulation       (i_accumulation),
    .i_strategy_2_en      (i_strategy_2_en),
    .o_result_0_strategy1 (o_result_0_strategy1),
    .o_result_1_strategy1 (o_result_1_strategy1),
    .o_result_2_strategy1 (o_result_2_strategy1),
    .o_result_3_strategy1 (o_result_3_strategy1),
    .o_result_4_strategy1 (o_result_4_strategy1),
    .o_result_5_strategy1 (o_result_5_strategy1),
    .o_result_6_strategy1 (o_result_6_strategy1),
    .o_result_7_strategy1 (o_result_7_strategy1),
    .o_result_8_strategy1 (o_result_8_strategy1),
    .o_result_9_strategy1 (o_result_9_strategy1),
    .o_result_10_strategy1(o_result_10_strategy1),
    .o_result_11_strategy1(o_result_11_strategy1),
    .o_result_12_strategy1(o_result_12_strategy1),
    .o_result_13_strategy1(o_result_13_strategy1),
    .o_result_14_strategy1(o_result_14_strategy1),
    .o_result_15_strategy1(o_result_15_strategy1),
    .o_result_0_strategy2 (o_result_0_strategy2),
    .o_result_1_strategy2 (o_result_1_strategy2),
    .o_result_2_strategy2 (o_result_2_strategy2),
    .o_result_3_strategy2 (o_result_3_strategy2),
    .o_result_4_strategy2 (o_result_4_strategy2),
    .o_result_5_strategy2 (o_result_5_strategy2),
    .o_result_6_strategy2 (o_result_6_strategy2),
    .o_result_7_strategy2 (o_result_7_strategy2),
    .o_result_8_strategy2 (o_result_8_strategy2),
    .o_result_9_strategy2 (o_result_9_strategy2),
    .o_result_10_strategy2(o_result_10_strategy2),
    .o_result_11_strategy2(o_result_11_strategy2),
    .o_result_12_strategy2(o_result_12_strategy2),
    .o_result_13_strategy2(o_result_13_strategy2),
    .o_result_14_strategy2(o_result_14_strategy2),
    .o_result_15_strategy2(o_result_15_strategy2)
  );

endmodule