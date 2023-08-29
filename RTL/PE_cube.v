module PE_cube(
  input i_clk,
  input i_rst_n,
  input [15:0] i_weight_en,
  input [511:0] i_activation,
  input [31:0] i_Psum_from_last_tile_0,
  input [31:0] i_Psum_from_last_tile_1,
  input [31:0] i_Psum_from_last_tile_2,
  input [31:0] i_Psum_from_last_tile_3,
  input [31:0] i_Psum_from_last_tile_4,
  input [31:0] i_Psum_from_last_tile_5,
  input [31:0] i_Psum_from_last_tile_6,
  input [31:0] i_Psum_from_last_tile_7,
  input [31:0] i_Psum_from_last_tile_8,
  input [31:0] i_Psum_from_last_tile_9,
  input [31:0] i_Psum_from_last_tile_10,
  input [31:0] i_Psum_from_last_tile_11,
  input [31:0] i_Psum_from_last_tile_12,
  input [31:0] i_Psum_from_last_tile_13,
  input [31:0] i_Psum_from_last_tile_14,
  input [31:0] i_Psum_from_last_tile_15,
  input [511:0] i_weight,
  input [3:0] i_A_signed,
  input [3:0] i_W_signed,
  input [63:0] i_shift,
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

  PE_array PE_array_0(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_weight_en          (i_weight_en[0]),
    .i_activation         (i_activation),
    .i_weight             (i_weight),
    .i_Psum_from_last_tile(i_Psum_from_last_tile_0),
    .i_A_signed           (i_A_signed),
    .i_W_signed           (i_W_signed),
    .i_shift              (i_shift),
    .i_strategy_2_en      (i_strategy_2_en),
    .i_accumulation       (i_accumulation),
    .o_result_strategy1   (o_result_0_strategy1),
    .o_result_strategy2   (o_result_0_strategy2)
  );

  PE_array PE_array_1(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_weight_en          (i_weight_en[1]),
    .i_activation         (i_activation),
    .i_weight             (i_weight),
    .i_Psum_from_last_tile(i_Psum_from_last_tile_1),
    .i_A_signed           (i_A_signed),
    .i_W_signed           (i_W_signed),
    .i_shift              (i_shift),
    .i_strategy_2_en      (i_strategy_2_en),
    .i_accumulation       (i_accumulation),
    .o_result_strategy1   (o_result_1_strategy1),
    .o_result_strategy2   (o_result_1_strategy2)
  );

  PE_array PE_array_2(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_weight_en          (i_weight_en[2]),
    .i_activation         (i_activation),
    .i_weight             (i_weight),
    .i_Psum_from_last_tile(i_Psum_from_last_tile_2),
    .i_A_signed           (i_A_signed),
    .i_W_signed           (i_W_signed),
    .i_shift              (i_shift),
    .i_strategy_2_en      (i_strategy_2_en),
    .i_accumulation       (i_accumulation),
    .o_result_strategy1   (o_result_2_strategy1),
    .o_result_strategy2   (o_result_2_strategy2)
  );

  PE_array PE_array_3(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_weight_en          (i_weight_en[3]),
    .i_activation         (i_activation),
    .i_weight             (i_weight),
    .i_Psum_from_last_tile(i_Psum_from_last_tile_3),
    .i_A_signed           (i_A_signed),
    .i_W_signed           (i_W_signed),
    .i_shift              (i_shift),
    .i_strategy_2_en      (i_strategy_2_en),
    .i_accumulation       (i_accumulation),
    .o_result_strategy1   (o_result_3_strategy1),
    .o_result_strategy2   (o_result_3_strategy2)
  );

  PE_array PE_array_4(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_weight_en          (i_weight_en[4]),
    .i_activation         (i_activation),
    .i_weight             (i_weight),
    .i_Psum_from_last_tile(i_Psum_from_last_tile_4),
    .i_A_signed           (i_A_signed),
    .i_W_signed           (i_W_signed),
    .i_shift              (i_shift),
    .i_strategy_2_en      (i_strategy_2_en),
    .i_accumulation       (i_accumulation),
    .o_result_strategy1   (o_result_4_strategy1),
    .o_result_strategy2   (o_result_4_strategy2)
  );

  PE_array PE_array_5(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_weight_en          (i_weight_en[5]),
    .i_activation         (i_activation),
    .i_weight             (i_weight),
    .i_Psum_from_last_tile(i_Psum_from_last_tile_5),
    .i_A_signed           (i_A_signed),
    .i_W_signed           (i_W_signed),
    .i_shift              (i_shift),
    .i_strategy_2_en      (i_strategy_2_en),
    .i_accumulation       (i_accumulation),
    .o_result_strategy1   (o_result_5_strategy1),
    .o_result_strategy2   (o_result_5_strategy2)
  );

  PE_array PE_array_6(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_weight_en          (i_weight_en[6]),
    .i_activation         (i_activation),
    .i_weight             (i_weight),
    .i_Psum_from_last_tile(i_Psum_from_last_tile_6),
    .i_A_signed           (i_A_signed),
    .i_W_signed           (i_W_signed),
    .i_shift              (i_shift),
    .i_strategy_2_en      (i_strategy_2_en),
    .i_accumulation       (i_accumulation),
    .o_result_strategy1   (o_result_6_strategy1),
    .o_result_strategy2   (o_result_6_strategy2)
  );

  PE_array PE_array_7(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_weight_en          (i_weight_en[7]),
    .i_activation         (i_activation),
    .i_weight             (i_weight),
    .i_Psum_from_last_tile(i_Psum_from_last_tile_7),
    .i_A_signed           (i_A_signed),
    .i_W_signed           (i_W_signed),
    .i_shift              (i_shift),
    .i_strategy_2_en      (i_strategy_2_en),
    .i_accumulation       (i_accumulation),
    .o_result_strategy1   (o_result_7_strategy1),
    .o_result_strategy2   (o_result_7_strategy2)
  );

  PE_array PE_array_8(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_weight_en          (i_weight_en[8]),
    .i_activation         (i_activation),
    .i_weight             (i_weight),
    .i_Psum_from_last_tile(i_Psum_from_last_tile_8),
    .i_A_signed           (i_A_signed),
    .i_W_signed           (i_W_signed),
    .i_shift              (i_shift),
    .i_strategy_2_en      (i_strategy_2_en),
    .i_accumulation       (i_accumulation),
    .o_result_strategy1   (o_result_8_strategy1),
    .o_result_strategy2   (o_result_8_strategy2)
  );

  PE_array PE_array_9(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_weight_en          (i_weight_en[9]),
    .i_activation         (i_activation),
    .i_weight             (i_weight),
    .i_Psum_from_last_tile(i_Psum_from_last_tile_9),
    .i_A_signed           (i_A_signed),
    .i_W_signed           (i_W_signed),
    .i_shift              (i_shift),
    .i_strategy_2_en      (i_strategy_2_en),
    .i_accumulation       (i_accumulation),
    .o_result_strategy1   (o_result_9_strategy1),
    .o_result_strategy2   (o_result_9_strategy2)
  );

  PE_array PE_array_10(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_weight_en          (i_weight_en[10]),
    .i_activation         (i_activation),
    .i_weight             (i_weight),
    .i_Psum_from_last_tile(i_Psum_from_last_tile_10),
    .i_A_signed           (i_A_signed),
    .i_W_signed           (i_W_signed),
    .i_shift              (i_shift),
    .i_strategy_2_en      (i_strategy_2_en),
    .i_accumulation       (i_accumulation),
    .o_result_strategy1   (o_result_10_strategy1),
    .o_result_strategy2   (o_result_10_strategy2)
  );

  PE_array PE_array_11(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_weight_en          (i_weight_en[11]),
    .i_activation         (i_activation),
    .i_weight             (i_weight),
    .i_Psum_from_last_tile(i_Psum_from_last_tile_11),
    .i_A_signed           (i_A_signed),
    .i_W_signed           (i_W_signed),
    .i_shift              (i_shift),
    .i_strategy_2_en      (i_strategy_2_en),
    .i_accumulation       (i_accumulation),
    .o_result_strategy1   (o_result_11_strategy1),
    .o_result_strategy2   (o_result_11_strategy2)
  );

  PE_array PE_array_12(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_weight_en          (i_weight_en[12]),
    .i_activation         (i_activation),
    .i_weight             (i_weight),
    .i_Psum_from_last_tile(i_Psum_from_last_tile_12),
    .i_A_signed           (i_A_signed),
    .i_W_signed           (i_W_signed),
    .i_shift              (i_shift),
    .i_strategy_2_en      (i_strategy_2_en),
    .i_accumulation       (i_accumulation),
    .o_result_strategy1   (o_result_12_strategy1),
    .o_result_strategy2   (o_result_12_strategy2)
  );

  PE_array PE_array_13(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_weight_en          (i_weight_en[13]),
    .i_activation         (i_activation),
    .i_weight             (i_weight),
    .i_Psum_from_last_tile(i_Psum_from_last_tile_13),
    .i_A_signed           (i_A_signed),
    .i_W_signed           (i_W_signed),
    .i_shift              (i_shift),
    .i_strategy_2_en      (i_strategy_2_en),
    .i_accumulation       (i_accumulation),
    .o_result_strategy1   (o_result_13_strategy1),
    .o_result_strategy2   (o_result_13_strategy2)
  );

  PE_array PE_array_14(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_weight_en          (i_weight_en[14]),
    .i_activation         (i_activation),
    .i_weight             (i_weight),
    .i_Psum_from_last_tile(i_Psum_from_last_tile_14),
    .i_A_signed           (i_A_signed),
    .i_W_signed           (i_W_signed),
    .i_shift              (i_shift),
    .i_strategy_2_en      (i_strategy_2_en),
    .i_accumulation       (i_accumulation),
    .o_result_strategy1   (o_result_14_strategy1),
    .o_result_strategy2   (o_result_14_strategy2)
  );

  PE_array PE_array_15(
    .i_clk                (i_clk),
    .i_rst_n              (i_rst_n),
    .i_weight_en          (i_weight_en[15]),
    .i_activation         (i_activation),
    .i_weight             (i_weight),
    .i_Psum_from_last_tile(i_Psum_from_last_tile_15),
    .i_A_signed           (i_A_signed),
    .i_W_signed           (i_W_signed),
    .i_shift              (i_shift),
    .i_strategy_2_en      (i_strategy_2_en),
    .i_accumulation       (i_accumulation),
    .o_result_strategy1   (o_result_15_strategy1),
    .o_result_strategy2   (o_result_15_strategy2)
  );


endmodule