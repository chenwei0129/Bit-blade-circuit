module maxpooling_strategy1(
  input i_clk,
  input i_rst_n,
  input i_max_rst,
  input i_maxpool,
  input signed [31:0] i_result_0_for_strategy1,
  input signed [31:0] i_result_1_for_strategy1,
  input signed [31:0] i_result_2_for_strategy1,
  input signed [31:0] i_result_3_for_strategy1,
  input signed [31:0] i_result_4_for_strategy1,
  input signed [31:0] i_result_5_for_strategy1,
  input signed [31:0] i_result_6_for_strategy1,
  input signed [31:0] i_result_7_for_strategy1,
  input signed [31:0] i_result_8_for_strategy1,
  input signed [31:0] i_result_9_for_strategy1,
  input signed [31:0] i_result_10_for_strategy1,
  input signed [31:0] i_result_11_for_strategy1,
  input signed [31:0] i_result_12_for_strategy1,
  input signed [31:0] i_result_13_for_strategy1,
  input signed [31:0] i_result_14_for_strategy1,
  input signed [31:0] i_result_15_for_strategy1,
  output signed [31:0] o_result_0_for_strategy1,
  output signed [31:0] o_result_1_for_strategy1,
  output signed [31:0] o_result_2_for_strategy1,
  output signed [31:0] o_result_3_for_strategy1,
  output signed [31:0] o_result_4_for_strategy1,
  output signed [31:0] o_result_5_for_strategy1,
  output signed [31:0] o_result_6_for_strategy1,
  output signed [31:0] o_result_7_for_strategy1,
  output signed [31:0] o_result_8_for_strategy1,
  output signed [31:0] o_result_9_for_strategy1,
  output signed [31:0] o_result_10_for_strategy1,
  output signed [31:0] o_result_11_for_strategy1,
  output signed [31:0] o_result_12_for_strategy1,
  output signed [31:0] o_result_13_for_strategy1,
  output signed [31:0] o_result_14_for_strategy1,
  output signed [31:0] o_result_15_for_strategy1
);

  compare_reg_for_strategy1 compare_reg_for_strategy1_0(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_max_rst    (i_max_rst),
    .i_maxpool    (i_maxpool),
    .i_result       (i_result_0_for_strategy1),
    .o_max        (o_result_0_for_strategy1)
);

  compare_reg_for_strategy1 compare_reg_for_strategy1_1(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_max_rst    (i_max_rst),
    .i_maxpool    (i_maxpool),
    .i_result       (i_result_1_for_strategy1),
    .o_max        (o_result_1_for_strategy1)
);

  compare_reg_for_strategy1 compare_reg_for_strategy1_2(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_max_rst    (i_max_rst),
    .i_maxpool    (i_maxpool),
    .i_result       (i_result_2_for_strategy1),
    .o_max        (o_result_2_for_strategy1)
);

  compare_reg_for_strategy1 compare_reg_for_strategy1_3(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_max_rst    (i_max_rst),
    .i_maxpool    (i_maxpool),
    .i_result       (i_result_3_for_strategy1),
    .o_max        (o_result_3_for_strategy1)
);

  compare_reg_for_strategy1 compare_reg_for_strategy1_4(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_max_rst    (i_max_rst),
    .i_maxpool    (i_maxpool),
    .i_result       (i_result_4_for_strategy1),
    .o_max        (o_result_4_for_strategy1)
);

  compare_reg_for_strategy1 compare_reg_for_strategy1_5(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_max_rst    (i_max_rst),
    .i_maxpool    (i_maxpool),
    .i_result       (i_result_5_for_strategy1),
    .o_max        (o_result_5_for_strategy1)
);

  compare_reg_for_strategy1 compare_reg_for_strategy1_6(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_max_rst    (i_max_rst),
    .i_maxpool    (i_maxpool),
    .i_result       (i_result_6_for_strategy1),
    .o_max        (o_result_6_for_strategy1)
);

  compare_reg_for_strategy1 compare_reg_for_strategy1_7(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_max_rst    (i_max_rst),
    .i_maxpool    (i_maxpool),
    .i_result       (i_result_7_for_strategy1),
    .o_max        (o_result_7_for_strategy1)
);

  compare_reg_for_strategy1 compare_reg_for_strategy1_8(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_max_rst    (i_max_rst),
    .i_maxpool    (i_maxpool),
    .i_result       (i_result_8_for_strategy1),
    .o_max        (o_result_8_for_strategy1)
);

  compare_reg_for_strategy1 compare_reg_for_strategy1_9(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_max_rst    (i_max_rst),
    .i_maxpool    (i_maxpool),
    .i_result       (i_result_9_for_strategy1),
    .o_max        (o_result_9_for_strategy1)
);

  compare_reg_for_strategy1 compare_reg_for_strategy1_10(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_max_rst    (i_max_rst),
    .i_maxpool    (i_maxpool),
    .i_result       (i_result_10_for_strategy1),
    .o_max        (o_result_10_for_strategy1)
);

  compare_reg_for_strategy1 compare_reg_for_strategy1_11(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_max_rst    (i_max_rst),
    .i_maxpool    (i_maxpool),
    .i_result       (i_result_11_for_strategy1),
    .o_max        (o_result_11_for_strategy1)
);

  compare_reg_for_strategy1 compare_reg_for_strategy1_12(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_max_rst    (i_max_rst),
    .i_maxpool    (i_maxpool),
    .i_result       (i_result_12_for_strategy1),
    .o_max        (o_result_12_for_strategy1)
);

  compare_reg_for_strategy1 compare_reg_for_strategy1_13(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_max_rst    (i_max_rst),
    .i_maxpool    (i_maxpool),
    .i_result       (i_result_13_for_strategy1),
    .o_max        (o_result_13_for_strategy1)
);

  compare_reg_for_strategy1 compare_reg_for_strategy1_14(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_max_rst    (i_max_rst),
    .i_maxpool    (i_maxpool),
    .i_result       (i_result_14_for_strategy1),
    .o_max        (o_result_14_for_strategy1)
);

  compare_reg_for_strategy1 compare_reg_for_strategy1_15(
    .i_clk        (i_clk),
    .i_rst_n      (i_rst_n),
    .i_max_rst    (i_max_rst),
    .i_maxpool    (i_maxpool),
    .i_result       (i_result_15_for_strategy1),
    .o_max        (o_result_15_for_strategy1)
);

endmodule