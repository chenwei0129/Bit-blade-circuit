module brick(
  input [1:0]         i_activation,
  input [1:0]         i_weight,
  input               i_A_signed,
  input               i_W_signed,
  output signed [4:0] o_prod
);

  wire signed [2:0] activation_op = (i_A_signed) ? {i_activation[1], i_activation} : {1'b0, i_activation};
  wire signed [2:0] weight_op     = (i_W_signed) ? {i_weight[1], i_weight} : {1'b0, i_weight};

  assign o_prod = activation_op * weight_op;

endmodule