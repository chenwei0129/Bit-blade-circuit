`include "PE0.v"
`include "PE02.v"
`include "PE04.v"
`include "PE026.v"
`include "PE024.v"
`include "PE0246.v"
`include "PE02468.v"
`include "PE048.v"
`include "PE02610.v"
`include "PE0248.v"
`include "PE0246812.v"
`include "PE024610.v"
`include "brick.v"
`include "brick_adder.v"
`include "PE_ctrl.v"
`include "input_buffer.v"
`include "activation_arrange.v"
`include "weight_arrange.v"
`include "PE_array.v"
`include "PE_adder.v"
`include "PE_cube.v"
`include "PE_cube_with_buffer.v"
`include "strategy1_adder.v"
`include "strategy2_output_combine.v"
`include "accumulator_strategy1.v"
`include "accumulator_strategy2.v"

module top(
  input  i_clk,
  input  i_rst_n,
  input  i_new_tile,
  input  [20:0] i_ins,
  input  [511:0] i_src_A_0,
  input  [511:0] i_src_A_1,
  input  [511:0] i_src_A_2,
  input  [511:0] i_src_A_3,
  input  [511:0] i_src_W_0,
  input  [511:0] i_src_W_1,
  input  [511:0] i_src_W_2,
  input  [511:0] i_src_W_3,
  input signed [31:0] i_Psum_from_last_tile_0,
  input signed [31:0] i_Psum_from_last_tile_1,
  input signed [31:0] i_Psum_from_last_tile_2,
  input signed [31:0] i_Psum_from_last_tile_3,
  input signed [31:0] i_Psum_from_last_tile_4,
  input signed [31:0] i_Psum_from_last_tile_5,
  input signed [31:0] i_Psum_from_last_tile_6,
  input signed [31:0] i_Psum_from_last_tile_7,
  input signed [31:0] i_Psum_from_last_tile_8,
  input signed [31:0] i_Psum_from_last_tile_9,
  input signed [31:0] i_Psum_from_last_tile_10,
  input signed [31:0] i_Psum_from_last_tile_11,
  input signed [31:0] i_Psum_from_last_tile_12,
  input signed [31:0] i_Psum_from_last_tile_13,
  input signed [31:0] i_Psum_from_last_tile_14,
  input signed [31:0] i_Psum_from_last_tile_15,
  input  [31:0] i_Psum_from_last_tile_0_0,
  input  [31:0] i_Psum_from_last_tile_0_1,
  input  [31:0] i_Psum_from_last_tile_0_2,
  input  [31:0] i_Psum_from_last_tile_0_3,
  input  [31:0] i_Psum_from_last_tile_0_4,
  input  [31:0] i_Psum_from_last_tile_0_5,
  input  [31:0] i_Psum_from_last_tile_0_6,
  input  [31:0] i_Psum_from_last_tile_0_7,
  input  [31:0] i_Psum_from_last_tile_0_8,
  input  [31:0] i_Psum_from_last_tile_0_9,
  input  [31:0] i_Psum_from_last_tile_0_10,
  input  [31:0] i_Psum_from_last_tile_0_11,
  input  [31:0] i_Psum_from_last_tile_0_12,
  input  [31:0] i_Psum_from_last_tile_0_13,
  input  [31:0] i_Psum_from_last_tile_0_14,
  input  [31:0] i_Psum_from_last_tile_0_15,
  input  [31:0] i_Psum_from_last_tile_1_0,
  input  [31:0] i_Psum_from_last_tile_1_1,
  input  [31:0] i_Psum_from_last_tile_1_2,
  input  [31:0] i_Psum_from_last_tile_1_3,
  input  [31:0] i_Psum_from_last_tile_1_4,
  input  [31:0] i_Psum_from_last_tile_1_5,
  input  [31:0] i_Psum_from_last_tile_1_6,
  input  [31:0] i_Psum_from_last_tile_1_7,
  input  [31:0] i_Psum_from_last_tile_1_8,
  input  [31:0] i_Psum_from_last_tile_1_9,
  input  [31:0] i_Psum_from_last_tile_1_10,
  input  [31:0] i_Psum_from_last_tile_1_11,
  input  [31:0] i_Psum_from_last_tile_1_12,
  input  [31:0] i_Psum_from_last_tile_1_13,
  input  [31:0] i_Psum_from_last_tile_1_14,
  input  [31:0] i_Psum_from_last_tile_1_15,
  input  [31:0] i_Psum_from_last_tile_2_0,
  input  [31:0] i_Psum_from_last_tile_2_1,
  input  [31:0] i_Psum_from_last_tile_2_2,
  input  [31:0] i_Psum_from_last_tile_2_3,
  input  [31:0] i_Psum_from_last_tile_2_4,
  input  [31:0] i_Psum_from_last_tile_2_5,
  input  [31:0] i_Psum_from_last_tile_2_6,
  input  [31:0] i_Psum_from_last_tile_2_7,
  input  [31:0] i_Psum_from_last_tile_2_8,
  input  [31:0] i_Psum_from_last_tile_2_9,
  input  [31:0] i_Psum_from_last_tile_2_10,
  input  [31:0] i_Psum_from_last_tile_2_11,
  input  [31:0] i_Psum_from_last_tile_2_12,
  input  [31:0] i_Psum_from_last_tile_2_13,
  input  [31:0] i_Psum_from_last_tile_2_14,
  input  [31:0] i_Psum_from_last_tile_2_15,
  input  [31:0] i_Psum_from_last_tile_3_0,
  input  [31:0] i_Psum_from_last_tile_3_1,
  input  [31:0] i_Psum_from_last_tile_3_2,
  input  [31:0] i_Psum_from_last_tile_3_3,
  input  [31:0] i_Psum_from_last_tile_3_4,
  input  [31:0] i_Psum_from_last_tile_3_5,
  input  [31:0] i_Psum_from_last_tile_3_6,
  input  [31:0] i_Psum_from_last_tile_3_7,
  input  [31:0] i_Psum_from_last_tile_3_8,
  input  [31:0] i_Psum_from_last_tile_3_9,
  input  [31:0] i_Psum_from_last_tile_3_10,
  input  [31:0] i_Psum_from_last_tile_3_11,
  input  [31:0] i_Psum_from_last_tile_3_12,
  input  [31:0] i_Psum_from_last_tile_3_13,
  input  [31:0] i_Psum_from_last_tile_3_14,
  input  [31:0] i_Psum_from_last_tile_3_15,
  output signed [31:0] o_result_0_strategy1,
  output signed [31:0] o_result_1_strategy1,
  output signed [31:0] o_result_2_strategy1,
  output signed [31:0] o_result_3_strategy1,
  output signed [31:0] o_result_4_strategy1,
  output signed [31:0] o_result_5_strategy1,
  output signed [31:0] o_result_6_strategy1,
  output signed [31:0] o_result_7_strategy1,
  output signed [31:0] o_result_8_strategy1,
  output signed [31:0] o_result_9_strategy1,
  output signed [31:0] o_result_10_strategy1,
  output signed [31:0] o_result_11_strategy1,
  output signed [31:0] o_result_12_strategy1,
  output signed [31:0] o_result_13_strategy1,
  output signed [31:0] o_result_14_strategy1,
  output signed [31:0] o_result_15_strategy1,
  output        [127:0] o_result_0_strategy2,
  output        [127:0] o_result_1_strategy2,
  output        [127:0] o_result_2_strategy2,
  output        [127:0] o_result_3_strategy2,
  output        [127:0] o_result_4_strategy2,
  output        [127:0] o_result_5_strategy2,
  output        [127:0] o_result_6_strategy2,
  output        [127:0] o_result_7_strategy2,
  output        [127:0] o_result_8_strategy2,
  output        [127:0] o_result_9_strategy2,
  output        [127:0] o_result_10_strategy2,
  output        [127:0] o_result_11_strategy2,
  output        [127:0] o_result_12_strategy2,
  output        [127:0] o_result_13_strategy2,
  output        [127:0] o_result_14_strategy2,
  output        [127:0] o_result_15_strategy2,
  output     o_valid_P,
  output [9:0] o_addr_A,
  output [9:0] o_addr_W,
  output [9:0] o_addr_P,
  output o_valid_P_from_last_tile,
  output [9:0] o_addr_P_from_last_tile,
  output o_busy_cube,
  output o_done,
  output o_busy_activation,
  output o_busy_weight
);
  
  wire [3:0]  A_signed;
  wire [3:0]  W_signed;
  wire [63:0] shift;

  wire [2:0] A_arrange;
  wire [1:0] A_arrange_index;
  wire [1:0] W_arrange;
  wire [1:0] W_arrange_index;

  wire [15:0] W_en;

  wire signed [22:0] result_0_strategy1_before_accumulation;
  wire signed [22:0] result_1_strategy1_before_accumulation;
  wire signed [22:0] result_2_strategy1_before_accumulation;
  wire signed [22:0] result_3_strategy1_before_accumulation;
  wire signed [22:0] result_4_strategy1_before_accumulation;
  wire signed [22:0] result_5_strategy1_before_accumulation;
  wire signed [22:0] result_6_strategy1_before_accumulation;
  wire signed [22:0] result_7_strategy1_before_accumulation;
  wire signed [22:0] result_8_strategy1_before_accumulation;
  wire signed [22:0] result_9_strategy1_before_accumulation;
  wire signed [22:0] result_10_strategy1_before_accumulation;
  wire signed [22:0] result_11_strategy1_before_accumulation;
  wire signed [22:0] result_12_strategy1_before_accumulation;
  wire signed [22:0] result_13_strategy1_before_accumulation;
  wire signed [22:0] result_14_strategy1_before_accumulation;
  wire signed [22:0] result_15_strategy1_before_accumulation;

  wire signed [20:0] result_0_0_strategy1_before_add_dim;
  wire signed [20:0] result_0_1_strategy1_before_add_dim;
  wire signed [20:0] result_0_2_strategy1_before_add_dim;
  wire signed [20:0] result_0_3_strategy1_before_add_dim;
  wire signed [20:0] result_0_4_strategy1_before_add_dim;
  wire signed [20:0] result_0_5_strategy1_before_add_dim;
  wire signed [20:0] result_0_6_strategy1_before_add_dim;
  wire signed [20:0] result_0_7_strategy1_before_add_dim;
  wire signed [20:0] result_0_8_strategy1_before_add_dim;
  wire signed [20:0] result_0_9_strategy1_before_add_dim;
  wire signed [20:0] result_0_10_strategy1_before_add_dim;
  wire signed [20:0] result_0_11_strategy1_before_add_dim;
  wire signed [20:0] result_0_12_strategy1_before_add_dim;
  wire signed [20:0] result_0_13_strategy1_before_add_dim;
  wire signed [20:0] result_0_14_strategy1_before_add_dim;
  wire signed [20:0] result_0_15_strategy1_before_add_dim;
  wire signed [20:0] result_1_0_strategy1_before_add_dim;
  wire signed [20:0] result_1_1_strategy1_before_add_dim;
  wire signed [20:0] result_1_2_strategy1_before_add_dim;
  wire signed [20:0] result_1_3_strategy1_before_add_dim;
  wire signed [20:0] result_1_4_strategy1_before_add_dim;
  wire signed [20:0] result_1_5_strategy1_before_add_dim;
  wire signed [20:0] result_1_6_strategy1_before_add_dim;
  wire signed [20:0] result_1_7_strategy1_before_add_dim;
  wire signed [20:0] result_1_8_strategy1_before_add_dim;
  wire signed [20:0] result_1_9_strategy1_before_add_dim;
  wire signed [20:0] result_1_10_strategy1_before_add_dim;
  wire signed [20:0] result_1_11_strategy1_before_add_dim;
  wire signed [20:0] result_1_12_strategy1_before_add_dim;
  wire signed [20:0] result_1_13_strategy1_before_add_dim;
  wire signed [20:0] result_1_14_strategy1_before_add_dim;
  wire signed [20:0] result_1_15_strategy1_before_add_dim;
  wire signed [20:0] result_2_0_strategy1_before_add_dim;
  wire signed [20:0] result_2_1_strategy1_before_add_dim;
  wire signed [20:0] result_2_2_strategy1_before_add_dim;
  wire signed [20:0] result_2_3_strategy1_before_add_dim;
  wire signed [20:0] result_2_4_strategy1_before_add_dim;
  wire signed [20:0] result_2_5_strategy1_before_add_dim;
  wire signed [20:0] result_2_6_strategy1_before_add_dim;
  wire signed [20:0] result_2_7_strategy1_before_add_dim;
  wire signed [20:0] result_2_8_strategy1_before_add_dim;
  wire signed [20:0] result_2_9_strategy1_before_add_dim;
  wire signed [20:0] result_2_10_strategy1_before_add_dim;
  wire signed [20:0] result_2_11_strategy1_before_add_dim;
  wire signed [20:0] result_2_12_strategy1_before_add_dim;
  wire signed [20:0] result_2_13_strategy1_before_add_dim;
  wire signed [20:0] result_2_14_strategy1_before_add_dim;
  wire signed [20:0] result_2_15_strategy1_before_add_dim;
  wire signed [20:0] result_3_0_strategy1_before_add_dim;
  wire signed [20:0] result_3_1_strategy1_before_add_dim;
  wire signed [20:0] result_3_2_strategy1_before_add_dim;
  wire signed [20:0] result_3_3_strategy1_before_add_dim;
  wire signed [20:0] result_3_4_strategy1_before_add_dim;
  wire signed [20:0] result_3_5_strategy1_before_add_dim;
  wire signed [20:0] result_3_6_strategy1_before_add_dim;
  wire signed [20:0] result_3_7_strategy1_before_add_dim;
  wire signed [20:0] result_3_8_strategy1_before_add_dim;
  wire signed [20:0] result_3_9_strategy1_before_add_dim;
  wire signed [20:0] result_3_10_strategy1_before_add_dim;
  wire signed [20:0] result_3_11_strategy1_before_add_dim;
  wire signed [20:0] result_3_12_strategy1_before_add_dim;
  wire signed [20:0] result_3_13_strategy1_before_add_dim;
  wire signed [20:0] result_3_14_strategy1_before_add_dim;
  wire signed [20:0] result_3_15_strategy1_before_add_dim;

  wire signed [31:0] result_0_0_strategy2;
  wire signed [31:0] result_0_1_strategy2;
  wire signed [31:0] result_0_2_strategy2;
  wire signed [31:0] result_0_3_strategy2;
  wire signed [31:0] result_0_4_strategy2;
  wire signed [31:0] result_0_5_strategy2;
  wire signed [31:0] result_0_6_strategy2;
  wire signed [31:0] result_0_7_strategy2;
  wire signed [31:0] result_0_8_strategy2;
  wire signed [31:0] result_0_9_strategy2;
  wire signed [31:0] result_0_10_strategy2;
  wire signed [31:0] result_0_11_strategy2;
  wire signed [31:0] result_0_12_strategy2;
  wire signed [31:0] result_0_13_strategy2;
  wire signed [31:0] result_0_14_strategy2;
  wire signed [31:0] result_0_15_strategy2;
  wire signed [31:0] result_1_0_strategy2;
  wire signed [31:0] result_1_1_strategy2;
  wire signed [31:0] result_1_2_strategy2;
  wire signed [31:0] result_1_3_strategy2;
  wire signed [31:0] result_1_4_strategy2;
  wire signed [31:0] result_1_5_strategy2;
  wire signed [31:0] result_1_6_strategy2;
  wire signed [31:0] result_1_7_strategy2;
  wire signed [31:0] result_1_8_strategy2;
  wire signed [31:0] result_1_9_strategy2;
  wire signed [31:0] result_1_10_strategy2;
  wire signed [31:0] result_1_11_strategy2;
  wire signed [31:0] result_1_12_strategy2;
  wire signed [31:0] result_1_13_strategy2;
  wire signed [31:0] result_1_14_strategy2;
  wire signed [31:0] result_1_15_strategy2;
  wire signed [31:0] result_2_0_strategy2;
  wire signed [31:0] result_2_1_strategy2;
  wire signed [31:0] result_2_2_strategy2;
  wire signed [31:0] result_2_3_strategy2;
  wire signed [31:0] result_2_4_strategy2;
  wire signed [31:0] result_2_5_strategy2;
  wire signed [31:0] result_2_6_strategy2;
  wire signed [31:0] result_2_7_strategy2;
  wire signed [31:0] result_2_8_strategy2;
  wire signed [31:0] result_2_9_strategy2;
  wire signed [31:0] result_2_10_strategy2;
  wire signed [31:0] result_2_11_strategy2;
  wire signed [31:0] result_2_12_strategy2;
  wire signed [31:0] result_2_13_strategy2;
  wire signed [31:0] result_2_14_strategy2;
  wire signed [31:0] result_2_15_strategy2;
  wire signed [31:0] result_3_0_strategy2;
  wire signed [31:0] result_3_1_strategy2;
  wire signed [31:0] result_3_2_strategy2;
  wire signed [31:0] result_3_3_strategy2;
  wire signed [31:0] result_3_4_strategy2;
  wire signed [31:0] result_3_5_strategy2;
  wire signed [31:0] result_3_6_strategy2;
  wire signed [31:0] result_3_7_strategy2;
  wire signed [31:0] result_3_8_strategy2;
  wire signed [31:0] result_3_9_strategy2;
  wire signed [31:0] result_3_10_strategy2;
  wire signed [31:0] result_3_11_strategy2;
  wire signed [31:0] result_3_12_strategy2;
  wire signed [31:0] result_3_13_strategy2;
  wire signed [31:0] result_3_14_strategy2;
  wire signed [31:0] result_3_15_strategy2;

  wire valid_P;
  wire [7:0] addr_P;
  wire strategy_1_en;
  wire strategy_2_en;
  wire maxpool_rst;

  PE_ctrl PE_ctrl(
    .i_clk                   (i_clk),
    .i_rst_n                 (i_rst_n),
    .i_new_tile              (i_new_tile),
    .i_ins                   (i_ins),
    .o_strategy_1_en         (strategy_1_en),
    .o_strategy_2_en         (strategy_2_en),
    .o_A_signed              (A_signed),
    .o_W_signed              (W_signed),
    .o_A_arrange             (A_arrange),
    .o_A_arrange_index       (A_arrange_index),
    .o_W_arrange             (W_arrange),
    .o_W_arrange_index       (W_arrange_index),
    .o_shift                 (shift),
    .o_W_en                  (W_en),
    .o_valid_P               (o_valid_P),
    .o_addr_A                (o_addr_A),
    .o_addr_W                (o_addr_W),
    .o_addr_P                (o_addr_P),
    .o_valid_P_from_last_tile(o_valid_P_from_last_tile),
    .o_addr_P_from_last_tile (o_addr_P_from_last_tile),
    .o_accumulation          (accumulation),
    .o_busy_cube             (o_busy_cube),
    .o_done                  (o_done),
    .o_busy_activation       (o_busy_activation),
    .o_busy_weight           (o_busy_weight)
  );

  accumulator_strategy1 accumulator_strategy1(
    .i_clk                                    (i_clk),
    .i_rst_n                                  (i_rst_n),
    .i_strategy_1_en                          (strategy_1_en),
    .i_accumulation                           (accumulation),
    .i_Psum_from_last_tile_0                  (i_Psum_from_last_tile_0),
    .i_Psum_from_last_tile_1                  (i_Psum_from_last_tile_1),
    .i_Psum_from_last_tile_2                  (i_Psum_from_last_tile_2),
    .i_Psum_from_last_tile_3                  (i_Psum_from_last_tile_3),
    .i_Psum_from_last_tile_4                  (i_Psum_from_last_tile_4),
    .i_Psum_from_last_tile_5                  (i_Psum_from_last_tile_5),
    .i_Psum_from_last_tile_6                  (i_Psum_from_last_tile_6),
    .i_Psum_from_last_tile_7                  (i_Psum_from_last_tile_7),
    .i_Psum_from_last_tile_8                  (i_Psum_from_last_tile_8),
    .i_Psum_from_last_tile_9                  (i_Psum_from_last_tile_9),
    .i_Psum_from_last_tile_10                 (i_Psum_from_last_tile_10),
    .i_Psum_from_last_tile_11                 (i_Psum_from_last_tile_11),
    .i_Psum_from_last_tile_12                 (i_Psum_from_last_tile_12),
    .i_Psum_from_last_tile_13                 (i_Psum_from_last_tile_13),
    .i_Psum_from_last_tile_14                 (i_Psum_from_last_tile_14),
    .i_Psum_from_last_tile_15                 (i_Psum_from_last_tile_15),
    .i_result_0_strategy1_before_accumulation (result_0_strategy1_before_accumulation),
    .i_result_1_strategy1_before_accumulation (result_1_strategy1_before_accumulation),
    .i_result_2_strategy1_before_accumulation (result_2_strategy1_before_accumulation),
    .i_result_3_strategy1_before_accumulation (result_3_strategy1_before_accumulation),
    .i_result_4_strategy1_before_accumulation (result_4_strategy1_before_accumulation),
    .i_result_5_strategy1_before_accumulation (result_5_strategy1_before_accumulation),
    .i_result_6_strategy1_before_accumulation (result_6_strategy1_before_accumulation),
    .i_result_7_strategy1_before_accumulation (result_7_strategy1_before_accumulation),
    .i_result_8_strategy1_before_accumulation (result_8_strategy1_before_accumulation),
    .i_result_9_strategy1_before_accumulation (result_9_strategy1_before_accumulation),
    .i_result_10_strategy1_before_accumulation(result_10_strategy1_before_accumulation),
    .i_result_11_strategy1_before_accumulation(result_11_strategy1_before_accumulation),
    .i_result_12_strategy1_before_accumulation(result_12_strategy1_before_accumulation),
    .i_result_13_strategy1_before_accumulation(result_13_strategy1_before_accumulation),
    .i_result_14_strategy1_before_accumulation(result_14_strategy1_before_accumulation),
    .i_result_15_strategy1_before_accumulation(result_15_strategy1_before_accumulation),
    .o_result_0_strategy1                     (o_result_0_strategy1),
    .o_result_1_strategy1                     (o_result_1_strategy1),
    .o_result_2_strategy1                     (o_result_2_strategy1),
    .o_result_3_strategy1                     (o_result_3_strategy1),
    .o_result_4_strategy1                     (o_result_4_strategy1),
    .o_result_5_strategy1                     (o_result_5_strategy1),
    .o_result_6_strategy1                     (o_result_6_strategy1),
    .o_result_7_strategy1                     (o_result_7_strategy1),
    .o_result_8_strategy1                     (o_result_8_strategy1),
    .o_result_9_strategy1                     (o_result_9_strategy1),
    .o_result_10_strategy1                    (o_result_10_strategy1),
    .o_result_11_strategy1                    (o_result_11_strategy1),
    .o_result_12_strategy1                    (o_result_12_strategy1),
    .o_result_13_strategy1                    (o_result_13_strategy1),
    .o_result_14_strategy1                    (o_result_14_strategy1),
    .o_result_15_strategy1                    (o_result_15_strategy1)
  );

  strategy1_adder strategy1_adder(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_strategy_en(strategy_1_en),
    .i_result_0_0   (result_0_0_strategy1_before_add_dim),
    .i_result_0_1   (result_0_1_strategy1_before_add_dim),
    .i_result_0_2   (result_0_2_strategy1_before_add_dim),
    .i_result_0_3   (result_0_3_strategy1_before_add_dim),
    .i_result_0_4   (result_0_4_strategy1_before_add_dim),
    .i_result_0_5   (result_0_5_strategy1_before_add_dim),
    .i_result_0_6   (result_0_6_strategy1_before_add_dim),
    .i_result_0_7   (result_0_7_strategy1_before_add_dim),
    .i_result_0_8   (result_0_8_strategy1_before_add_dim),
    .i_result_0_9   (result_0_9_strategy1_before_add_dim),
    .i_result_0_10  (result_0_10_strategy1_before_add_dim),
    .i_result_0_11  (result_0_11_strategy1_before_add_dim),
    .i_result_0_12  (result_0_12_strategy1_before_add_dim),
    .i_result_0_13  (result_0_13_strategy1_before_add_dim),
    .i_result_0_14  (result_0_14_strategy1_before_add_dim),
    .i_result_0_15  (result_0_15_strategy1_before_add_dim),
    .i_result_1_0   (result_1_0_strategy1_before_add_dim),
    .i_result_1_1   (result_1_1_strategy1_before_add_dim),
    .i_result_1_2   (result_1_2_strategy1_before_add_dim),
    .i_result_1_3   (result_1_3_strategy1_before_add_dim),
    .i_result_1_4   (result_1_4_strategy1_before_add_dim),
    .i_result_1_5   (result_1_5_strategy1_before_add_dim),
    .i_result_1_6   (result_1_6_strategy1_before_add_dim),
    .i_result_1_7   (result_1_7_strategy1_before_add_dim),
    .i_result_1_8   (result_1_8_strategy1_before_add_dim),
    .i_result_1_9   (result_1_9_strategy1_before_add_dim),
    .i_result_1_10  (result_1_10_strategy1_before_add_dim),
    .i_result_1_11  (result_1_11_strategy1_before_add_dim),
    .i_result_1_12  (result_1_12_strategy1_before_add_dim),
    .i_result_1_13  (result_1_13_strategy1_before_add_dim),
    .i_result_1_14  (result_1_14_strategy1_before_add_dim),
    .i_result_1_15  (result_1_15_strategy1_before_add_dim),
    .i_result_2_0   (result_2_0_strategy1_before_add_dim),
    .i_result_2_1   (result_2_1_strategy1_before_add_dim),
    .i_result_2_2   (result_2_2_strategy1_before_add_dim),
    .i_result_2_3   (result_2_3_strategy1_before_add_dim),
    .i_result_2_4   (result_2_4_strategy1_before_add_dim),
    .i_result_2_5   (result_2_5_strategy1_before_add_dim),
    .i_result_2_6   (result_2_6_strategy1_before_add_dim),
    .i_result_2_7   (result_2_7_strategy1_before_add_dim),
    .i_result_2_8   (result_2_8_strategy1_before_add_dim),
    .i_result_2_9   (result_2_9_strategy1_before_add_dim),
    .i_result_2_10  (result_2_10_strategy1_before_add_dim),
    .i_result_2_11  (result_2_11_strategy1_before_add_dim),
    .i_result_2_12  (result_2_12_strategy1_before_add_dim),
    .i_result_2_13  (result_2_13_strategy1_before_add_dim),
    .i_result_2_14  (result_2_14_strategy1_before_add_dim),
    .i_result_2_15  (result_2_15_strategy1_before_add_dim),
    .i_result_3_0   (result_3_0_strategy1_before_add_dim),
    .i_result_3_1   (result_3_1_strategy1_before_add_dim),
    .i_result_3_2   (result_3_2_strategy1_before_add_dim),
    .i_result_3_3   (result_3_3_strategy1_before_add_dim),
    .i_result_3_4   (result_3_4_strategy1_before_add_dim),
    .i_result_3_5   (result_3_5_strategy1_before_add_dim),
    .i_result_3_6   (result_3_6_strategy1_before_add_dim),
    .i_result_3_7   (result_3_7_strategy1_before_add_dim),
    .i_result_3_8   (result_3_8_strategy1_before_add_dim),
    .i_result_3_9   (result_3_9_strategy1_before_add_dim),
    .i_result_3_10  (result_3_10_strategy1_before_add_dim),
    .i_result_3_11  (result_3_11_strategy1_before_add_dim),
    .i_result_3_12  (result_3_12_strategy1_before_add_dim),
    .i_result_3_13  (result_3_13_strategy1_before_add_dim),
    .i_result_3_14  (result_3_14_strategy1_before_add_dim),
    .i_result_3_15  (result_3_15_strategy1_before_add_dim),
    .o_result_0     (result_0_strategy1_before_accumulation),//For strategy 1, these signals(below) need to accumulate with psum.
    .o_result_1     (result_1_strategy1_before_accumulation),
    .o_result_2     (result_2_strategy1_before_accumulation),
    .o_result_3     (result_3_strategy1_before_accumulation),
    .o_result_4     (result_4_strategy1_before_accumulation),
    .o_result_5     (result_5_strategy1_before_accumulation),
    .o_result_6     (result_6_strategy1_before_accumulation),
    .o_result_7     (result_7_strategy1_before_accumulation),
    .o_result_8     (result_8_strategy1_before_accumulation),
    .o_result_9     (result_9_strategy1_before_accumulation),
    .o_result_10    (result_10_strategy1_before_accumulation),
    .o_result_11    (result_11_strategy1_before_accumulation),
    .o_result_12    (result_12_strategy1_before_accumulation),
    .o_result_13    (result_13_strategy1_before_accumulation),
    .o_result_14    (result_14_strategy1_before_accumulation),
    .o_result_15    (result_15_strategy1_before_accumulation)
  );

  strategy2_output_combine strategy2_output_combine(
    .i_result_0_0             (result_0_0_strategy2),
    .i_result_0_1             (result_0_1_strategy2),
    .i_result_0_2             (result_0_2_strategy2),
    .i_result_0_3             (result_0_3_strategy2),
    .i_result_0_4             (result_0_4_strategy2),
    .i_result_0_5             (result_0_5_strategy2),
    .i_result_0_6             (result_0_6_strategy2),
    .i_result_0_7             (result_0_7_strategy2),
    .i_result_0_8             (result_0_8_strategy2),
    .i_result_0_9             (result_0_9_strategy2),
    .i_result_0_10            (result_0_10_strategy2),
    .i_result_0_11            (result_0_11_strategy2),
    .i_result_0_12            (result_0_12_strategy2),
    .i_result_0_13            (result_0_13_strategy2),
    .i_result_0_14            (result_0_14_strategy2),
    .i_result_0_15            (result_0_15_strategy2),
    .i_result_1_0             (result_1_0_strategy2),
    .i_result_1_1             (result_1_1_strategy2),
    .i_result_1_2             (result_1_2_strategy2),
    .i_result_1_3             (result_1_3_strategy2),
    .i_result_1_4             (result_1_4_strategy2),
    .i_result_1_5             (result_1_5_strategy2),
    .i_result_1_6             (result_1_6_strategy2),
    .i_result_1_7             (result_1_7_strategy2),
    .i_result_1_8             (result_1_8_strategy2),
    .i_result_1_9             (result_1_9_strategy2),
    .i_result_1_10            (result_1_10_strategy2),
    .i_result_1_11            (result_1_11_strategy2),
    .i_result_1_12            (result_1_12_strategy2),
    .i_result_1_13            (result_1_13_strategy2),
    .i_result_1_14            (result_1_14_strategy2),
    .i_result_1_15            (result_1_15_strategy2),
    .i_result_2_0             (result_2_0_strategy2),
    .i_result_2_1             (result_2_1_strategy2),
    .i_result_2_2             (result_2_2_strategy2),
    .i_result_2_3             (result_2_3_strategy2),
    .i_result_2_4             (result_2_4_strategy2),
    .i_result_2_5             (result_2_5_strategy2),
    .i_result_2_6             (result_2_6_strategy2),
    .i_result_2_7             (result_2_7_strategy2),
    .i_result_2_8             (result_2_8_strategy2),
    .i_result_2_9             (result_2_9_strategy2),
    .i_result_2_10            (result_2_10_strategy2),
    .i_result_2_11            (result_2_11_strategy2),
    .i_result_2_12            (result_2_12_strategy2),
    .i_result_2_13            (result_2_13_strategy2),
    .i_result_2_14            (result_2_14_strategy2),
    .i_result_2_15            (result_2_15_strategy2),
    .i_result_3_0             (result_3_0_strategy2),
    .i_result_3_1             (result_3_1_strategy2),
    .i_result_3_2             (result_3_2_strategy2),
    .i_result_3_3             (result_3_3_strategy2),
    .i_result_3_4             (result_3_4_strategy2),
    .i_result_3_5             (result_3_5_strategy2),
    .i_result_3_6             (result_3_6_strategy2),
    .i_result_3_7             (result_3_7_strategy2),
    .i_result_3_8             (result_3_8_strategy2),
    .i_result_3_9             (result_3_9_strategy2),
    .i_result_3_10            (result_3_10_strategy2),
    .i_result_3_11            (result_3_11_strategy2),
    .i_result_3_12            (result_3_12_strategy2),
    .i_result_3_13            (result_3_13_strategy2),
    .i_result_3_14            (result_3_14_strategy2),
    .i_result_3_15            (result_3_15_strategy2),
    .o_result_0_for_strategy2 (o_result_0_strategy2),
    .o_result_1_for_strategy2 (o_result_1_strategy2),
    .o_result_2_for_strategy2 (o_result_2_strategy2),
    .o_result_3_for_strategy2 (o_result_3_strategy2),
    .o_result_4_for_strategy2 (o_result_4_strategy2),
    .o_result_5_for_strategy2 (o_result_5_strategy2),
    .o_result_6_for_strategy2 (o_result_6_strategy2),
    .o_result_7_for_strategy2 (o_result_7_strategy2),
    .o_result_8_for_strategy2 (o_result_8_strategy2),
    .o_result_9_for_strategy2 (o_result_9_strategy2),
    .o_result_10_for_strategy2(o_result_10_strategy2),
    .o_result_11_for_strategy2(o_result_11_strategy2),
    .o_result_12_for_strategy2(o_result_12_strategy2),
    .o_result_13_for_strategy2(o_result_13_strategy2),
    .o_result_14_for_strategy2(o_result_14_strategy2),
    .o_result_15_for_strategy2(o_result_15_strategy2)
);

  PE_cube_with_buffer PE_cube_with_buffer_0(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_src_A              (i_src_A_0),
    .i_src_W              (i_src_W_0),
    .i_Psum_from_last_tile_0(i_Psum_from_last_tile_0_0),
    .i_Psum_from_last_tile_1(i_Psum_from_last_tile_0_1),
    .i_Psum_from_last_tile_2(i_Psum_from_last_tile_0_2),
    .i_Psum_from_last_tile_3(i_Psum_from_last_tile_0_3),
    .i_Psum_from_last_tile_4(i_Psum_from_last_tile_0_4),
    .i_Psum_from_last_tile_5(i_Psum_from_last_tile_0_5),
    .i_Psum_from_last_tile_6(i_Psum_from_last_tile_0_6),
    .i_Psum_from_last_tile_7(i_Psum_from_last_tile_0_7),
    .i_Psum_from_last_tile_8(i_Psum_from_last_tile_0_8),
    .i_Psum_from_last_tile_9(i_Psum_from_last_tile_0_9),
    .i_Psum_from_last_tile_10(i_Psum_from_last_tile_0_10),
    .i_Psum_from_last_tile_11(i_Psum_from_last_tile_0_11),
    .i_Psum_from_last_tile_12(i_Psum_from_last_tile_0_12),
    .i_Psum_from_last_tile_13(i_Psum_from_last_tile_0_13),
    .i_Psum_from_last_tile_14(i_Psum_from_last_tile_0_14),
    .i_Psum_from_last_tile_15(i_Psum_from_last_tile_0_15),
    .i_A_signed           (A_signed),
    .i_W_signed           (W_signed),
    .i_A_arrange          (A_arrange),
    .i_A_arrange_index    (A_arrange_index),
    .i_W_arrange          (W_arrange),
    .i_W_arrange_index    (W_arrange_index),
    .i_shift              (shift),
    .i_W_en               (W_en),
    .i_busy_activation    (o_busy_activation),
    .i_busy_weight        (o_busy_weight),
    .i_accumulation       (accumulation),
    .i_strategy_2_en      (strategy_2_en),
    .o_result_0_strategy1 (result_0_0_strategy1_before_add_dim),
    .o_result_1_strategy1 (result_0_1_strategy1_before_add_dim),
    .o_result_2_strategy1 (result_0_2_strategy1_before_add_dim),
    .o_result_3_strategy1 (result_0_3_strategy1_before_add_dim),
    .o_result_4_strategy1 (result_0_4_strategy1_before_add_dim),
    .o_result_5_strategy1 (result_0_5_strategy1_before_add_dim),
    .o_result_6_strategy1 (result_0_6_strategy1_before_add_dim),
    .o_result_7_strategy1 (result_0_7_strategy1_before_add_dim),
    .o_result_8_strategy1 (result_0_8_strategy1_before_add_dim),
    .o_result_9_strategy1 (result_0_9_strategy1_before_add_dim),
    .o_result_10_strategy1(result_0_10_strategy1_before_add_dim),
    .o_result_11_strategy1(result_0_11_strategy1_before_add_dim),
    .o_result_12_strategy1(result_0_12_strategy1_before_add_dim),
    .o_result_13_strategy1(result_0_13_strategy1_before_add_dim),
    .o_result_14_strategy1(result_0_14_strategy1_before_add_dim),
    .o_result_15_strategy1(result_0_15_strategy1_before_add_dim),
    .o_result_0_strategy2 (result_0_0_strategy2),
    .o_result_1_strategy2 (result_0_1_strategy2),
    .o_result_2_strategy2 (result_0_2_strategy2),
    .o_result_3_strategy2 (result_0_3_strategy2),
    .o_result_4_strategy2 (result_0_4_strategy2),
    .o_result_5_strategy2 (result_0_5_strategy2),
    .o_result_6_strategy2 (result_0_6_strategy2),
    .o_result_7_strategy2 (result_0_7_strategy2),
    .o_result_8_strategy2 (result_0_8_strategy2),
    .o_result_9_strategy2 (result_0_9_strategy2),
    .o_result_10_strategy2(result_0_10_strategy2),
    .o_result_11_strategy2(result_0_11_strategy2),
    .o_result_12_strategy2(result_0_12_strategy2),
    .o_result_13_strategy2(result_0_13_strategy2),
    .o_result_14_strategy2(result_0_14_strategy2),
    .o_result_15_strategy2(result_0_15_strategy2)
  );

  PE_cube_with_buffer PE_cube_with_buffer_1(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_src_A              (i_src_A_1),
    .i_src_W              (i_src_W_1),
    .i_Psum_from_last_tile_0(i_Psum_from_last_tile_1_0),
    .i_Psum_from_last_tile_1(i_Psum_from_last_tile_1_1),
    .i_Psum_from_last_tile_2(i_Psum_from_last_tile_1_2),
    .i_Psum_from_last_tile_3(i_Psum_from_last_tile_1_3),
    .i_Psum_from_last_tile_4(i_Psum_from_last_tile_1_4),
    .i_Psum_from_last_tile_5(i_Psum_from_last_tile_1_5),
    .i_Psum_from_last_tile_6(i_Psum_from_last_tile_1_6),
    .i_Psum_from_last_tile_7(i_Psum_from_last_tile_1_7),
    .i_Psum_from_last_tile_8(i_Psum_from_last_tile_1_8),
    .i_Psum_from_last_tile_9(i_Psum_from_last_tile_1_9),
    .i_Psum_from_last_tile_10(i_Psum_from_last_tile_1_10),
    .i_Psum_from_last_tile_11(i_Psum_from_last_tile_1_11),
    .i_Psum_from_last_tile_12(i_Psum_from_last_tile_1_12),
    .i_Psum_from_last_tile_13(i_Psum_from_last_tile_1_13),
    .i_Psum_from_last_tile_14(i_Psum_from_last_tile_1_14),
    .i_Psum_from_last_tile_15(i_Psum_from_last_tile_1_15),
    .i_A_signed           (A_signed),
    .i_W_signed           (W_signed),
    .i_A_arrange          (A_arrange),
    .i_A_arrange_index    (A_arrange_index),
    .i_W_arrange          (W_arrange),
    .i_W_arrange_index    (W_arrange_index),
    .i_shift              (shift),
    .i_W_en               (W_en),
    .i_busy_activation    (o_busy_activation),
    .i_busy_weight        (o_busy_weight),
    .i_accumulation       (accumulation),
    .i_strategy_2_en      (strategy_2_en),
    .o_result_0_strategy1 (result_1_0_strategy1_before_add_dim),
    .o_result_1_strategy1 (result_1_1_strategy1_before_add_dim),
    .o_result_2_strategy1 (result_1_2_strategy1_before_add_dim),
    .o_result_3_strategy1 (result_1_3_strategy1_before_add_dim),
    .o_result_4_strategy1 (result_1_4_strategy1_before_add_dim),
    .o_result_5_strategy1 (result_1_5_strategy1_before_add_dim),
    .o_result_6_strategy1 (result_1_6_strategy1_before_add_dim),
    .o_result_7_strategy1 (result_1_7_strategy1_before_add_dim),
    .o_result_8_strategy1 (result_1_8_strategy1_before_add_dim),
    .o_result_9_strategy1 (result_1_9_strategy1_before_add_dim),
    .o_result_10_strategy1(result_1_10_strategy1_before_add_dim),
    .o_result_11_strategy1(result_1_11_strategy1_before_add_dim),
    .o_result_12_strategy1(result_1_12_strategy1_before_add_dim),
    .o_result_13_strategy1(result_1_13_strategy1_before_add_dim),
    .o_result_14_strategy1(result_1_14_strategy1_before_add_dim),
    .o_result_15_strategy1(result_1_15_strategy1_before_add_dim),
    .o_result_0_strategy2 (result_1_0_strategy2),
    .o_result_1_strategy2 (result_1_1_strategy2),
    .o_result_2_strategy2 (result_1_2_strategy2),
    .o_result_3_strategy2 (result_1_3_strategy2),
    .o_result_4_strategy2 (result_1_4_strategy2),
    .o_result_5_strategy2 (result_1_5_strategy2),
    .o_result_6_strategy2 (result_1_6_strategy2),
    .o_result_7_strategy2 (result_1_7_strategy2),
    .o_result_8_strategy2 (result_1_8_strategy2),
    .o_result_9_strategy2 (result_1_9_strategy2),
    .o_result_10_strategy2(result_1_10_strategy2),
    .o_result_11_strategy2(result_1_11_strategy2),
    .o_result_12_strategy2(result_1_12_strategy2),
    .o_result_13_strategy2(result_1_13_strategy2),
    .o_result_14_strategy2(result_1_14_strategy2),
    .o_result_15_strategy2(result_1_15_strategy2)
  );

  PE_cube_with_buffer PE_cube_with_buffer_2(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_src_A              (i_src_A_2),
    .i_src_W              (i_src_W_2),
    .i_Psum_from_last_tile_0(i_Psum_from_last_tile_2_0),
    .i_Psum_from_last_tile_1(i_Psum_from_last_tile_2_1),
    .i_Psum_from_last_tile_2(i_Psum_from_last_tile_2_2),
    .i_Psum_from_last_tile_3(i_Psum_from_last_tile_2_3),
    .i_Psum_from_last_tile_4(i_Psum_from_last_tile_2_4),
    .i_Psum_from_last_tile_5(i_Psum_from_last_tile_2_5),
    .i_Psum_from_last_tile_6(i_Psum_from_last_tile_2_6),
    .i_Psum_from_last_tile_7(i_Psum_from_last_tile_2_7),
    .i_Psum_from_last_tile_8(i_Psum_from_last_tile_2_8),
    .i_Psum_from_last_tile_9(i_Psum_from_last_tile_2_9),
    .i_Psum_from_last_tile_10(i_Psum_from_last_tile_2_10),
    .i_Psum_from_last_tile_11(i_Psum_from_last_tile_2_11),
    .i_Psum_from_last_tile_12(i_Psum_from_last_tile_2_12),
    .i_Psum_from_last_tile_13(i_Psum_from_last_tile_2_13),
    .i_Psum_from_last_tile_14(i_Psum_from_last_tile_2_14),
    .i_Psum_from_last_tile_15(i_Psum_from_last_tile_2_15),
    .i_A_signed           (A_signed),
    .i_W_signed           (W_signed),
    .i_A_arrange          (A_arrange),
    .i_A_arrange_index    (A_arrange_index),
    .i_W_arrange          (W_arrange),
    .i_W_arrange_index    (W_arrange_index),
    .i_shift              (shift),
    .i_W_en               (W_en),
    .i_busy_activation    (o_busy_activation),
    .i_busy_weight        (o_busy_weight),
    .i_accumulation       (accumulation),
    .i_strategy_2_en      (strategy_2_en),
    .o_result_0_strategy1 (result_2_0_strategy1_before_add_dim),
    .o_result_1_strategy1 (result_2_1_strategy1_before_add_dim),
    .o_result_2_strategy1 (result_2_2_strategy1_before_add_dim),
    .o_result_3_strategy1 (result_2_3_strategy1_before_add_dim),
    .o_result_4_strategy1 (result_2_4_strategy1_before_add_dim),
    .o_result_5_strategy1 (result_2_5_strategy1_before_add_dim),
    .o_result_6_strategy1 (result_2_6_strategy1_before_add_dim),
    .o_result_7_strategy1 (result_2_7_strategy1_before_add_dim),
    .o_result_8_strategy1 (result_2_8_strategy1_before_add_dim),
    .o_result_9_strategy1 (result_2_9_strategy1_before_add_dim),
    .o_result_10_strategy1(result_2_10_strategy1_before_add_dim),
    .o_result_11_strategy1(result_2_11_strategy1_before_add_dim),
    .o_result_12_strategy1(result_2_12_strategy1_before_add_dim),
    .o_result_13_strategy1(result_2_13_strategy1_before_add_dim),
    .o_result_14_strategy1(result_2_14_strategy1_before_add_dim),
    .o_result_15_strategy1(result_2_15_strategy1_before_add_dim),
    .o_result_0_strategy2 (result_2_0_strategy2),
    .o_result_1_strategy2 (result_2_1_strategy2),
    .o_result_2_strategy2 (result_2_2_strategy2),
    .o_result_3_strategy2 (result_2_3_strategy2),
    .o_result_4_strategy2 (result_2_4_strategy2),
    .o_result_5_strategy2 (result_2_5_strategy2),
    .o_result_6_strategy2 (result_2_6_strategy2),
    .o_result_7_strategy2 (result_2_7_strategy2),
    .o_result_8_strategy2 (result_2_8_strategy2),
    .o_result_9_strategy2 (result_2_9_strategy2),
    .o_result_10_strategy2(result_2_10_strategy2),
    .o_result_11_strategy2(result_2_11_strategy2),
    .o_result_12_strategy2(result_2_12_strategy2),
    .o_result_13_strategy2(result_2_13_strategy2),
    .o_result_14_strategy2(result_2_14_strategy2),
    .o_result_15_strategy2(result_2_15_strategy2)
  );

  PE_cube_with_buffer PE_cube_with_buffer_3(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_src_A              (i_src_A_3),
    .i_src_W              (i_src_W_3),
    .i_Psum_from_last_tile_0(i_Psum_from_last_tile_3_0),
    .i_Psum_from_last_tile_1(i_Psum_from_last_tile_3_1),
    .i_Psum_from_last_tile_2(i_Psum_from_last_tile_3_2),
    .i_Psum_from_last_tile_3(i_Psum_from_last_tile_3_3),
    .i_Psum_from_last_tile_4(i_Psum_from_last_tile_3_4),
    .i_Psum_from_last_tile_5(i_Psum_from_last_tile_3_5),
    .i_Psum_from_last_tile_6(i_Psum_from_last_tile_3_6),
    .i_Psum_from_last_tile_7(i_Psum_from_last_tile_3_7),
    .i_Psum_from_last_tile_8(i_Psum_from_last_tile_3_8),
    .i_Psum_from_last_tile_9(i_Psum_from_last_tile_3_9),
    .i_Psum_from_last_tile_10(i_Psum_from_last_tile_3_10),
    .i_Psum_from_last_tile_11(i_Psum_from_last_tile_3_11),
    .i_Psum_from_last_tile_12(i_Psum_from_last_tile_3_12),
    .i_Psum_from_last_tile_13(i_Psum_from_last_tile_3_13),
    .i_Psum_from_last_tile_14(i_Psum_from_last_tile_3_14),
    .i_Psum_from_last_tile_15(i_Psum_from_last_tile_3_15),
    .i_A_signed           (A_signed),
    .i_W_signed           (W_signed),
    .i_A_arrange          (A_arrange),
    .i_A_arrange_index    (A_arrange_index),
    .i_W_arrange          (W_arrange),
    .i_W_arrange_index    (W_arrange_index),
    .i_shift              (shift),
    .i_W_en               (W_en),
    .i_busy_activation    (o_busy_activation),
    .i_busy_weight        (o_busy_weight),
    .i_accumulation       (accumulation),
    .i_strategy_2_en      (strategy_2_en),
    .o_result_0_strategy1 (result_3_0_strategy1_before_add_dim),
    .o_result_1_strategy1 (result_3_1_strategy1_before_add_dim),
    .o_result_2_strategy1 (result_3_2_strategy1_before_add_dim),
    .o_result_3_strategy1 (result_3_3_strategy1_before_add_dim),
    .o_result_4_strategy1 (result_3_4_strategy1_before_add_dim),
    .o_result_5_strategy1 (result_3_5_strategy1_before_add_dim),
    .o_result_6_strategy1 (result_3_6_strategy1_before_add_dim),
    .o_result_7_strategy1 (result_3_7_strategy1_before_add_dim),
    .o_result_8_strategy1 (result_3_8_strategy1_before_add_dim),
    .o_result_9_strategy1 (result_3_9_strategy1_before_add_dim),
    .o_result_10_strategy1(result_3_10_strategy1_before_add_dim),
    .o_result_11_strategy1(result_3_11_strategy1_before_add_dim),
    .o_result_12_strategy1(result_3_12_strategy1_before_add_dim),
    .o_result_13_strategy1(result_3_13_strategy1_before_add_dim),
    .o_result_14_strategy1(result_3_14_strategy1_before_add_dim),
    .o_result_15_strategy1(result_3_15_strategy1_before_add_dim),
    .o_result_0_strategy2 (result_3_0_strategy2),
    .o_result_1_strategy2 (result_3_1_strategy2),
    .o_result_2_strategy2 (result_3_2_strategy2),
    .o_result_3_strategy2 (result_3_3_strategy2),
    .o_result_4_strategy2 (result_3_4_strategy2),
    .o_result_5_strategy2 (result_3_5_strategy2),
    .o_result_6_strategy2 (result_3_6_strategy2),
    .o_result_7_strategy2 (result_3_7_strategy2),
    .o_result_8_strategy2 (result_3_8_strategy2),
    .o_result_9_strategy2 (result_3_9_strategy2),
    .o_result_10_strategy2(result_3_10_strategy2),
    .o_result_11_strategy2(result_3_11_strategy2),
    .o_result_12_strategy2(result_3_12_strategy2),
    .o_result_13_strategy2(result_3_13_strategy2),
    .o_result_14_strategy2(result_3_14_strategy2),
    .o_result_15_strategy2(result_3_15_strategy2)
  );

endmodule