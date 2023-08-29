module strategy1_adder(
  input i_clk,
  input i_rst_n,
  input i_strategy_en,
  input signed [20:0] i_result_0_0,
  input signed [20:0] i_result_0_1,
  input signed [20:0] i_result_0_2,
  input signed [20:0] i_result_0_3,
  input signed [20:0] i_result_0_4,
  input signed [20:0] i_result_0_5,
  input signed [20:0] i_result_0_6,
  input signed [20:0] i_result_0_7,
  input signed [20:0] i_result_0_8,
  input signed [20:0] i_result_0_9,
  input signed [20:0] i_result_0_10,
  input signed [20:0] i_result_0_11,
  input signed [20:0] i_result_0_12,
  input signed [20:0] i_result_0_13,
  input signed [20:0] i_result_0_14,
  input signed [20:0] i_result_0_15,
  input signed [20:0] i_result_1_0,
  input signed [20:0] i_result_1_1,
  input signed [20:0] i_result_1_2,
  input signed [20:0] i_result_1_3,
  input signed [20:0] i_result_1_4,
  input signed [20:0] i_result_1_5,
  input signed [20:0] i_result_1_6,
  input signed [20:0] i_result_1_7,
  input signed [20:0] i_result_1_8,
  input signed [20:0] i_result_1_9,
  input signed [20:0] i_result_1_10,
  input signed [20:0] i_result_1_11,
  input signed [20:0] i_result_1_12,
  input signed [20:0] i_result_1_13,
  input signed [20:0] i_result_1_14,
  input signed [20:0] i_result_1_15,
  input signed [20:0] i_result_2_0,
  input signed [20:0] i_result_2_1,
  input signed [20:0] i_result_2_2,
  input signed [20:0] i_result_2_3,
  input signed [20:0] i_result_2_4,
  input signed [20:0] i_result_2_5,
  input signed [20:0] i_result_2_6,
  input signed [20:0] i_result_2_7,
  input signed [20:0] i_result_2_8,
  input signed [20:0] i_result_2_9,
  input signed [20:0] i_result_2_10,
  input signed [20:0] i_result_2_11,
  input signed [20:0] i_result_2_12,
  input signed [20:0] i_result_2_13,
  input signed [20:0] i_result_2_14,
  input signed [20:0] i_result_2_15,
  input signed [20:0] i_result_3_0,
  input signed [20:0] i_result_3_1,
  input signed [20:0] i_result_3_2,
  input signed [20:0] i_result_3_3,
  input signed [20:0] i_result_3_4,
  input signed [20:0] i_result_3_5,
  input signed [20:0] i_result_3_6,
  input signed [20:0] i_result_3_7,
  input signed [20:0] i_result_3_8,
  input signed [20:0] i_result_3_9,
  input signed [20:0] i_result_3_10,
  input signed [20:0] i_result_3_11,
  input signed [20:0] i_result_3_12,
  input signed [20:0] i_result_3_13,
  input signed [20:0] i_result_3_14,
  input signed [20:0] i_result_3_15,
  output reg signed [22:0] o_result_0,
  output reg signed [22:0] o_result_1,
  output reg signed [22:0] o_result_2,
  output reg signed [22:0] o_result_3,
  output reg signed [22:0] o_result_4,
  output reg signed [22:0] o_result_5,
  output reg signed [22:0] o_result_6,
  output reg signed [22:0] o_result_7,
  output reg signed [22:0] o_result_8,
  output reg signed [22:0] o_result_9,
  output reg signed [22:0] o_result_10,
  output reg signed [22:0] o_result_11,
  output reg signed [22:0] o_result_12,
  output reg signed [22:0] o_result_13,
  output reg signed [22:0] o_result_14,
  output reg signed [22:0] o_result_15
);

  reg signed [21:0] temp_0_0;
  reg signed [21:0] temp_0_1;
  reg signed [21:0] temp_1_0;
  reg signed [21:0] temp_1_1;
  reg signed [21:0] temp_2_0;
  reg signed [21:0] temp_2_1;
  reg signed [21:0] temp_3_0;
  reg signed [21:0] temp_3_1;
  reg signed [21:0] temp_4_0;
  reg signed [21:0] temp_4_1;
  reg signed [21:0] temp_5_0;
  reg signed [21:0] temp_5_1;
  reg signed [21:0] temp_6_0;
  reg signed [21:0] temp_6_1;
  reg signed [21:0] temp_7_0;
  reg signed [21:0] temp_7_1;
  reg signed [21:0] temp_8_0;
  reg signed [21:0] temp_8_1;
  reg signed [21:0] temp_9_0;
  reg signed [21:0] temp_9_1;
  reg signed [21:0] temp_10_0;
  reg signed [21:0] temp_10_1;
  reg signed [21:0] temp_11_0;
  reg signed [21:0] temp_11_1;
  reg signed [21:0] temp_12_0;
  reg signed [21:0] temp_12_1;
  reg signed [21:0] temp_13_0;
  reg signed [21:0] temp_13_1;
  reg signed [21:0] temp_14_0;
  reg signed [21:0] temp_14_1;
  reg signed [21:0] temp_15_0;
  reg signed [21:0] temp_15_1;

  always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
      o_result_0   <= 23'd0;
      o_result_1   <= 23'd0;
      o_result_2   <= 23'd0;
      o_result_3   <= 23'd0;
      o_result_4   <= 23'd0;
      o_result_5   <= 23'd0;
      o_result_6   <= 23'd0;
      o_result_7   <= 23'd0;
      o_result_8   <= 23'd0;
      o_result_9   <= 23'd0;
      o_result_10  <= 23'd0;
      o_result_11  <= 23'd0;
      o_result_12  <= 23'd0;
      o_result_13  <= 23'd0;
      o_result_14  <= 23'd0;
      o_result_15  <= 23'd0;
    end else if(i_strategy_en)begin
      o_result_0   <= temp_0_0 + temp_0_1;
      o_result_1   <= temp_1_0 + temp_1_1;
      o_result_2   <= temp_2_0 + temp_2_1;
      o_result_3   <= temp_3_0 + temp_3_1;
      o_result_4   <= temp_4_0 + temp_4_1;
      o_result_5   <= temp_5_0 + temp_5_1;
      o_result_6   <= temp_6_0 + temp_6_1;
      o_result_7   <= temp_7_0 + temp_7_1;
      o_result_8   <= temp_8_0 + temp_8_1;
      o_result_9   <= temp_9_0 + temp_9_1;
      o_result_10  <= temp_10_0 + temp_10_1;
      o_result_11  <= temp_11_0 + temp_11_1;
      o_result_12  <= temp_12_0 + temp_12_1;
      o_result_13  <= temp_13_0 + temp_13_1;
      o_result_14  <= temp_14_0 + temp_14_1;
      o_result_15  <= temp_15_0 + temp_15_1;
    end
  end

  always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
      temp_0_0  <= 22'd0;
      temp_0_1  <= 22'd0;
      temp_1_0  <= 22'd0;
      temp_1_1  <= 22'd0;
      temp_2_0  <= 22'd0;
      temp_2_1  <= 22'd0;
      temp_3_0  <= 22'd0;
      temp_3_1  <= 22'd0;
      temp_4_0  <= 22'd0;
      temp_4_1  <= 22'd0;
      temp_5_0  <= 22'd0;
      temp_5_1  <= 22'd0;
      temp_6_0  <= 22'd0;
      temp_6_1  <= 22'd0;
      temp_7_0  <= 22'd0;
      temp_7_1  <= 22'd0;
      temp_8_0  <= 22'd0;
      temp_8_1  <= 22'd0;
      temp_9_0  <= 22'd0;
      temp_9_1  <= 22'd0;
      temp_10_0 <= 22'd0;
      temp_10_1 <= 22'd0;
      temp_11_0 <= 22'd0;
      temp_11_1 <= 22'd0;
      temp_12_0 <= 22'd0;
      temp_12_1 <= 22'd0;
      temp_13_0 <= 22'd0;
      temp_13_1 <= 22'd0;
      temp_14_0 <= 22'd0;
      temp_14_1 <= 22'd0;
      temp_15_0 <= 22'd0;
      temp_15_1 <= 22'd0;
    end else if(i_strategy_en)begin
      temp_0_0  <= i_result_0_0 + i_result_1_0;
      temp_0_1  <= i_result_2_0 + i_result_3_0;
      temp_1_0  <= i_result_0_1 + i_result_1_1;
      temp_1_1  <= i_result_2_1 + i_result_3_1;
      temp_2_0  <= i_result_0_2 + i_result_1_2;
      temp_2_1  <= i_result_2_2 + i_result_3_2;
      temp_3_0  <= i_result_0_3 + i_result_1_3;
      temp_3_1  <= i_result_2_3 + i_result_3_3;
      temp_4_0  <= i_result_0_4 + i_result_1_4;
      temp_4_1  <= i_result_2_4 + i_result_3_4;
      temp_5_0  <= i_result_0_5 + i_result_1_5;
      temp_5_1  <= i_result_2_5 + i_result_3_5;
      temp_6_0  <= i_result_0_6 + i_result_1_6;
      temp_6_1  <= i_result_2_6 + i_result_3_6;
      temp_7_0  <= i_result_0_7 + i_result_1_7;
      temp_7_1  <= i_result_2_7 + i_result_3_7;
      temp_8_0  <= i_result_0_8 + i_result_1_8;
      temp_8_1  <= i_result_2_8 + i_result_3_8;
      temp_9_0  <= i_result_0_9 + i_result_1_9;
      temp_9_1  <= i_result_2_9 + i_result_3_9;
      temp_10_0 <= i_result_0_10 + i_result_1_10;
      temp_10_1 <= i_result_2_10 + i_result_3_10;
      temp_11_0 <= i_result_0_11 + i_result_1_11;
      temp_11_1 <= i_result_2_11 + i_result_3_11;
      temp_12_0 <= i_result_0_12 + i_result_1_12;
      temp_12_1 <= i_result_2_12 + i_result_3_12;
      temp_13_0 <= i_result_0_13 + i_result_1_13;
      temp_13_1 <= i_result_2_13 + i_result_3_13;
      temp_14_0 <= i_result_0_14 + i_result_1_14;
      temp_14_1 <= i_result_2_14 + i_result_3_14;
      temp_15_0 <= i_result_0_15 + i_result_1_15;
      temp_15_1 <= i_result_2_15 + i_result_3_15;
    end
  end

endmodule