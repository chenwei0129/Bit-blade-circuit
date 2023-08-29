module brick_adder(
  input signed [4:0]  i_brick_prod_0,// -6 ~ 9
  input signed [4:0]  i_brick_prod_1,// -6 ~ 9
  input signed [4:0]  i_brick_prod_2,// -6 ~ 9
  input signed [4:0]  i_brick_prod_3,// -6 ~ 9
  input signed [4:0]  i_brick_prod_4,// -6 ~ 9
  input signed [4:0]  i_brick_prod_5,// -6 ~ 9
  input signed [4:0]  i_brick_prod_6,// -6 ~ 9
  input signed [4:0]  i_brick_prod_7,// -6 ~ 9
  input signed [4:0]  i_brick_prod_8,// -6 ~ 9
  input signed [4:0]  i_brick_prod_9,// -6 ~ 9
  input signed [4:0]  i_brick_prod_10,// -6 ~ 9
  input signed [4:0]  i_brick_prod_11,// -6 ~ 9
  input signed [4:0]  i_brick_prod_12,// -6 ~ 9
  input signed [4:0]  i_brick_prod_13,// -6 ~ 9
  input signed [4:0]  i_brick_prod_14,// -6 ~ 9
  input signed [4:0]  i_brick_prod_15,// -6 ~ 9
  output signed [8:0] o_sum
);

  assign o_sum = (((i_brick_prod_0 + i_brick_prod_1) + (i_brick_prod_2 + i_brick_prod_3)) + ((i_brick_prod_4 + i_brick_prod_5) + (i_brick_prod_6 + i_brick_prod_7))) + (((i_brick_prod_8 + i_brick_prod_9) + (i_brick_prod_10 + i_brick_prod_11)) + ((i_brick_prod_12 + i_brick_prod_13) + (i_brick_prod_14 + i_brick_prod_15)));
  
endmodule
