
module PE0248(
  input  i_clk,
  input  i_rst_n,
  input  [31:0] i_activation,
  input  [31:0] i_weight,
  input  i_A_signed,
  input  i_W_signed,
  input  [3:0] i_shift_amount,
  output reg signed [16:0] o_prod
);
  
  wire signed [4:0] brick_prod [0:15];
  
  wire signed [8:0] o_prod_temp;

  reg signed [16:0] o_prod_w;

  always@(*)begin
    case(i_shift_amount)
      4'd2    : o_prod_w = o_prod_temp << 2;
      4'd4    : o_prod_w = o_prod_temp << 4;
      4'd8    : o_prod_w = o_prod_temp << 8;
      default : o_prod_w = o_prod_temp;
    endcase
  end

  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      o_prod <= 20'd0;
    end else begin
      o_prod <= o_prod_w;
    end
  end

  brick_adder brick_adder(
    .i_brick_prod_0 (brick_prod[0]),
    .i_brick_prod_1 (brick_prod[1]),
    .i_brick_prod_2 (brick_prod[2]),
    .i_brick_prod_3 (brick_prod[3]),
    .i_brick_prod_4 (brick_prod[4]),
    .i_brick_prod_5 (brick_prod[5]),
    .i_brick_prod_6 (brick_prod[6]),
    .i_brick_prod_7 (brick_prod[7]),
    .i_brick_prod_8 (brick_prod[8]),
    .i_brick_prod_9 (brick_prod[9]),
    .i_brick_prod_10(brick_prod[10]),
    .i_brick_prod_11(brick_prod[11]),
    .i_brick_prod_12(brick_prod[12]),
    .i_brick_prod_13(brick_prod[13]),
    .i_brick_prod_14(brick_prod[14]),
    .i_brick_prod_15(brick_prod[15]),
    .o_sum          (o_prod_temp)
  );

  brick b0(
    .i_activation(i_activation[1:0]),
    .i_weight    (i_weight[1:0]),
    .i_A_signed  (i_A_signed),
    .i_W_signed  (i_W_signed),
    .o_prod      (brick_prod[0])
  );

  brick b1(
    .i_activation(i_activation[3:2]),
    .i_weight    (i_weight[3:2]),
    .i_A_signed  (i_A_signed),
    .i_W_signed  (i_W_signed),
    .o_prod      (brick_prod[1])
  );

  brick b2(
    .i_activation(i_activation[5:4]),
    .i_weight    (i_weight[5:4]),
    .i_A_signed  (i_A_signed),
    .i_W_signed  (i_W_signed),
    .o_prod      (brick_prod[2])
  );

  brick b3(
    .i_activation(i_activation[7:6]),
    .i_weight    (i_weight[7:6]),
    .i_A_signed  (i_A_signed),
    .i_W_signed  (i_W_signed),
    .o_prod      (brick_prod[3])
  );

  brick b4(
    .i_activation(i_activation[9:8]),
    .i_weight    (i_weight[9:8]),
    .i_A_signed  (i_A_signed),
    .i_W_signed  (i_W_signed),
    .o_prod      (brick_prod[4])
  );

  brick b5(
    .i_activation(i_activation[11:10]),
    .i_weight    (i_weight[11:10]),
    .i_A_signed  (i_A_signed),
    .i_W_signed  (i_W_signed),
    .o_prod      (brick_prod[5])
  );

  brick b6(
    .i_activation(i_activation[13:12]),
    .i_weight    (i_weight[13:12]),
    .i_A_signed  (i_A_signed),
    .i_W_signed  (i_W_signed),
    .o_prod      (brick_prod[6])
  );

  brick b7(
    .i_activation(i_activation[15:14]),
    .i_weight    (i_weight[15:14]),
    .i_A_signed  (i_A_signed),
    .i_W_signed  (i_W_signed),
    .o_prod      (brick_prod[7])
  );

  brick b8(
    .i_activation(i_activation[17:16]),
    .i_weight    (i_weight[17:16]),
    .i_A_signed  (i_A_signed),
    .i_W_signed  (i_W_signed),
    .o_prod      (brick_prod[8])
  );

  brick b9(
    .i_activation(i_activation[19:18]),
    .i_weight    (i_weight[19:18]),
    .i_A_signed  (i_A_signed),
    .i_W_signed  (i_W_signed),
    .o_prod      (brick_prod[9])
  );

  brick b10(
    .i_activation(i_activation[21:20]),
    .i_weight    (i_weight[21:20]),
    .i_A_signed  (i_A_signed),
    .i_W_signed  (i_W_signed),
    .o_prod      (brick_prod[10])
  );

  brick b11(
    .i_activation(i_activation[23:22]),
    .i_weight    (i_weight[23:22]),
    .i_A_signed  (i_A_signed),
    .i_W_signed  (i_W_signed),
    .o_prod      (brick_prod[11])
  );

  brick b12(
    .i_activation(i_activation[25:24]),
    .i_weight    (i_weight[25:24]),
    .i_A_signed  (i_A_signed),
    .i_W_signed  (i_W_signed),
    .o_prod      (brick_prod[12])
  );

  brick b13(
    .i_activation(i_activation[27:26]),
    .i_weight    (i_weight[27:26]),
    .i_A_signed  (i_A_signed),
    .i_W_signed  (i_W_signed),
    .o_prod      (brick_prod[13])
  );

  brick b14(
    .i_activation(i_activation[29:28]),
    .i_weight    (i_weight[29:28]),
    .i_A_signed  (i_A_signed),
    .i_W_signed  (i_W_signed),
    .o_prod      (brick_prod[14])
  );

  brick b15(
    .i_activation(i_activation[31:30]),
    .i_weight    (i_weight[31:30]),
    .i_A_signed  (i_A_signed),
    .i_W_signed  (i_W_signed),
    .o_prod      (brick_prod[15])
  );

endmodule