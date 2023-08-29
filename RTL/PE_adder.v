module PE_adder(
  input i_clk,
  input i_rst_n,
  input i_strategy_en,
  input signed [8:0] i_prod_0,
  input signed [10:0] i_prod_1,
  input signed [12:0] i_prod_2,
  input signed [14:0] i_prod_3,
  input signed [10:0] i_prod_4,
  input signed [12:0] i_prod_5,
  input signed [14:0] i_prod_6,
  input signed [16:0] i_prod_7,
  input signed [12:0] i_prod_8,
  input signed [14:0] i_prod_9,
  input signed [16:0] i_prod_10,
  input signed [18:0] i_prod_11,
  input signed [14:0] i_prod_12,
  input signed [16:0] i_prod_13,
  input signed [18:0] i_prod_14,
  input signed [20:0] i_prod_15,
  output reg signed [20:0] o_prod_strategy1,
  output reg signed [20:0] o_prod_strategy2
);

  //reg signed [20:0] temp;
/*
  always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
      temp <= 21'd0;
    end else if(i_strategy_en)begin
      temp <= o_prod_strategy1;
    end
  end

  always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
      o_prod_strategy2 <= 21'd0;
    end else if(i_strategy_en)begin
      o_prod_strategy2 <= temp;
    end
  end
*/
  always@(*)begin
    if(i_strategy_en)begin
      o_prod_strategy2 = o_prod_strategy1;
    end else begin
      o_prod_strategy2 = 21'd0;
    end
  end

  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      o_prod_strategy1 <= 21'd0;
    end else begin
      o_prod_strategy1 <= (((i_prod_0 + i_prod_1) + (i_prod_2 + i_prod_3)) + ((i_prod_4 + i_prod_5) + (i_prod_6 + i_prod_7))) + (((i_prod_8 + i_prod_9) + (i_prod_10 + i_prod_11)) + ((i_prod_12 + i_prod_13) + (i_prod_14 + i_prod_15)));
    end
  end
  

endmodule