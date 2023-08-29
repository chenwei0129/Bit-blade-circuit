module compare_reg_for_strategy1(
  input i_clk,
  input i_rst_n,
  input i_max_rst,
  input i_maxpool,
  input signed [31:0] i_result,
  output reg signed [31:0] o_max
);

  wire max = (i_result > o_max) && i_maxpool;

  always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
      o_max <= 32'd0;
    end else if(max || i_max_rst || !i_maxpool)begin
      o_max <= i_result;
    end
  end

endmodule