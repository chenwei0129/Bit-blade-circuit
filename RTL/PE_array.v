module PE_array(
  input i_clk,
  input i_rst_n,
  input i_weight_en,
  input [511:0] i_activation,
  input [511:0] i_weight,
  input signed [31:0] i_Psum_from_last_tile,
  input [3:0] i_A_signed,
  input [3:0] i_W_signed,
  input [63:0] i_shift,
  input  i_strategy_2_en,
  input  i_accumulation,
  output signed [20:0] o_result_strategy1,
  output signed [31:0] o_result_strategy2
);

  wire signed [8:0] prod_0;
  wire signed [10:0] prod_1;
  wire signed [12:0] prod_2;
  wire signed [14:0] prod_3;
  wire signed [10:0] prod_4;
  wire signed [12:0] prod_5;
  wire signed [14:0] prod_6;
  wire signed [16:0] prod_7;
  wire signed [12:0] prod_8;
  wire signed [14:0] prod_9;
  wire signed [16:0] prod_10;
  wire signed [18:0] prod_11;
  wire signed [14:0] prod_12;
  wire signed [16:0] prod_13;
  wire signed [18:0] prod_14;
  wire signed [20:0] prod_15;

  reg [511:0] weight_reg;
  
  always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
      weight_reg <= 512'd0;
    end else if(i_weight_en)begin
      weight_reg <= i_weight;
    end
  end

  wire [3:0] i_shift_0  = i_shift[3:0];
  wire [3:0] i_shift_1  = i_shift[7:4];
  wire [3:0] i_shift_2  = i_shift[11:8];
  wire [3:0] i_shift_3  = i_shift[15:12];
  wire [3:0] i_shift_4  = i_shift[19:16];
  wire [3:0] i_shift_5  = i_shift[23:20];
  wire [3:0] i_shift_6  = i_shift[27:24];
  wire [3:0] i_shift_7  = i_shift[31:28];
  wire [3:0] i_shift_8  = i_shift[35:32];
  wire [3:0] i_shift_9  = i_shift[39:36];
  wire [3:0] i_shift_10 = i_shift[43:40];
  wire [3:0] i_shift_11 = i_shift[47:44];
  wire [3:0] i_shift_12 = i_shift[51:48];
  wire [3:0] i_shift_13 = i_shift[55:52];
  wire [3:0] i_shift_14 = i_shift[59:56];
  wire [3:0] i_shift_15 = i_shift[63:60];

  wire signed [20:0] result_strategy2_before_accumulation;

  accumulator_strategy2 accumulator_strategy2(
    .i_clk                                 (i_clk),
    .i_rst_n                               (i_rst_n),
    .i_strategy_2_en                       (i_strategy_2_en),
    .i_accumulation                        (i_accumulation),
    .i_Psum_from_last_tile                 (i_Psum_from_last_tile),
    .i_result_strategy2_before_accumulation(result_strategy2_before_accumulation),
    .o_result_strategy2                    (o_result_strategy2)
  );

  PE_adder PE_adder(
    .i_clk           (i_clk),
    .i_rst_n         (i_rst_n),
    .i_strategy_en   (i_strategy_2_en),
    .i_prod_0        (prod_0),
    .i_prod_1        (prod_1),
    .i_prod_2        (prod_2),
    .i_prod_3        (prod_3),
    .i_prod_4        (prod_4),
    .i_prod_5        (prod_5),
    .i_prod_6        (prod_6),
    .i_prod_7        (prod_7),
    .i_prod_8        (prod_8),
    .i_prod_9        (prod_9),
    .i_prod_10       (prod_10),
    .i_prod_11       (prod_11),
    .i_prod_12       (prod_12),
    .i_prod_13       (prod_13),
    .i_prod_14       (prod_14),
    .i_prod_15       (prod_15),
    .o_prod_strategy1(o_result_strategy1),
    .o_prod_strategy2(result_strategy2_before_accumulation)//For strategy 2, this signal needs to accumulate with psum.
  );

  PE0 P0(
    .i_clk         (i_clk),
    .i_rst_n       (i_rst_n),
    .i_activation  (i_activation[31:0]),
    .i_weight      (weight_reg[31:0]),
    .i_A_signed    (i_A_signed[0]),
    .i_W_signed    (i_W_signed[0]),
    .i_shift_amount(i_shift_0),
    .o_prod        (prod_0)
  );

  PE02 P1(
    .i_clk         (i_clk),
    .i_rst_n       (i_rst_n),
    .i_activation  (i_activation[63:32]),
    .i_weight      (weight_reg[63:32]),
    .i_A_signed    (i_A_signed[1]),
    .i_W_signed    (i_W_signed[0]),
    .i_shift_amount(i_shift_1),
    .o_prod        (prod_1)
  );

  PE04 P2(
    .i_clk         (i_clk),
    .i_rst_n       (i_rst_n),
    .i_activation  (i_activation[95:64]),
    .i_weight      (weight_reg[95:64]),
    .i_A_signed    (i_A_signed[2]),
    .i_W_signed    (i_W_signed[0]),
    .i_shift_amount(i_shift_2),
    .o_prod        (prod_2)
  );

  PE026 P3(
    .i_clk         (i_clk),
    .i_rst_n       (i_rst_n),
    .i_activation  (i_activation[127:96]),
    .i_weight      (weight_reg[127:96]),
    .i_A_signed    (i_A_signed[3]),
    .i_W_signed    (i_W_signed[0]),
    .i_shift_amount(i_shift_3),
    .o_prod        (prod_3)
  );

  PE02 P4(
    .i_clk         (i_clk),
    .i_rst_n       (i_rst_n),
    .i_activation  (i_activation[159:128]),
    .i_weight      (weight_reg[159:128]),
    .i_A_signed    (i_A_signed[0]),
    .i_W_signed    (i_W_signed[1]),
    .i_shift_amount(i_shift_4),
    .o_prod        (prod_4)
  );

  PE024 P5(
    .i_clk         (i_clk),
    .i_rst_n       (i_rst_n),
    .i_activation  (i_activation[191:160]),
    .i_weight      (weight_reg[191:160]),
    .i_A_signed    (i_A_signed[1]),
    .i_W_signed    (i_W_signed[1]),
    .i_shift_amount(i_shift_5),
    .o_prod        (prod_5)
  );

  PE0246 P6(
    .i_clk         (i_clk),
    .i_rst_n       (i_rst_n),
    .i_activation  (i_activation[223:192]),
    .i_weight      (weight_reg[223:192]),
    .i_A_signed    (i_A_signed[2]),
    .i_W_signed    (i_W_signed[1]),
    .i_shift_amount(i_shift_6),
    .o_prod        (prod_6)
  );

  PE02468 P7(
    .i_clk         (i_clk),
    .i_rst_n       (i_rst_n),
    .i_activation  (i_activation[255:224]),
    .i_weight      (weight_reg[255:224]),
    .i_A_signed    (i_A_signed[3]),
    .i_W_signed    (i_W_signed[1]),
    .i_shift_amount(i_shift_7),
    .o_prod        (prod_7)
  );

  PE04 P8(
    .i_clk         (i_clk),
    .i_rst_n       (i_rst_n),
    .i_activation  (i_activation[287:256]),
    .i_weight      (weight_reg[287:256]),
    .i_A_signed    (i_A_signed[0]),
    .i_W_signed    (i_W_signed[2]),
    .i_shift_amount(i_shift_8),
    .o_prod        (prod_8)
  );

  PE026 P9(
    .i_clk         (i_clk),
    .i_rst_n       (i_rst_n),
    .i_activation  (i_activation[319:288]),
    .i_weight      (weight_reg[319:288]),
    .i_A_signed    (i_A_signed[1]),
    .i_W_signed    (i_W_signed[2]),
    .i_shift_amount(i_shift_9),
    .o_prod        (prod_9)
  );

  PE048 P10(
    .i_clk         (i_clk),
    .i_rst_n       (i_rst_n),
    .i_activation  (i_activation[351:320]),
    .i_weight      (weight_reg[351:320]),
    .i_A_signed    (i_A_signed[2]),
    .i_W_signed    (i_W_signed[2]),
    .i_shift_amount(i_shift_10),
    .o_prod        (prod_10)
  );

  PE02610 P11(
    .i_clk         (i_clk),
    .i_rst_n       (i_rst_n),
    .i_activation  (i_activation[383:352]),
    .i_weight      (weight_reg[383:352]),
    .i_A_signed    (i_A_signed[3]),
    .i_W_signed    (i_W_signed[2]),
    .i_shift_amount(i_shift_11),
    .o_prod        (prod_11)
  );

  PE026 P12(
    .i_clk         (i_clk),
    .i_rst_n       (i_rst_n),
    .i_activation  (i_activation[415:384]),
    .i_weight      (weight_reg[415:384]),
    .i_A_signed    (i_A_signed[0]),
    .i_W_signed    (i_W_signed[3]),
    .i_shift_amount(i_shift_12),
    .o_prod        (prod_12)
  );

  PE0248 P13(
    .i_clk         (i_clk),
    .i_rst_n       (i_rst_n),
    .i_activation  (i_activation[447:416]),
    .i_weight      (weight_reg[447:416]),
    .i_A_signed    (i_A_signed[1]),
    .i_W_signed    (i_W_signed[3]),
    .i_shift_amount(i_shift_13),
    .o_prod        (prod_13)
  );

  PE024610 P14(
    .i_clk         (i_clk),
    .i_rst_n       (i_rst_n),
    .i_activation  (i_activation[479:448]),
    .i_weight      (weight_reg[479:448]),
    .i_A_signed    (i_A_signed[2]),
    .i_W_signed    (i_W_signed[3]),
    .i_shift_amount(i_shift_14),
    .o_prod        (prod_14)
  );

  PE0246812 P15(
    .i_clk         (i_clk),
    .i_rst_n       (i_rst_n),
    .i_activation  (i_activation[511:480]),
    .i_weight      (weight_reg[511:480]),
    .i_A_signed    (i_A_signed[3]),
    .i_W_signed    (i_W_signed[3]),
    .i_shift_amount(i_shift_15),
    .o_prod        (prod_15)
  );

endmodule