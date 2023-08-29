module accumulator_strategy2(
  input i_clk,
  input i_rst_n,
  input i_strategy_2_en,
  input i_accumulation,
  input signed [31:0] i_Psum_from_last_tile,
  input signed [20:0] i_result_strategy2_before_accumulation,
  output reg signed [31:0] o_result_strategy2
);

  reg signed [31:0] Psum_from_last_tile_reg;

  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      Psum_from_last_tile_reg <= 32'd0;
    end else if(i_accumulation)begin
      Psum_from_last_tile_reg <= i_Psum_from_last_tile;
    end
  end

  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      o_result_strategy2 <= 32'd0;
    end else if(i_strategy_2_en)begin
      o_result_strategy2 <= i_result_strategy2_before_accumulation + Psum_from_last_tile_reg;
    end
  end

endmodule