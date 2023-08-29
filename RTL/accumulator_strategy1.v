module accumulator_strategy1(
  input i_clk,
  input i_rst_n,
  input i_strategy_1_en,
  input i_accumulation,
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
  input signed [22:0] i_result_0_strategy1_before_accumulation,
  input signed [22:0] i_result_1_strategy1_before_accumulation,
  input signed [22:0] i_result_2_strategy1_before_accumulation,
  input signed [22:0] i_result_3_strategy1_before_accumulation,
  input signed [22:0] i_result_4_strategy1_before_accumulation,
  input signed [22:0] i_result_5_strategy1_before_accumulation,
  input signed [22:0] i_result_6_strategy1_before_accumulation,
  input signed [22:0] i_result_7_strategy1_before_accumulation,
  input signed [22:0] i_result_8_strategy1_before_accumulation,
  input signed [22:0] i_result_9_strategy1_before_accumulation,
  input signed [22:0] i_result_10_strategy1_before_accumulation,
  input signed [22:0] i_result_11_strategy1_before_accumulation,
  input signed [22:0] i_result_12_strategy1_before_accumulation,
  input signed [22:0] i_result_13_strategy1_before_accumulation,
  input signed [22:0] i_result_14_strategy1_before_accumulation,
  input signed [22:0] i_result_15_strategy1_before_accumulation,
  output reg signed [31:0] o_result_0_strategy1,
  output reg signed [31:0] o_result_1_strategy1,
  output reg signed [31:0] o_result_2_strategy1,
  output reg signed [31:0] o_result_3_strategy1,
  output reg signed [31:0] o_result_4_strategy1,
  output reg signed [31:0] o_result_5_strategy1,
  output reg signed [31:0] o_result_6_strategy1,
  output reg signed [31:0] o_result_7_strategy1,
  output reg signed [31:0] o_result_8_strategy1,
  output reg signed [31:0] o_result_9_strategy1,
  output reg signed [31:0] o_result_10_strategy1,
  output reg signed [31:0] o_result_11_strategy1,
  output reg signed [31:0] o_result_12_strategy1,
  output reg signed [31:0] o_result_13_strategy1,
  output reg signed [31:0] o_result_14_strategy1,
  output reg signed [31:0] o_result_15_strategy1
);

  reg signed [31:0] Psum_from_last_tile_0_reg;
  reg signed [31:0] Psum_from_last_tile_1_reg;
  reg signed [31:0] Psum_from_last_tile_2_reg;
  reg signed [31:0] Psum_from_last_tile_3_reg;
  reg signed [31:0] Psum_from_last_tile_4_reg;
  reg signed [31:0] Psum_from_last_tile_5_reg;
  reg signed [31:0] Psum_from_last_tile_6_reg;
  reg signed [31:0] Psum_from_last_tile_7_reg;
  reg signed [31:0] Psum_from_last_tile_8_reg;
  reg signed [31:0] Psum_from_last_tile_9_reg;
  reg signed [31:0] Psum_from_last_tile_10_reg;
  reg signed [31:0] Psum_from_last_tile_11_reg;
  reg signed [31:0] Psum_from_last_tile_12_reg;
  reg signed [31:0] Psum_from_last_tile_13_reg;
  reg signed [31:0] Psum_from_last_tile_14_reg;
  reg signed [31:0] Psum_from_last_tile_15_reg;

  always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
      Psum_from_last_tile_0_reg  <= 32'd0;
      Psum_from_last_tile_1_reg  <= 32'd0;
      Psum_from_last_tile_2_reg  <= 32'd0;
      Psum_from_last_tile_3_reg  <= 32'd0;
      Psum_from_last_tile_4_reg  <= 32'd0;
      Psum_from_last_tile_5_reg  <= 32'd0;
      Psum_from_last_tile_6_reg  <= 32'd0;
      Psum_from_last_tile_7_reg  <= 32'd0;
      Psum_from_last_tile_8_reg  <= 32'd0;
      Psum_from_last_tile_9_reg  <= 32'd0;
      Psum_from_last_tile_10_reg <= 32'd0;
      Psum_from_last_tile_11_reg <= 32'd0;
      Psum_from_last_tile_12_reg <= 32'd0;
      Psum_from_last_tile_13_reg <= 32'd0;
      Psum_from_last_tile_14_reg <= 32'd0;
      Psum_from_last_tile_15_reg <= 32'd0;
    end else if(i_accumulation)begin
      Psum_from_last_tile_0_reg  <= i_Psum_from_last_tile_0;
      Psum_from_last_tile_1_reg  <= i_Psum_from_last_tile_1;
      Psum_from_last_tile_2_reg  <= i_Psum_from_last_tile_2;
      Psum_from_last_tile_3_reg  <= i_Psum_from_last_tile_3;
      Psum_from_last_tile_4_reg  <= i_Psum_from_last_tile_4;
      Psum_from_last_tile_5_reg  <= i_Psum_from_last_tile_5;
      Psum_from_last_tile_6_reg  <= i_Psum_from_last_tile_6;
      Psum_from_last_tile_7_reg  <= i_Psum_from_last_tile_7;
      Psum_from_last_tile_8_reg  <= i_Psum_from_last_tile_8;
      Psum_from_last_tile_9_reg  <= i_Psum_from_last_tile_9;
      Psum_from_last_tile_10_reg <= i_Psum_from_last_tile_10;
      Psum_from_last_tile_11_reg <= i_Psum_from_last_tile_11;
      Psum_from_last_tile_12_reg <= i_Psum_from_last_tile_12;
      Psum_from_last_tile_13_reg <= i_Psum_from_last_tile_13;
      Psum_from_last_tile_14_reg <= i_Psum_from_last_tile_14;
      Psum_from_last_tile_15_reg <= i_Psum_from_last_tile_15;
    end
  end

  always@(posedge i_clk or negedge i_rst_n) begin
    if(!i_rst_n)begin
      o_result_0_strategy1  <= 31'd0;
      o_result_1_strategy1  <= 31'd0;
      o_result_2_strategy1  <= 31'd0;
      o_result_3_strategy1  <= 31'd0;
      o_result_4_strategy1  <= 31'd0;
      o_result_5_strategy1  <= 31'd0;
      o_result_6_strategy1  <= 31'd0;
      o_result_7_strategy1  <= 31'd0;
      o_result_8_strategy1  <= 31'd0;
      o_result_9_strategy1  <= 31'd0;
      o_result_10_strategy1 <= 31'd0;
      o_result_11_strategy1 <= 31'd0;
      o_result_12_strategy1 <= 31'd0;
      o_result_13_strategy1 <= 31'd0;
      o_result_14_strategy1 <= 31'd0;
      o_result_15_strategy1 <= 31'd0;
    end else if(i_strategy_1_en)begin
      o_result_0_strategy1  <= i_result_0_strategy1_before_accumulation + Psum_from_last_tile_0_reg;
      o_result_1_strategy1  <= i_result_1_strategy1_before_accumulation + Psum_from_last_tile_1_reg;
      o_result_2_strategy1  <= i_result_2_strategy1_before_accumulation + Psum_from_last_tile_2_reg;
      o_result_3_strategy1  <= i_result_3_strategy1_before_accumulation + Psum_from_last_tile_3_reg;
      o_result_4_strategy1  <= i_result_4_strategy1_before_accumulation + Psum_from_last_tile_4_reg;
      o_result_5_strategy1  <= i_result_5_strategy1_before_accumulation + Psum_from_last_tile_5_reg;
      o_result_6_strategy1  <= i_result_6_strategy1_before_accumulation + Psum_from_last_tile_6_reg;
      o_result_7_strategy1  <= i_result_7_strategy1_before_accumulation + Psum_from_last_tile_7_reg;
      o_result_8_strategy1  <= i_result_8_strategy1_before_accumulation + Psum_from_last_tile_8_reg;
      o_result_9_strategy1  <= i_result_9_strategy1_before_accumulation + Psum_from_last_tile_9_reg;
      o_result_10_strategy1 <= i_result_10_strategy1_before_accumulation + Psum_from_last_tile_10_reg;
      o_result_11_strategy1 <= i_result_11_strategy1_before_accumulation + Psum_from_last_tile_11_reg;
      o_result_12_strategy1 <= i_result_12_strategy1_before_accumulation + Psum_from_last_tile_12_reg;
      o_result_13_strategy1 <= i_result_13_strategy1_before_accumulation + Psum_from_last_tile_13_reg;
      o_result_14_strategy1 <= i_result_14_strategy1_before_accumulation + Psum_from_last_tile_14_reg;
      o_result_15_strategy1 <= i_result_15_strategy1_before_accumulation + Psum_from_last_tile_15_reg;
    end
  end

endmodule