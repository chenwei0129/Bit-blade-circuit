`timescale 1ns/1ps

`ifdef GSIM
    `define SDFFILE     "./Netlist/top_syn.sdf"   //Modify your sdf file name
`endif

`define CYCLE 10

`define PAT_NUM 128

module tb;
  
  reg clk = 1'b1;
  reg rst = 1'b1;
  reg [511:0] src_A_0;
  reg [511:0] src_A_1;
  reg [511:0] src_A_2;
  reg [511:0] src_A_3;
  reg [511:0] src_W_0;
  reg [511:0] src_W_1;
  reg [511:0] src_W_2;
  reg [511:0] src_W_3;
  reg [1:0] A_BIT_REG[0:1];
  reg [1:0] W_BIT_REG[0:1];
  reg       STRATEGY_REG[0:1];
  reg [9:0] NUM_COLUMN_REG[0:1];
  reg [2:0] NUM_ROW_REG[0:1];
  reg       ACCUMULATION_REG[0:1];
  reg       A_SIGNED_REG[0:1];
  reg [1:0] A_bits;
  reg [1:0] W_bits;

  wire signed [31:0] psum_0_for_strategy1;
  wire signed [31:0] psum_1_for_strategy1;
  wire signed [31:0] psum_2_for_strategy1;
  wire signed [31:0] psum_3_for_strategy1;
  wire signed [31:0] psum_4_for_strategy1;
  wire signed [31:0] psum_5_for_strategy1;
  wire signed [31:0] psum_6_for_strategy1;
  wire signed [31:0] psum_7_for_strategy1;
  wire signed [31:0] psum_8_for_strategy1;
  wire signed [31:0] psum_9_for_strategy1;
  wire signed [31:0] psum_10_for_strategy1;
  wire signed [31:0] psum_11_for_strategy1;
  wire signed [31:0] psum_12_for_strategy1;
  wire signed [31:0] psum_13_for_strategy1;
  wire signed [31:0] psum_14_for_strategy1;
  wire signed [31:0] psum_15_for_strategy1;
  wire        [127:0] psum_0_for_strategy2;
  wire        [127:0] psum_1_for_strategy2;
  wire        [127:0] psum_2_for_strategy2;
  wire        [127:0] psum_3_for_strategy2;
  wire        [127:0] psum_4_for_strategy2;
  wire        [127:0] psum_5_for_strategy2;
  wire        [127:0] psum_6_for_strategy2;
  wire        [127:0] psum_7_for_strategy2;
  wire        [127:0] psum_8_for_strategy2;
  wire        [127:0] psum_9_for_strategy2;
  wire        [127:0] psum_10_for_strategy2;
  wire        [127:0] psum_11_for_strategy2;
  wire        [127:0] psum_12_for_strategy2;
  wire        [127:0] psum_13_for_strategy2;
  wire        [127:0] psum_14_for_strategy2;
  wire        [127:0] psum_15_for_strategy2;
  wire valid_P;
  wire [9:0] addr_A;
  wire [9:0] addr_W;
  wire [9:0] addr_P;
  wire valid_P_from_last_tile;
  wire [9:0] addr_P_from_last_tile;
  wire busy_cube;
  wire done;
  wire busy_activation;
  wire busy_weight;
  reg new_tile;
  reg strategy;
  reg [9:0] num_column;
  reg [2:0] num_row;
  reg       accumulation;
  reg A_signed;
  reg W_signed;
  reg [20:0] ins;

  reg [31:0] Psum_from_last_tile_0;
  reg [31:0] Psum_from_last_tile_1;
  reg [31:0] Psum_from_last_tile_2;
  reg [31:0] Psum_from_last_tile_3;
  reg [31:0] Psum_from_last_tile_4;
  reg [31:0] Psum_from_last_tile_5;
  reg [31:0] Psum_from_last_tile_6;
  reg [31:0] Psum_from_last_tile_7;
  reg [31:0] Psum_from_last_tile_8;
  reg [31:0] Psum_from_last_tile_9;
  reg [31:0] Psum_from_last_tile_10;
  reg [31:0] Psum_from_last_tile_11;
  reg [31:0] Psum_from_last_tile_12;
  reg [31:0] Psum_from_last_tile_13;
  reg [31:0] Psum_from_last_tile_14;
  reg [31:0] Psum_from_last_tile_15;

  reg [31:0] Psum_from_last_tile_0_0;
  reg [31:0] Psum_from_last_tile_0_1;
  reg [31:0] Psum_from_last_tile_0_2;
  reg [31:0] Psum_from_last_tile_0_3;
  reg [31:0] Psum_from_last_tile_0_4;
  reg [31:0] Psum_from_last_tile_0_5;
  reg [31:0] Psum_from_last_tile_0_6;
  reg [31:0] Psum_from_last_tile_0_7;
  reg [31:0] Psum_from_last_tile_0_8;
  reg [31:0] Psum_from_last_tile_0_9;
  reg [31:0] Psum_from_last_tile_0_10;
  reg [31:0] Psum_from_last_tile_0_11;
  reg [31:0] Psum_from_last_tile_0_12;
  reg [31:0] Psum_from_last_tile_0_13;
  reg [31:0] Psum_from_last_tile_0_14;
  reg [31:0] Psum_from_last_tile_0_15;
  reg [31:0] Psum_from_last_tile_1_0;
  reg [31:0] Psum_from_last_tile_1_1;
  reg [31:0] Psum_from_last_tile_1_2;
  reg [31:0] Psum_from_last_tile_1_3;
  reg [31:0] Psum_from_last_tile_1_4;
  reg [31:0] Psum_from_last_tile_1_5;
  reg [31:0] Psum_from_last_tile_1_6;
  reg [31:0] Psum_from_last_tile_1_7;
  reg [31:0] Psum_from_last_tile_1_8;
  reg [31:0] Psum_from_last_tile_1_9;
  reg [31:0] Psum_from_last_tile_1_10;
  reg [31:0] Psum_from_last_tile_1_11;
  reg [31:0] Psum_from_last_tile_1_12;
  reg [31:0] Psum_from_last_tile_1_13;
  reg [31:0] Psum_from_last_tile_1_14;
  reg [31:0] Psum_from_last_tile_1_15;
  reg [31:0] Psum_from_last_tile_2_0;
  reg [31:0] Psum_from_last_tile_2_1;
  reg [31:0] Psum_from_last_tile_2_2;
  reg [31:0] Psum_from_last_tile_2_3;
  reg [31:0] Psum_from_last_tile_2_4;
  reg [31:0] Psum_from_last_tile_2_5;
  reg [31:0] Psum_from_last_tile_2_6;
  reg [31:0] Psum_from_last_tile_2_7;
  reg [31:0] Psum_from_last_tile_2_8;
  reg [31:0] Psum_from_last_tile_2_9;
  reg [31:0] Psum_from_last_tile_2_10;
  reg [31:0] Psum_from_last_tile_2_11;
  reg [31:0] Psum_from_last_tile_2_12;
  reg [31:0] Psum_from_last_tile_2_13;
  reg [31:0] Psum_from_last_tile_2_14;
  reg [31:0] Psum_from_last_tile_2_15;
  reg [31:0] Psum_from_last_tile_3_0;
  reg [31:0] Psum_from_last_tile_3_1;
  reg [31:0] Psum_from_last_tile_3_2;
  reg [31:0] Psum_from_last_tile_3_3;
  reg [31:0] Psum_from_last_tile_3_4;
  reg [31:0] Psum_from_last_tile_3_5;
  reg [31:0] Psum_from_last_tile_3_6;
  reg [31:0] Psum_from_last_tile_3_7;
  reg [31:0] Psum_from_last_tile_3_8;
  reg [31:0] Psum_from_last_tile_3_9;
  reg [31:0] Psum_from_last_tile_3_10;
  reg [31:0] Psum_from_last_tile_3_11;
  reg [31:0] Psum_from_last_tile_3_12;
  reg [31:0] Psum_from_last_tile_3_13;
  reg [31:0] Psum_from_last_tile_3_14;
  reg [31:0] Psum_from_last_tile_3_15;
  
  top top(.i_clk   (clk),
          .i_rst_n (rst),
          .i_new_tile(new_tile),
          .i_ins     (ins),
          .i_src_A_0 (src_A_0),
          .i_src_A_1 (src_A_1),
          .i_src_A_2 (src_A_2),
          .i_src_A_3 (src_A_3),
          .i_src_W_0 (src_W_0),
          .i_src_W_1 (src_W_1),
          .i_src_W_2 (src_W_2),
          .i_src_W_3 (src_W_3),
          .i_Psum_from_last_tile_0(Psum_from_last_tile_0),
          .i_Psum_from_last_tile_1(Psum_from_last_tile_1),
          .i_Psum_from_last_tile_2(Psum_from_last_tile_2),
          .i_Psum_from_last_tile_3(Psum_from_last_tile_3),
          .i_Psum_from_last_tile_4(Psum_from_last_tile_4),
          .i_Psum_from_last_tile_5(Psum_from_last_tile_5),
          .i_Psum_from_last_tile_6(Psum_from_last_tile_6),
          .i_Psum_from_last_tile_7(Psum_from_last_tile_7),
          .i_Psum_from_last_tile_8(Psum_from_last_tile_8),
          .i_Psum_from_last_tile_9(Psum_from_last_tile_9),
          .i_Psum_from_last_tile_10(Psum_from_last_tile_10),
          .i_Psum_from_last_tile_11(Psum_from_last_tile_11),
          .i_Psum_from_last_tile_12(Psum_from_last_tile_12),
          .i_Psum_from_last_tile_13(Psum_from_last_tile_13),
          .i_Psum_from_last_tile_14(Psum_from_last_tile_14),
          .i_Psum_from_last_tile_15(Psum_from_last_tile_15),
          .i_Psum_from_last_tile_0_0(Psum_from_last_tile_0_0),
          .i_Psum_from_last_tile_0_1(Psum_from_last_tile_0_1),
          .i_Psum_from_last_tile_0_2(Psum_from_last_tile_0_2),
          .i_Psum_from_last_tile_0_3(Psum_from_last_tile_0_3),
          .i_Psum_from_last_tile_0_4(Psum_from_last_tile_0_4),
          .i_Psum_from_last_tile_0_5(Psum_from_last_tile_0_5),
          .i_Psum_from_last_tile_0_6(Psum_from_last_tile_0_6),
          .i_Psum_from_last_tile_0_7(Psum_from_last_tile_0_7),
          .i_Psum_from_last_tile_0_8(Psum_from_last_tile_0_8),
          .i_Psum_from_last_tile_0_9(Psum_from_last_tile_0_9),
          .i_Psum_from_last_tile_0_10(Psum_from_last_tile_0_10),
          .i_Psum_from_last_tile_0_11(Psum_from_last_tile_0_11),
          .i_Psum_from_last_tile_0_12(Psum_from_last_tile_0_12),
          .i_Psum_from_last_tile_0_13(Psum_from_last_tile_0_13),
          .i_Psum_from_last_tile_0_14(Psum_from_last_tile_0_14),
          .i_Psum_from_last_tile_0_15(Psum_from_last_tile_0_15),
          .i_Psum_from_last_tile_1_0(Psum_from_last_tile_1_0),
          .i_Psum_from_last_tile_1_1(Psum_from_last_tile_1_1),
          .i_Psum_from_last_tile_1_2(Psum_from_last_tile_1_2),
          .i_Psum_from_last_tile_1_3(Psum_from_last_tile_1_3),
          .i_Psum_from_last_tile_1_4(Psum_from_last_tile_1_4),
          .i_Psum_from_last_tile_1_5(Psum_from_last_tile_1_5),
          .i_Psum_from_last_tile_1_6(Psum_from_last_tile_1_6),
          .i_Psum_from_last_tile_1_7(Psum_from_last_tile_1_7),
          .i_Psum_from_last_tile_1_8(Psum_from_last_tile_1_8),
          .i_Psum_from_last_tile_1_9(Psum_from_last_tile_1_9),
          .i_Psum_from_last_tile_1_10(Psum_from_last_tile_1_10),
          .i_Psum_from_last_tile_1_11(Psum_from_last_tile_1_11),
          .i_Psum_from_last_tile_1_12(Psum_from_last_tile_1_12),
          .i_Psum_from_last_tile_1_13(Psum_from_last_tile_1_13),
          .i_Psum_from_last_tile_1_14(Psum_from_last_tile_1_14),
          .i_Psum_from_last_tile_1_15(Psum_from_last_tile_1_15),
          .i_Psum_from_last_tile_2_0(Psum_from_last_tile_2_0),
          .i_Psum_from_last_tile_2_1(Psum_from_last_tile_2_1),
          .i_Psum_from_last_tile_2_2(Psum_from_last_tile_2_2),
          .i_Psum_from_last_tile_2_3(Psum_from_last_tile_2_3),
          .i_Psum_from_last_tile_2_4(Psum_from_last_tile_2_4),
          .i_Psum_from_last_tile_2_5(Psum_from_last_tile_2_5),
          .i_Psum_from_last_tile_2_6(Psum_from_last_tile_2_6),
          .i_Psum_from_last_tile_2_7(Psum_from_last_tile_2_7),
          .i_Psum_from_last_tile_2_8(Psum_from_last_tile_2_8),
          .i_Psum_from_last_tile_2_9(Psum_from_last_tile_2_9),
          .i_Psum_from_last_tile_2_10(Psum_from_last_tile_2_10),
          .i_Psum_from_last_tile_2_11(Psum_from_last_tile_2_11),
          .i_Psum_from_last_tile_2_12(Psum_from_last_tile_2_12),
          .i_Psum_from_last_tile_2_13(Psum_from_last_tile_2_13),
          .i_Psum_from_last_tile_2_14(Psum_from_last_tile_2_14),
          .i_Psum_from_last_tile_2_15(Psum_from_last_tile_2_15),
          .i_Psum_from_last_tile_3_0(Psum_from_last_tile_3_0),
          .i_Psum_from_last_tile_3_1(Psum_from_last_tile_3_1),
          .i_Psum_from_last_tile_3_2(Psum_from_last_tile_3_2),
          .i_Psum_from_last_tile_3_3(Psum_from_last_tile_3_3),
          .i_Psum_from_last_tile_3_4(Psum_from_last_tile_3_4),
          .i_Psum_from_last_tile_3_5(Psum_from_last_tile_3_5),
          .i_Psum_from_last_tile_3_6(Psum_from_last_tile_3_6),
          .i_Psum_from_last_tile_3_7(Psum_from_last_tile_3_7),
          .i_Psum_from_last_tile_3_8(Psum_from_last_tile_3_8),
          .i_Psum_from_last_tile_3_9(Psum_from_last_tile_3_9),
          .i_Psum_from_last_tile_3_10(Psum_from_last_tile_3_10),
          .i_Psum_from_last_tile_3_11(Psum_from_last_tile_3_11),
          .i_Psum_from_last_tile_3_12(Psum_from_last_tile_3_12),
          .i_Psum_from_last_tile_3_13(Psum_from_last_tile_3_13),
          .i_Psum_from_last_tile_3_14(Psum_from_last_tile_3_14),
          .i_Psum_from_last_tile_3_15(Psum_from_last_tile_3_15),
          .o_result_0_strategy1  (psum_0_for_strategy1),
          .o_result_1_strategy1  (psum_1_for_strategy1),
          .o_result_2_strategy1  (psum_2_for_strategy1),
          .o_result_3_strategy1  (psum_3_for_strategy1),
          .o_result_4_strategy1  (psum_4_for_strategy1),
          .o_result_5_strategy1  (psum_5_for_strategy1),
          .o_result_6_strategy1  (psum_6_for_strategy1),
          .o_result_7_strategy1  (psum_7_for_strategy1),
          .o_result_8_strategy1  (psum_8_for_strategy1),
          .o_result_9_strategy1  (psum_9_for_strategy1),
          .o_result_10_strategy1 (psum_10_for_strategy1),
          .o_result_11_strategy1 (psum_11_for_strategy1),
          .o_result_12_strategy1 (psum_12_for_strategy1),
          .o_result_13_strategy1 (psum_13_for_strategy1),
          .o_result_14_strategy1 (psum_14_for_strategy1),
          .o_result_15_strategy1 (psum_15_for_strategy1),
          .o_result_0_strategy2  (psum_0_for_strategy2),
          .o_result_1_strategy2  (psum_1_for_strategy2),
          .o_result_2_strategy2  (psum_2_for_strategy2),
          .o_result_3_strategy2  (psum_3_for_strategy2),
          .o_result_4_strategy2  (psum_4_for_strategy2),
          .o_result_5_strategy2  (psum_5_for_strategy2),
          .o_result_6_strategy2  (psum_6_for_strategy2),
          .o_result_7_strategy2  (psum_7_for_strategy2),
          .o_result_8_strategy2  (psum_8_for_strategy2),
          .o_result_9_strategy2  (psum_9_for_strategy2),
          .o_result_10_strategy2 (psum_10_for_strategy2),
          .o_result_11_strategy2 (psum_11_for_strategy2),
          .o_result_12_strategy2 (psum_12_for_strategy2),
          .o_result_13_strategy2 (psum_13_for_strategy2),
          .o_result_14_strategy2 (psum_14_for_strategy2),
          .o_result_15_strategy2 (psum_15_for_strategy2),
          .o_valid_P               (valid_P),
          .o_addr_A  (addr_A),
          .o_addr_W  (addr_W),
          .o_addr_P(addr_P),
          .o_valid_P_from_last_tile(valid_P_from_last_tile),
          .o_addr_P_from_last_tile (addr_P_from_last_tile),
          .o_busy_cube(busy_cube),
          .o_done     (done),
          .o_busy_activation(busy_activation),
          .o_busy_weight    (busy_weight));
  
  always #(`CYCLE/2) clk = ~clk;

  initial begin
    $fsdbDumpfile("bit_blade.fsdb");
    $fsdbDumpvars(0,tb,"+mda"); //This command is for dumping 2D array
    $fsdbDumpvars;
  end

  initial begin
    $readmemb("configuration/a_bit.txt", A_BIT_REG);
    $readmemb("configuration/w_bit.txt", W_BIT_REG);
    $readmemb("configuration/strategy.txt", STRATEGY_REG);
    $readmemb("configuration/num_column.txt", NUM_COLUMN_REG);
    $readmemb("configuration/num_row.txt", NUM_ROW_REG);
    $readmemb("configuration/accumulation.txt", ACCUMULATION_REG);
    $readmemb("configuration/A_signed.txt", A_SIGNED_REG);
  end
  
  initial begin
    #(`CYCLE/4) rst = ~rst;
    #(`CYCLE) rst = ~rst;
  end
  
  `ifdef GSIM
     initial       $sdf_annotate(`SDFFILE, top);
  `endif

  reg [3:0] A;
  reg [3:0] W;

  initial begin
    $monitor("%d,%d %d", $time, psum_15_for_strategy1, psum_15_for_strategy2);
  end
  
  initial begin
    //#(23*`CYCLE) $finish;
  end
  
  //reg [4:0] counter_layer;
  integer i;
/*
  always@(posedge clk or negedge rst)begin
    if(~rst)begin
      counter_layer <= 5'd0;
    end else if(i_new_tile)begin
      counter_layer <= counter_layer + 5'd1;
    end
  end
*/

  always@(*)begin
    ins = {accumulation, num_row, num_column, strategy, A_signed, A_bits, W_signed, W_bits};
  end

  always@(negedge clk or negedge rst)begin
    if(~rst)begin
      A_bits <= 2'bzz;
      W_bits <= 2'bzz;
      new_tile <= 1'b0;
      strategy <= 1'bz;
      num_column <= 1'bz;
      num_row <= 1'bz;
      accumulation <= 1'bz;
      A_signed <= 1'bz;
      W_signed <= 1'bz;
    end else if(~busy_cube)begin
      A_bits <= A_BIT_REG[0];
      W_bits <= W_BIT_REG[0];
      new_tile <= 1'b1;
      strategy <= STRATEGY_REG[0];
      num_column <= NUM_COLUMN_REG[0];
      num_row <= NUM_ROW_REG[0];
      accumulation <= ACCUMULATION_REG[0];
      A_signed <= A_SIGNED_REG[0];
      W_signed <= 1'd1;
    end else begin
      A_bits <= 2'bzz;
      W_bits <= 2'bzz;
      new_tile <= 1'b0;
      strategy <= 1'bz;
      num_column <= 1'bz;
      num_row <= 1'bz;
      accumulation <= 1'bz;
      A_signed <= 1'bz;
      W_signed <= 1'bz;
    end
  end
  
////////////////////////////////////////////SRAM for weight////////////////////////////////////

  reg [511:0] SRAM_WEIGHT_0 [0:31];
  reg [511:0] SRAM_WEIGHT_1 [0:31];
  reg [511:0] SRAM_WEIGHT_2 [0:31];
  reg [511:0] SRAM_WEIGHT_3 [0:31];
  initial begin
    $readmemb("weight/weight_0.txt", SRAM_WEIGHT_0);
    $readmemb("weight/weight_1.txt", SRAM_WEIGHT_1);
    $readmemb("weight/weight_2.txt", SRAM_WEIGHT_2);
    $readmemb("weight/weight_3.txt", SRAM_WEIGHT_3);
  end
  
  always@(negedge clk or negedge rst)begin
    if(~rst)begin
      src_W_0  <= 512'dz;
      src_W_1  <= 512'dz;
      src_W_2  <= 512'dz;
      src_W_3  <= 512'dz;
    end else if(~busy_weight)begin
      src_W_0  <= SRAM_WEIGHT_0[addr_W];
      src_W_1  <= SRAM_WEIGHT_1[addr_W];
      src_W_2  <= SRAM_WEIGHT_2[addr_W];
      src_W_3  <= SRAM_WEIGHT_3[addr_W];
    end else begin
      src_W_0  <= 512'dz;
      src_W_1  <= 512'dz;
      src_W_2  <= 512'dz;
      src_W_3  <= 512'dz;
    end
  end
  
////////////////////////////////////////////SRAM for activation////////////////////////////////////

  reg [511:0] SRAM_ACTIVATION_0 [0:`PAT_NUM-1];
  reg [511:0] SRAM_ACTIVATION_1 [0:`PAT_NUM-1];
  reg [511:0] SRAM_ACTIVATION_2 [0:`PAT_NUM-1];
  reg [511:0] SRAM_ACTIVATION_3 [0:`PAT_NUM-1];
  initial begin
    $readmemb("activation/activation_0.txt", SRAM_ACTIVATION_0);
    $readmemb("activation/activation_1.txt", SRAM_ACTIVATION_1);
    $readmemb("activation/activation_2.txt", SRAM_ACTIVATION_2);
    $readmemb("activation/activation_3.txt", SRAM_ACTIVATION_3);
  end

  always@(negedge clk or negedge rst)begin
    if(~rst)begin
      src_A_0  <= 512'dz;
      src_A_1  <= 512'dz;
      src_A_2  <= 512'dz;
      src_A_3  <= 512'dz;
    end else if(~busy_activation)begin
      src_A_0  <= SRAM_ACTIVATION_0[addr_A];
      src_A_1  <= SRAM_ACTIVATION_1[addr_A];
      src_A_2  <= SRAM_ACTIVATION_2[addr_A];
      src_A_3  <= SRAM_ACTIVATION_3[addr_A];
    end else begin
      src_A_0  <= 512'dz;
      src_A_1  <= 512'dz;
      src_A_2  <= 512'dz;
      src_A_3  <= 512'dz;
    end
  end

////////////////////////////////////////////golden pattern////////////////////////////////////
  reg signed [31:0] SRAM_answer0_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer1_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer2_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer3_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer4_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer5_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer6_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer7_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer8_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer9_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer10_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer11_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer12_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer13_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer14_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer15_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer0_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer1_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer2_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer3_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer4_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer5_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer6_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer7_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer8_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer9_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer10_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer11_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer12_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer13_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer14_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer15_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer0_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer1_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer2_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer3_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer4_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer5_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer6_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer7_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer8_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer9_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer10_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer11_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer12_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer13_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer14_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer15_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer0_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer1_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer2_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer3_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer4_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer5_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer6_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer7_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer8_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer9_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer10_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer11_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer12_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer13_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer14_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_answer15_3 [0:2*`PAT_NUM-1];
  
  initial begin
    $readmemb("answer/answer0_0.txt", SRAM_answer0_0);
    $readmemb("answer/answer1_0.txt", SRAM_answer1_0);
    $readmemb("answer/answer2_0.txt", SRAM_answer2_0);
    $readmemb("answer/answer3_0.txt", SRAM_answer3_0);
    $readmemb("answer/answer4_0.txt", SRAM_answer4_0);
    $readmemb("answer/answer5_0.txt", SRAM_answer5_0);
    $readmemb("answer/answer6_0.txt", SRAM_answer6_0);
    $readmemb("answer/answer7_0.txt", SRAM_answer7_0);
    $readmemb("answer/answer8_0.txt", SRAM_answer8_0);
    $readmemb("answer/answer9_0.txt", SRAM_answer9_0);
    $readmemb("answer/answer10_0.txt", SRAM_answer10_0);
    $readmemb("answer/answer11_0.txt", SRAM_answer11_0);
    $readmemb("answer/answer12_0.txt", SRAM_answer12_0);
    $readmemb("answer/answer13_0.txt", SRAM_answer13_0);
    $readmemb("answer/answer14_0.txt", SRAM_answer14_0);
    $readmemb("answer/answer15_0.txt", SRAM_answer15_0);
    $readmemb("answer/answer0_1.txt", SRAM_answer0_1);
    $readmemb("answer/answer1_1.txt", SRAM_answer1_1);
    $readmemb("answer/answer2_1.txt", SRAM_answer2_1);
    $readmemb("answer/answer3_1.txt", SRAM_answer3_1);
    $readmemb("answer/answer4_1.txt", SRAM_answer4_1);
    $readmemb("answer/answer5_1.txt", SRAM_answer5_1);
    $readmemb("answer/answer6_1.txt", SRAM_answer6_1);
    $readmemb("answer/answer7_1.txt", SRAM_answer7_1);
    $readmemb("answer/answer8_1.txt", SRAM_answer8_1);
    $readmemb("answer/answer9_1.txt", SRAM_answer9_1);
    $readmemb("answer/answer10_1.txt", SRAM_answer10_1);
    $readmemb("answer/answer11_1.txt", SRAM_answer11_1);
    $readmemb("answer/answer12_1.txt", SRAM_answer12_1);
    $readmemb("answer/answer13_1.txt", SRAM_answer13_1);
    $readmemb("answer/answer14_1.txt", SRAM_answer14_1);
    $readmemb("answer/answer15_1.txt", SRAM_answer15_1);
    $readmemb("answer/answer0_2.txt", SRAM_answer0_2);
    $readmemb("answer/answer1_2.txt", SRAM_answer1_2);
    $readmemb("answer/answer2_2.txt", SRAM_answer2_2);
    $readmemb("answer/answer3_2.txt", SRAM_answer3_2);
    $readmemb("answer/answer4_2.txt", SRAM_answer4_2);
    $readmemb("answer/answer5_2.txt", SRAM_answer5_2);
    $readmemb("answer/answer6_2.txt", SRAM_answer6_2);
    $readmemb("answer/answer7_2.txt", SRAM_answer7_2);
    $readmemb("answer/answer8_2.txt", SRAM_answer8_2);
    $readmemb("answer/answer9_2.txt", SRAM_answer9_2);
    $readmemb("answer/answer10_2.txt", SRAM_answer10_2);
    $readmemb("answer/answer11_2.txt", SRAM_answer11_2);
    $readmemb("answer/answer12_2.txt", SRAM_answer12_2);
    $readmemb("answer/answer13_2.txt", SRAM_answer13_2);
    $readmemb("answer/answer14_2.txt", SRAM_answer14_2);
    $readmemb("answer/answer15_2.txt", SRAM_answer15_2);
    $readmemb("answer/answer0_3.txt", SRAM_answer0_3);
    $readmemb("answer/answer1_3.txt", SRAM_answer1_3);
    $readmemb("answer/answer2_3.txt", SRAM_answer2_3);
    $readmemb("answer/answer3_3.txt", SRAM_answer3_3);
    $readmemb("answer/answer4_3.txt", SRAM_answer4_3);
    $readmemb("answer/answer5_3.txt", SRAM_answer5_3);
    $readmemb("answer/answer6_3.txt", SRAM_answer6_3);
    $readmemb("answer/answer7_3.txt", SRAM_answer7_3);
    $readmemb("answer/answer8_3.txt", SRAM_answer8_3);
    $readmemb("answer/answer9_3.txt", SRAM_answer9_3);
    $readmemb("answer/answer10_3.txt", SRAM_answer10_3);
    $readmemb("answer/answer11_3.txt", SRAM_answer11_3);
    $readmemb("answer/answer12_3.txt", SRAM_answer12_3);
    $readmemb("answer/answer13_3.txt", SRAM_answer13_3);
    $readmemb("answer/answer14_3.txt", SRAM_answer14_3);
    $readmemb("answer/answer15_3.txt", SRAM_answer15_3);
  end
  
////////////////////////////////////////////SRAM for psum////////////////////////////////////

  reg signed [31:0] SRAM_Psum0_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum1_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum2_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum3_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum4_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum5_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum6_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum7_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum8_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum9_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum10_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum11_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum12_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum13_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum14_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum15_0 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum0_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum1_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum2_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum3_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum4_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum5_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum6_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum7_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum8_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum9_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum10_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum11_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum12_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum13_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum14_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum15_1 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum0_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum1_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum2_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum3_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum4_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum5_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum6_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum7_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum8_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum9_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum10_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum11_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum12_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum13_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum14_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum15_2 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum0_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum1_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum2_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum3_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum4_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum5_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum6_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum7_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum8_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum9_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum10_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum11_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum12_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum13_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum14_3 [0:2*`PAT_NUM-1];
  reg signed [31:0] SRAM_Psum15_3 [0:2*`PAT_NUM-1];

  initial begin
    $readmemb("last_tile/last_tile0_0.txt", SRAM_Psum0_0);
    $readmemb("last_tile/last_tile1_0.txt", SRAM_Psum1_0);
    $readmemb("last_tile/last_tile2_0.txt", SRAM_Psum2_0);
    $readmemb("last_tile/last_tile3_0.txt", SRAM_Psum3_0);
    $readmemb("last_tile/last_tile4_0.txt", SRAM_Psum4_0);
    $readmemb("last_tile/last_tile5_0.txt", SRAM_Psum5_0);
    $readmemb("last_tile/last_tile6_0.txt", SRAM_Psum6_0);
    $readmemb("last_tile/last_tile7_0.txt", SRAM_Psum7_0);
    $readmemb("last_tile/last_tile8_0.txt", SRAM_Psum8_0);
    $readmemb("last_tile/last_tile9_0.txt", SRAM_Psum9_0);
    $readmemb("last_tile/last_tile10_0.txt", SRAM_Psum10_0);
    $readmemb("last_tile/last_tile11_0.txt", SRAM_Psum11_0);
    $readmemb("last_tile/last_tile12_0.txt", SRAM_Psum12_0);
    $readmemb("last_tile/last_tile13_0.txt", SRAM_Psum13_0);
    $readmemb("last_tile/last_tile14_0.txt", SRAM_Psum14_0);
    $readmemb("last_tile/last_tile15_0.txt", SRAM_Psum15_0);
    $readmemb("last_tile/last_tile0_1.txt", SRAM_Psum0_1);
    $readmemb("last_tile/last_tile1_1.txt", SRAM_Psum1_1);
    $readmemb("last_tile/last_tile2_1.txt", SRAM_Psum2_1);
    $readmemb("last_tile/last_tile3_1.txt", SRAM_Psum3_1);
    $readmemb("last_tile/last_tile4_1.txt", SRAM_Psum4_1);
    $readmemb("last_tile/last_tile5_1.txt", SRAM_Psum5_1);
    $readmemb("last_tile/last_tile6_1.txt", SRAM_Psum6_1);
    $readmemb("last_tile/last_tile7_1.txt", SRAM_Psum7_1);
    $readmemb("last_tile/last_tile8_1.txt", SRAM_Psum8_1);
    $readmemb("last_tile/last_tile9_1.txt", SRAM_Psum9_1);
    $readmemb("last_tile/last_tile10_1.txt", SRAM_Psum10_1);
    $readmemb("last_tile/last_tile11_1.txt", SRAM_Psum11_1);
    $readmemb("last_tile/last_tile12_1.txt", SRAM_Psum12_1);
    $readmemb("last_tile/last_tile13_1.txt", SRAM_Psum13_1);
    $readmemb("last_tile/last_tile14_1.txt", SRAM_Psum14_1);
    $readmemb("last_tile/last_tile15_1.txt", SRAM_Psum15_1);
    $readmemb("last_tile/last_tile0_2.txt", SRAM_Psum0_2);
    $readmemb("last_tile/last_tile1_2.txt", SRAM_Psum1_2);
    $readmemb("last_tile/last_tile2_2.txt", SRAM_Psum2_2);
    $readmemb("last_tile/last_tile3_2.txt", SRAM_Psum3_2);
    $readmemb("last_tile/last_tile4_2.txt", SRAM_Psum4_2);
    $readmemb("last_tile/last_tile5_2.txt", SRAM_Psum5_2);
    $readmemb("last_tile/last_tile6_2.txt", SRAM_Psum6_2);
    $readmemb("last_tile/last_tile7_2.txt", SRAM_Psum7_2);
    $readmemb("last_tile/last_tile8_2.txt", SRAM_Psum8_2);
    $readmemb("last_tile/last_tile9_2.txt", SRAM_Psum9_2);
    $readmemb("last_tile/last_tile10_2.txt", SRAM_Psum10_2);
    $readmemb("last_tile/last_tile11_2.txt", SRAM_Psum11_2);
    $readmemb("last_tile/last_tile12_2.txt", SRAM_Psum12_2);
    $readmemb("last_tile/last_tile13_2.txt", SRAM_Psum13_2);
    $readmemb("last_tile/last_tile14_2.txt", SRAM_Psum14_2);
    $readmemb("last_tile/last_tile15_2.txt", SRAM_Psum15_2);
    $readmemb("last_tile/last_tile0_3.txt", SRAM_Psum0_3);
    $readmemb("last_tile/last_tile1_3.txt", SRAM_Psum1_3);
    $readmemb("last_tile/last_tile2_3.txt", SRAM_Psum2_3);
    $readmemb("last_tile/last_tile3_3.txt", SRAM_Psum3_3);
    $readmemb("last_tile/last_tile4_3.txt", SRAM_Psum4_3);
    $readmemb("last_tile/last_tile5_3.txt", SRAM_Psum5_3);
    $readmemb("last_tile/last_tile6_3.txt", SRAM_Psum6_3);
    $readmemb("last_tile/last_tile7_3.txt", SRAM_Psum7_3);
    $readmemb("last_tile/last_tile8_3.txt", SRAM_Psum8_3);
    $readmemb("last_tile/last_tile9_3.txt", SRAM_Psum9_3);
    $readmemb("last_tile/last_tile10_3.txt", SRAM_Psum10_3);
    $readmemb("last_tile/last_tile11_3.txt", SRAM_Psum11_3);
    $readmemb("last_tile/last_tile12_3.txt", SRAM_Psum12_3);
    $readmemb("last_tile/last_tile13_3.txt", SRAM_Psum13_3);
    $readmemb("last_tile/last_tile14_3.txt", SRAM_Psum14_3);
    $readmemb("last_tile/last_tile15_3.txt", SRAM_Psum15_3);
  end
  
  wire [9:0] addr_offset0 = 10'd256;
  wire [9:0] addr_offset1 = 10'd512;
  wire [9:0] addr_offset2 = 10'd768;

  always@(negedge clk)begin
    if(valid_P && !STRATEGY_REG[0])begin
      if     (addr_P<addr_offset0)SRAM_Psum0_0[addr_P]              <= psum_0_for_strategy1;
      else if(addr_P<addr_offset1)SRAM_Psum0_1[addr_P-addr_offset0] <= psum_0_for_strategy1;
      else if(addr_P<addr_offset2)SRAM_Psum0_2[addr_P-addr_offset1] <= psum_0_for_strategy1;
      else                        SRAM_Psum0_3[addr_P-addr_offset2] <= psum_0_for_strategy1;
    end else if(valid_P && STRATEGY_REG[0])begin
      SRAM_Psum0_0[addr_P] <= psum_0_for_strategy2[31:0];
      SRAM_Psum0_1[addr_P] <= psum_0_for_strategy2[63:32];
      SRAM_Psum0_2[addr_P] <= psum_0_for_strategy2[95:64];
      SRAM_Psum0_3[addr_P] <= psum_0_for_strategy2[127:96];
    end
  end

  always@(negedge clk)begin
    if(valid_P && !STRATEGY_REG[0])begin
      if     (addr_P<addr_offset0)SRAM_Psum1_0[addr_P]              <= psum_1_for_strategy1;
      else if(addr_P<addr_offset1)SRAM_Psum1_1[addr_P-addr_offset0] <= psum_1_for_strategy1;
      else if(addr_P<addr_offset2)SRAM_Psum1_2[addr_P-addr_offset1] <= psum_1_for_strategy1;
      else                        SRAM_Psum1_3[addr_P-addr_offset2] <= psum_1_for_strategy1;
    end else if(valid_P && STRATEGY_REG[0])begin
      SRAM_Psum1_0[addr_P] <= psum_1_for_strategy2[31:0];
      SRAM_Psum1_1[addr_P] <= psum_1_for_strategy2[63:32];
      SRAM_Psum1_2[addr_P] <= psum_1_for_strategy2[95:64];
      SRAM_Psum1_3[addr_P] <= psum_1_for_strategy2[127:96];
    end
  end

  always@(negedge clk)begin
    if(valid_P && !STRATEGY_REG[0])begin
      if     (addr_P<addr_offset0)SRAM_Psum2_0[addr_P]              <= psum_2_for_strategy1;
      else if(addr_P<addr_offset1)SRAM_Psum2_1[addr_P-addr_offset0] <= psum_2_for_strategy1;
      else if(addr_P<addr_offset2)SRAM_Psum2_2[addr_P-addr_offset1] <= psum_2_for_strategy1;
      else                        SRAM_Psum2_3[addr_P-addr_offset2] <= psum_2_for_strategy1;
    end else if(valid_P && STRATEGY_REG[0])begin
      SRAM_Psum2_0[addr_P] <= psum_2_for_strategy2[31:0];
      SRAM_Psum2_1[addr_P] <= psum_2_for_strategy2[63:32];
      SRAM_Psum2_2[addr_P] <= psum_2_for_strategy2[95:64];
      SRAM_Psum2_3[addr_P] <= psum_2_for_strategy2[127:96];
    end
  end

  always@(negedge clk)begin
    if(valid_P && !STRATEGY_REG[0])begin
      if     (addr_P<addr_offset0)SRAM_Psum3_0[addr_P]              <= psum_3_for_strategy1;
      else if(addr_P<addr_offset1)SRAM_Psum3_1[addr_P-addr_offset0] <= psum_3_for_strategy1;
      else if(addr_P<addr_offset2)SRAM_Psum3_2[addr_P-addr_offset1] <= psum_3_for_strategy1;
      else                        SRAM_Psum3_3[addr_P-addr_offset2] <= psum_3_for_strategy1;
    end else if(valid_P && STRATEGY_REG[0])begin
      SRAM_Psum3_0[addr_P] <= psum_3_for_strategy2[31:0];
      SRAM_Psum3_1[addr_P] <= psum_3_for_strategy2[63:32];
      SRAM_Psum3_2[addr_P] <= psum_3_for_strategy2[95:64];
      SRAM_Psum3_3[addr_P] <= psum_3_for_strategy2[127:96];
    end
  end

  always@(negedge clk)begin
    if(valid_P && !STRATEGY_REG[0])begin
      if     (addr_P<addr_offset0)SRAM_Psum4_0[addr_P]              <= psum_4_for_strategy1;
      else if(addr_P<addr_offset1)SRAM_Psum4_1[addr_P-addr_offset0] <= psum_4_for_strategy1;
      else if(addr_P<addr_offset2)SRAM_Psum4_2[addr_P-addr_offset1] <= psum_4_for_strategy1;
      else                        SRAM_Psum4_3[addr_P-addr_offset2] <= psum_4_for_strategy1;
    end else if(valid_P && STRATEGY_REG[0])begin
      SRAM_Psum4_0[addr_P] <= psum_4_for_strategy2[31:0];
      SRAM_Psum4_1[addr_P] <= psum_4_for_strategy2[63:32];
      SRAM_Psum4_2[addr_P] <= psum_4_for_strategy2[95:64];
      SRAM_Psum4_3[addr_P] <= psum_4_for_strategy2[127:96];
    end
  end

  always@(negedge clk)begin
    if(valid_P && !STRATEGY_REG[0])begin
      if     (addr_P<addr_offset0)SRAM_Psum5_0[addr_P]              <= psum_5_for_strategy1;
      else if(addr_P<addr_offset1)SRAM_Psum5_1[addr_P-addr_offset0] <= psum_5_for_strategy1;
      else if(addr_P<addr_offset2)SRAM_Psum5_2[addr_P-addr_offset1] <= psum_5_for_strategy1;
      else                        SRAM_Psum5_3[addr_P-addr_offset2] <= psum_5_for_strategy1;
    end else if(valid_P && STRATEGY_REG[0])begin
      SRAM_Psum5_0[addr_P] <= psum_5_for_strategy2[31:0];
      SRAM_Psum5_1[addr_P] <= psum_5_for_strategy2[63:32];
      SRAM_Psum5_2[addr_P] <= psum_5_for_strategy2[95:64];
      SRAM_Psum5_3[addr_P] <= psum_5_for_strategy2[127:96];
    end
  end

  always@(negedge clk)begin
    if(valid_P && !STRATEGY_REG[0])begin
      if     (addr_P<addr_offset0)SRAM_Psum6_0[addr_P]              <= psum_6_for_strategy1;
      else if(addr_P<addr_offset1)SRAM_Psum6_1[addr_P-addr_offset0] <= psum_6_for_strategy1;
      else if(addr_P<addr_offset2)SRAM_Psum6_2[addr_P-addr_offset1] <= psum_6_for_strategy1;
      else                        SRAM_Psum6_3[addr_P-addr_offset2] <= psum_6_for_strategy1;
    end else if(valid_P && STRATEGY_REG[0])begin
      SRAM_Psum6_0[addr_P] <= psum_6_for_strategy2[31:0];
      SRAM_Psum6_1[addr_P] <= psum_6_for_strategy2[63:32];
      SRAM_Psum6_2[addr_P] <= psum_6_for_strategy2[95:64];
      SRAM_Psum6_3[addr_P] <= psum_6_for_strategy2[127:96];
    end
  end

  always@(negedge clk)begin
    if(valid_P && !STRATEGY_REG[0])begin
      if     (addr_P<addr_offset0)SRAM_Psum7_0[addr_P]              <= psum_7_for_strategy1;
      else if(addr_P<addr_offset1)SRAM_Psum7_1[addr_P-addr_offset0] <= psum_7_for_strategy1;
      else if(addr_P<addr_offset2)SRAM_Psum7_2[addr_P-addr_offset1] <= psum_7_for_strategy1;
      else                        SRAM_Psum7_3[addr_P-addr_offset2] <= psum_7_for_strategy1;
    end else if(valid_P && STRATEGY_REG[0])begin
      SRAM_Psum7_0[addr_P] <= psum_7_for_strategy2[31:0];
      SRAM_Psum7_1[addr_P] <= psum_7_for_strategy2[63:32];
      SRAM_Psum7_2[addr_P] <= psum_7_for_strategy2[95:64];
      SRAM_Psum7_3[addr_P] <= psum_7_for_strategy2[127:96];
    end
  end

  always@(negedge clk)begin
    if(valid_P && !STRATEGY_REG[0])begin
      if     (addr_P<addr_offset0)SRAM_Psum8_0[addr_P]              <= psum_8_for_strategy1;
      else if(addr_P<addr_offset1)SRAM_Psum8_1[addr_P-addr_offset0] <= psum_8_for_strategy1;
      else if(addr_P<addr_offset2)SRAM_Psum8_2[addr_P-addr_offset1] <= psum_8_for_strategy1;
      else                        SRAM_Psum8_3[addr_P-addr_offset2] <= psum_8_for_strategy1;
    end else if(valid_P && STRATEGY_REG[0])begin
      SRAM_Psum8_0[addr_P] <= psum_8_for_strategy2[31:0];
      SRAM_Psum8_1[addr_P] <= psum_8_for_strategy2[63:32];
      SRAM_Psum8_2[addr_P] <= psum_8_for_strategy2[95:64];
      SRAM_Psum8_3[addr_P] <= psum_8_for_strategy2[127:96];
    end
  end

  always@(negedge clk)begin
    if(valid_P && !STRATEGY_REG[0])begin
      if     (addr_P<addr_offset0)SRAM_Psum9_0[addr_P]              <= psum_9_for_strategy1;
      else if(addr_P<addr_offset1)SRAM_Psum9_1[addr_P-addr_offset0] <= psum_9_for_strategy1;
      else if(addr_P<addr_offset2)SRAM_Psum9_2[addr_P-addr_offset1] <= psum_9_for_strategy1;
      else                        SRAM_Psum9_3[addr_P-addr_offset2] <= psum_9_for_strategy1;
    end else if(valid_P && STRATEGY_REG[0])begin
      SRAM_Psum9_0[addr_P] <= psum_9_for_strategy2[31:0];
      SRAM_Psum9_1[addr_P] <= psum_9_for_strategy2[63:32];
      SRAM_Psum9_2[addr_P] <= psum_9_for_strategy2[95:64];
      SRAM_Psum9_3[addr_P] <= psum_9_for_strategy2[127:96];
    end
  end

  always@(negedge clk)begin
    if(valid_P && !STRATEGY_REG[0])begin
      if     (addr_P<addr_offset0)SRAM_Psum10_0[addr_P]              <= psum_10_for_strategy1;
      else if(addr_P<addr_offset1)SRAM_Psum10_1[addr_P-addr_offset0] <= psum_10_for_strategy1;
      else if(addr_P<addr_offset2)SRAM_Psum10_2[addr_P-addr_offset1] <= psum_10_for_strategy1;
      else                        SRAM_Psum10_3[addr_P-addr_offset2] <= psum_10_for_strategy1;
    end else if(valid_P && STRATEGY_REG[0])begin
      SRAM_Psum10_0[addr_P] <= psum_10_for_strategy2[31:0];
      SRAM_Psum10_1[addr_P] <= psum_10_for_strategy2[63:32];
      SRAM_Psum10_2[addr_P] <= psum_10_for_strategy2[95:64];
      SRAM_Psum10_3[addr_P] <= psum_10_for_strategy2[127:96];
    end
  end

  always@(negedge clk)begin
    if(valid_P && !STRATEGY_REG[0])begin
      if     (addr_P<addr_offset0)SRAM_Psum11_0[addr_P]              <= psum_11_for_strategy1;
      else if(addr_P<addr_offset1)SRAM_Psum11_1[addr_P-addr_offset0] <= psum_11_for_strategy1;
      else if(addr_P<addr_offset2)SRAM_Psum11_2[addr_P-addr_offset1] <= psum_11_for_strategy1;
      else                        SRAM_Psum11_3[addr_P-addr_offset2] <= psum_11_for_strategy1;
    end else if(valid_P && STRATEGY_REG[0])begin
      SRAM_Psum11_0[addr_P] <= psum_11_for_strategy2[31:0];
      SRAM_Psum11_1[addr_P] <= psum_11_for_strategy2[63:32];
      SRAM_Psum11_2[addr_P] <= psum_11_for_strategy2[95:64];
      SRAM_Psum11_3[addr_P] <= psum_11_for_strategy2[127:96];
    end
  end

  always@(negedge clk)begin
    if(valid_P && !STRATEGY_REG[0])begin
      if     (addr_P<addr_offset0)SRAM_Psum12_0[addr_P]              <= psum_12_for_strategy1;
      else if(addr_P<addr_offset1)SRAM_Psum12_1[addr_P-addr_offset0] <= psum_12_for_strategy1;
      else if(addr_P<addr_offset2)SRAM_Psum12_2[addr_P-addr_offset1] <= psum_12_for_strategy1;
      else                        SRAM_Psum12_3[addr_P-addr_offset2] <= psum_12_for_strategy1;
    end else if(valid_P && STRATEGY_REG[0])begin
      SRAM_Psum12_0[addr_P] <= psum_12_for_strategy2[31:0];
      SRAM_Psum12_1[addr_P] <= psum_12_for_strategy2[63:32];
      SRAM_Psum12_2[addr_P] <= psum_12_for_strategy2[95:64];
      SRAM_Psum12_3[addr_P] <= psum_12_for_strategy2[127:96];
    end
  end

  always@(negedge clk)begin
    if(valid_P && !STRATEGY_REG[0])begin
      if     (addr_P<addr_offset0)SRAM_Psum13_0[addr_P]              <= psum_13_for_strategy1;
      else if(addr_P<addr_offset1)SRAM_Psum13_1[addr_P-addr_offset0] <= psum_13_for_strategy1;
      else if(addr_P<addr_offset2)SRAM_Psum13_2[addr_P-addr_offset1] <= psum_13_for_strategy1;
      else                        SRAM_Psum13_3[addr_P-addr_offset2] <= psum_13_for_strategy1;
    end else if(valid_P && STRATEGY_REG[0])begin
      SRAM_Psum13_0[addr_P] <= psum_13_for_strategy2[31:0];
      SRAM_Psum13_1[addr_P] <= psum_13_for_strategy2[63:32];
      SRAM_Psum13_2[addr_P] <= psum_13_for_strategy2[95:64];
      SRAM_Psum13_3[addr_P] <= psum_13_for_strategy2[127:96];
    end
  end

  always@(negedge clk)begin
    if(valid_P && !STRATEGY_REG[0])begin
      if     (addr_P<addr_offset0)SRAM_Psum14_0[addr_P]              <= psum_14_for_strategy1;
      else if(addr_P<addr_offset1)SRAM_Psum14_1[addr_P-addr_offset0] <= psum_14_for_strategy1;
      else if(addr_P<addr_offset2)SRAM_Psum14_2[addr_P-addr_offset1] <= psum_14_for_strategy1;
      else                        SRAM_Psum14_3[addr_P-addr_offset2] <= psum_14_for_strategy1;
    end else if(valid_P && STRATEGY_REG[0])begin
      SRAM_Psum14_0[addr_P] <= psum_14_for_strategy2[31:0];
      SRAM_Psum14_1[addr_P] <= psum_14_for_strategy2[63:32];
      SRAM_Psum14_2[addr_P] <= psum_14_for_strategy2[95:64];
      SRAM_Psum14_3[addr_P] <= psum_14_for_strategy2[127:96];
    end
  end

  always@(negedge clk)begin
    if(valid_P && !STRATEGY_REG[0])begin
      if     (addr_P<addr_offset0)SRAM_Psum15_0[addr_P]              <= psum_15_for_strategy1;
      else if(addr_P<addr_offset1)SRAM_Psum15_1[addr_P-addr_offset0] <= psum_15_for_strategy1;
      else if(addr_P<addr_offset2)SRAM_Psum15_2[addr_P-addr_offset1] <= psum_15_for_strategy1;
      else                        SRAM_Psum15_3[addr_P-addr_offset2] <= psum_15_for_strategy1;
    end else if(valid_P && STRATEGY_REG[0])begin
      SRAM_Psum15_0[addr_P] <= psum_15_for_strategy2[31:0];
      SRAM_Psum15_1[addr_P] <= psum_15_for_strategy2[63:32];
      SRAM_Psum15_2[addr_P] <= psum_15_for_strategy2[95:64];
      SRAM_Psum15_3[addr_P] <= psum_15_for_strategy2[127:96];
    end
  end

//////////////////////////////////////////add last tile psum///////////////////////////
  
  always@(negedge clk)begin
    if(valid_P_from_last_tile && !STRATEGY_REG[0])begin
      if     (addr_P_from_last_tile<addr_offset0)Psum_from_last_tile_0 <= SRAM_Psum0_0[addr_P_from_last_tile];
      else if(addr_P_from_last_tile<addr_offset1)Psum_from_last_tile_0 <= SRAM_Psum0_1[addr_P_from_last_tile-addr_offset0];
      else if(addr_P_from_last_tile<addr_offset2)Psum_from_last_tile_0 <= SRAM_Psum0_2[addr_P_from_last_tile-addr_offset1];
      else                                                 Psum_from_last_tile_0 <= SRAM_Psum0_3[addr_P_from_last_tile-addr_offset2];
    end else if(valid_P_from_last_tile && STRATEGY_REG[0])begin
      Psum_from_last_tile_0_0 <= SRAM_Psum0_0[addr_P_from_last_tile];
      Psum_from_last_tile_1_0 <= SRAM_Psum0_1[addr_P_from_last_tile];
      Psum_from_last_tile_2_0 <= SRAM_Psum0_2[addr_P_from_last_tile];
      Psum_from_last_tile_3_0 <= SRAM_Psum0_3[addr_P_from_last_tile];
    end
  end

  always@(negedge clk)begin
    if(valid_P_from_last_tile && !STRATEGY_REG[0])begin
      if     (addr_P_from_last_tile<addr_offset0)Psum_from_last_tile_1 <= SRAM_Psum1_0[addr_P_from_last_tile];
      else if(addr_P_from_last_tile<addr_offset1)Psum_from_last_tile_1 <= SRAM_Psum1_1[addr_P_from_last_tile-addr_offset0];
      else if(addr_P_from_last_tile<addr_offset2)Psum_from_last_tile_1 <= SRAM_Psum1_2[addr_P_from_last_tile-addr_offset1];
      else                                                 Psum_from_last_tile_1 <= SRAM_Psum1_3[addr_P_from_last_tile-addr_offset2];
    end else if(valid_P_from_last_tile && STRATEGY_REG[0])begin
      Psum_from_last_tile_0_1 <= SRAM_Psum1_0[addr_P_from_last_tile];
      Psum_from_last_tile_1_1 <= SRAM_Psum1_1[addr_P_from_last_tile];
      Psum_from_last_tile_2_1 <= SRAM_Psum1_2[addr_P_from_last_tile];
      Psum_from_last_tile_3_1 <= SRAM_Psum1_3[addr_P_from_last_tile];
    end
  end

  always@(negedge clk)begin
    if(valid_P_from_last_tile && !STRATEGY_REG[0])begin
      if     (addr_P_from_last_tile<addr_offset0)Psum_from_last_tile_2 <= SRAM_Psum2_0[addr_P_from_last_tile];
      else if(addr_P_from_last_tile<addr_offset1)Psum_from_last_tile_2 <= SRAM_Psum2_1[addr_P_from_last_tile-addr_offset0];
      else if(addr_P_from_last_tile<addr_offset2)Psum_from_last_tile_2 <= SRAM_Psum2_2[addr_P_from_last_tile-addr_offset1];
      else                                                 Psum_from_last_tile_2 <= SRAM_Psum2_3[addr_P_from_last_tile-addr_offset2];
    end else if(valid_P_from_last_tile && STRATEGY_REG[0])begin
      Psum_from_last_tile_0_2 <= SRAM_Psum2_0[addr_P_from_last_tile];
      Psum_from_last_tile_1_2 <= SRAM_Psum2_1[addr_P_from_last_tile];
      Psum_from_last_tile_2_2 <= SRAM_Psum2_2[addr_P_from_last_tile];
      Psum_from_last_tile_3_2 <= SRAM_Psum2_3[addr_P_from_last_tile];
    end
  end

  always@(negedge clk)begin
    if(valid_P_from_last_tile && !STRATEGY_REG[0])begin
      if     (addr_P_from_last_tile<addr_offset0)Psum_from_last_tile_3 <= SRAM_Psum3_0[addr_P_from_last_tile];
      else if(addr_P_from_last_tile<addr_offset1)Psum_from_last_tile_3 <= SRAM_Psum3_1[addr_P_from_last_tile-addr_offset0];
      else if(addr_P_from_last_tile<addr_offset2)Psum_from_last_tile_3 <= SRAM_Psum3_2[addr_P_from_last_tile-addr_offset1];
      else                                                 Psum_from_last_tile_3 <= SRAM_Psum3_3[addr_P_from_last_tile-addr_offset2];
    end else if(valid_P_from_last_tile && STRATEGY_REG[0])begin
      Psum_from_last_tile_0_3 <= SRAM_Psum3_0[addr_P_from_last_tile];
      Psum_from_last_tile_1_3 <= SRAM_Psum3_1[addr_P_from_last_tile];
      Psum_from_last_tile_2_3 <= SRAM_Psum3_2[addr_P_from_last_tile];
      Psum_from_last_tile_3_3 <= SRAM_Psum3_3[addr_P_from_last_tile];
    end
  end

  always@(negedge clk)begin
    if(valid_P_from_last_tile && !STRATEGY_REG[0])begin
      if     (addr_P_from_last_tile<addr_offset0)Psum_from_last_tile_4 <= SRAM_Psum4_0[addr_P_from_last_tile];
      else if(addr_P_from_last_tile<addr_offset1)Psum_from_last_tile_4 <= SRAM_Psum4_1[addr_P_from_last_tile-addr_offset0];
      else if(addr_P_from_last_tile<addr_offset2)Psum_from_last_tile_4 <= SRAM_Psum4_2[addr_P_from_last_tile-addr_offset1];
      else                                                 Psum_from_last_tile_4 <= SRAM_Psum4_3[addr_P_from_last_tile-addr_offset2];
    end else if(valid_P_from_last_tile && STRATEGY_REG[0])begin
      Psum_from_last_tile_0_4 <= SRAM_Psum4_0[addr_P_from_last_tile];
      Psum_from_last_tile_1_4 <= SRAM_Psum4_1[addr_P_from_last_tile];
      Psum_from_last_tile_2_4 <= SRAM_Psum4_2[addr_P_from_last_tile];
      Psum_from_last_tile_3_4 <= SRAM_Psum4_3[addr_P_from_last_tile];
    end
  end

  always@(negedge clk)begin
    if(valid_P_from_last_tile && !STRATEGY_REG[0])begin
      if     (addr_P_from_last_tile<addr_offset0)Psum_from_last_tile_5 <= SRAM_Psum5_0[addr_P_from_last_tile];
      else if(addr_P_from_last_tile<addr_offset1)Psum_from_last_tile_5 <= SRAM_Psum5_1[addr_P_from_last_tile-addr_offset0];
      else if(addr_P_from_last_tile<addr_offset2)Psum_from_last_tile_5 <= SRAM_Psum5_2[addr_P_from_last_tile-addr_offset1];
      else                                                 Psum_from_last_tile_5 <= SRAM_Psum5_3[addr_P_from_last_tile-addr_offset2];
    end else if(valid_P_from_last_tile && STRATEGY_REG[0])begin
      Psum_from_last_tile_0_5 <= SRAM_Psum5_0[addr_P_from_last_tile];
      Psum_from_last_tile_1_5 <= SRAM_Psum5_1[addr_P_from_last_tile];
      Psum_from_last_tile_2_5 <= SRAM_Psum5_2[addr_P_from_last_tile];
      Psum_from_last_tile_3_5 <= SRAM_Psum5_3[addr_P_from_last_tile];
    end
  end

  always@(negedge clk)begin
    if(valid_P_from_last_tile && !STRATEGY_REG[0])begin
      if     (addr_P_from_last_tile<addr_offset0)Psum_from_last_tile_6 <= SRAM_Psum6_0[addr_P_from_last_tile];
      else if(addr_P_from_last_tile<addr_offset1)Psum_from_last_tile_6 <= SRAM_Psum6_1[addr_P_from_last_tile-addr_offset0];
      else if(addr_P_from_last_tile<addr_offset2)Psum_from_last_tile_6 <= SRAM_Psum6_2[addr_P_from_last_tile-addr_offset1];
      else                                                 Psum_from_last_tile_6 <= SRAM_Psum6_3[addr_P_from_last_tile-addr_offset2];
    end else if(valid_P_from_last_tile && STRATEGY_REG[0])begin
      Psum_from_last_tile_0_6 <= SRAM_Psum6_0[addr_P_from_last_tile];
      Psum_from_last_tile_1_6 <= SRAM_Psum6_1[addr_P_from_last_tile];
      Psum_from_last_tile_2_6 <= SRAM_Psum6_2[addr_P_from_last_tile];
      Psum_from_last_tile_3_6 <= SRAM_Psum6_3[addr_P_from_last_tile];
    end
  end

  always@(negedge clk)begin
    if(valid_P_from_last_tile && !STRATEGY_REG[0])begin
      if     (addr_P_from_last_tile<addr_offset0)Psum_from_last_tile_7 <= SRAM_Psum7_0[addr_P_from_last_tile];
      else if(addr_P_from_last_tile<addr_offset1)Psum_from_last_tile_7 <= SRAM_Psum7_1[addr_P_from_last_tile-addr_offset0];
      else if(addr_P_from_last_tile<addr_offset2)Psum_from_last_tile_7 <= SRAM_Psum7_2[addr_P_from_last_tile-addr_offset1];
      else                                                 Psum_from_last_tile_7 <= SRAM_Psum7_3[addr_P_from_last_tile-addr_offset2];
    end else if(valid_P_from_last_tile && STRATEGY_REG[0])begin
      Psum_from_last_tile_0_7 <= SRAM_Psum7_0[addr_P_from_last_tile];
      Psum_from_last_tile_1_7 <= SRAM_Psum7_1[addr_P_from_last_tile];
      Psum_from_last_tile_2_7 <= SRAM_Psum7_2[addr_P_from_last_tile];
      Psum_from_last_tile_3_7 <= SRAM_Psum7_3[addr_P_from_last_tile];
    end
  end

  always@(negedge clk)begin
    if(valid_P_from_last_tile && !STRATEGY_REG[0])begin
      if     (addr_P_from_last_tile<addr_offset0)Psum_from_last_tile_8 <= SRAM_Psum8_0[addr_P_from_last_tile];
      else if(addr_P_from_last_tile<addr_offset1)Psum_from_last_tile_8 <= SRAM_Psum8_1[addr_P_from_last_tile-addr_offset0];
      else if(addr_P_from_last_tile<addr_offset2)Psum_from_last_tile_8 <= SRAM_Psum8_2[addr_P_from_last_tile-addr_offset1];
      else                                                 Psum_from_last_tile_8 <= SRAM_Psum8_3[addr_P_from_last_tile-addr_offset2];
    end else if(valid_P_from_last_tile && STRATEGY_REG[0])begin
      Psum_from_last_tile_0_8 <= SRAM_Psum8_0[addr_P_from_last_tile];
      Psum_from_last_tile_1_8 <= SRAM_Psum8_1[addr_P_from_last_tile];
      Psum_from_last_tile_2_8 <= SRAM_Psum8_2[addr_P_from_last_tile];
      Psum_from_last_tile_3_8 <= SRAM_Psum8_3[addr_P_from_last_tile];
    end
  end

  always@(negedge clk)begin
    if(valid_P_from_last_tile && !STRATEGY_REG[0])begin
      if     (addr_P_from_last_tile<addr_offset0)Psum_from_last_tile_9 <= SRAM_Psum9_0[addr_P_from_last_tile];
      else if(addr_P_from_last_tile<addr_offset1)Psum_from_last_tile_9 <= SRAM_Psum9_1[addr_P_from_last_tile-addr_offset0];
      else if(addr_P_from_last_tile<addr_offset2)Psum_from_last_tile_9 <= SRAM_Psum9_2[addr_P_from_last_tile-addr_offset1];
      else                                                 Psum_from_last_tile_9 <= SRAM_Psum9_3[addr_P_from_last_tile-addr_offset2];
    end else if(valid_P_from_last_tile && STRATEGY_REG[0])begin
      Psum_from_last_tile_0_9 <= SRAM_Psum9_0[addr_P_from_last_tile];
      Psum_from_last_tile_1_9 <= SRAM_Psum9_1[addr_P_from_last_tile];
      Psum_from_last_tile_2_9 <= SRAM_Psum9_2[addr_P_from_last_tile];
      Psum_from_last_tile_3_9 <= SRAM_Psum9_3[addr_P_from_last_tile];
    end
  end

  always@(negedge clk)begin
    if(valid_P_from_last_tile && !STRATEGY_REG[0])begin
      if     (addr_P_from_last_tile<addr_offset0)Psum_from_last_tile_10 <= SRAM_Psum10_0[addr_P_from_last_tile];
      else if(addr_P_from_last_tile<addr_offset1)Psum_from_last_tile_10 <= SRAM_Psum10_1[addr_P_from_last_tile-addr_offset0];
      else if(addr_P_from_last_tile<addr_offset2)Psum_from_last_tile_10 <= SRAM_Psum10_2[addr_P_from_last_tile-addr_offset1];
      else                                                Psum_from_last_tile_10 <= SRAM_Psum10_3[addr_P_from_last_tile-addr_offset2];
    end else if(valid_P_from_last_tile && STRATEGY_REG[0])begin
      Psum_from_last_tile_0_10 <= SRAM_Psum10_0[addr_P_from_last_tile];
      Psum_from_last_tile_1_10 <= SRAM_Psum10_1[addr_P_from_last_tile];
      Psum_from_last_tile_2_10 <= SRAM_Psum10_2[addr_P_from_last_tile];
      Psum_from_last_tile_3_10 <= SRAM_Psum10_3[addr_P_from_last_tile];
    end
  end

  always@(negedge clk)begin
    if(valid_P_from_last_tile && !STRATEGY_REG[0])begin
      if     (addr_P_from_last_tile<addr_offset0)Psum_from_last_tile_11 <= SRAM_Psum11_0[addr_P_from_last_tile];
      else if(addr_P_from_last_tile<addr_offset1)Psum_from_last_tile_11 <= SRAM_Psum11_1[addr_P_from_last_tile-addr_offset0];
      else if(addr_P_from_last_tile<addr_offset2)Psum_from_last_tile_11 <= SRAM_Psum11_2[addr_P_from_last_tile-addr_offset1];
      else                                                 Psum_from_last_tile_11 <= SRAM_Psum11_3[addr_P_from_last_tile-addr_offset2];
    end else if(valid_P_from_last_tile && STRATEGY_REG[0])begin
      Psum_from_last_tile_0_11 <= SRAM_Psum11_0[addr_P_from_last_tile];
      Psum_from_last_tile_1_11 <= SRAM_Psum11_1[addr_P_from_last_tile];
      Psum_from_last_tile_2_11 <= SRAM_Psum11_2[addr_P_from_last_tile];
      Psum_from_last_tile_3_11 <= SRAM_Psum11_3[addr_P_from_last_tile];
    end
  end

  always@(negedge clk)begin
    if(valid_P_from_last_tile && !STRATEGY_REG[0])begin
      if     (addr_P_from_last_tile<addr_offset0)Psum_from_last_tile_12 <= SRAM_Psum12_0[addr_P_from_last_tile];
      else if(addr_P_from_last_tile<addr_offset1)Psum_from_last_tile_12 <= SRAM_Psum12_1[addr_P_from_last_tile-addr_offset0];
      else if(addr_P_from_last_tile<addr_offset2)Psum_from_last_tile_12 <= SRAM_Psum12_2[addr_P_from_last_tile-addr_offset1];
      else                                                 Psum_from_last_tile_12 <= SRAM_Psum12_3[addr_P_from_last_tile-addr_offset2];
    end else if(valid_P_from_last_tile && STRATEGY_REG[0])begin
      Psum_from_last_tile_0_12 <= SRAM_Psum12_0[addr_P_from_last_tile];
      Psum_from_last_tile_1_12 <= SRAM_Psum12_1[addr_P_from_last_tile];
      Psum_from_last_tile_2_12 <= SRAM_Psum12_2[addr_P_from_last_tile];
      Psum_from_last_tile_3_12 <= SRAM_Psum12_3[addr_P_from_last_tile];
    end
  end

  always@(negedge clk)begin
    if(valid_P_from_last_tile && !STRATEGY_REG[0])begin
      if     (addr_P_from_last_tile<addr_offset0)Psum_from_last_tile_13 <= SRAM_Psum13_0[addr_P_from_last_tile];
      else if(addr_P_from_last_tile<addr_offset1)Psum_from_last_tile_13 <= SRAM_Psum13_1[addr_P_from_last_tile-addr_offset0];
      else if(addr_P_from_last_tile<addr_offset2)Psum_from_last_tile_13 <= SRAM_Psum13_2[addr_P_from_last_tile-addr_offset1];
      else                                                 Psum_from_last_tile_13 <= SRAM_Psum13_3[addr_P_from_last_tile-addr_offset2];
    end else if(valid_P_from_last_tile && STRATEGY_REG[0])begin
      Psum_from_last_tile_0_13 <= SRAM_Psum13_0[addr_P_from_last_tile];
      Psum_from_last_tile_1_13 <= SRAM_Psum13_1[addr_P_from_last_tile];
      Psum_from_last_tile_2_13 <= SRAM_Psum13_2[addr_P_from_last_tile];
      Psum_from_last_tile_3_13 <= SRAM_Psum13_3[addr_P_from_last_tile];
    end
  end

  always@(negedge clk)begin
    if(valid_P_from_last_tile && !STRATEGY_REG[0])begin
      if     (addr_P_from_last_tile<addr_offset0)Psum_from_last_tile_14 <= SRAM_Psum14_0[addr_P_from_last_tile];
      else if(addr_P_from_last_tile<addr_offset1)Psum_from_last_tile_14 <= SRAM_Psum14_1[addr_P_from_last_tile-addr_offset0];
      else if(addr_P_from_last_tile<addr_offset2)Psum_from_last_tile_14 <= SRAM_Psum14_2[addr_P_from_last_tile-addr_offset1];
      else                                                 Psum_from_last_tile_14 <= SRAM_Psum14_3[addr_P_from_last_tile-addr_offset2];
    end else if(valid_P_from_last_tile && STRATEGY_REG[0])begin
      Psum_from_last_tile_0_14 <= SRAM_Psum14_0[addr_P_from_last_tile];
      Psum_from_last_tile_1_14 <= SRAM_Psum14_1[addr_P_from_last_tile];
      Psum_from_last_tile_2_14 <= SRAM_Psum14_2[addr_P_from_last_tile];
      Psum_from_last_tile_3_14 <= SRAM_Psum14_3[addr_P_from_last_tile];
    end
  end

  always@(negedge clk)begin
    if(valid_P_from_last_tile && !STRATEGY_REG[0])begin
      if     (addr_P_from_last_tile<addr_offset0)Psum_from_last_tile_15 <= SRAM_Psum15_0[addr_P_from_last_tile];
      else if(addr_P_from_last_tile<addr_offset1)Psum_from_last_tile_15 <= SRAM_Psum15_1[addr_P_from_last_tile-addr_offset0];
      else if(addr_P_from_last_tile<addr_offset2)Psum_from_last_tile_15 <= SRAM_Psum15_2[addr_P_from_last_tile-addr_offset1];
      else                                                 Psum_from_last_tile_15 <= SRAM_Psum15_3[addr_P_from_last_tile-addr_offset2];
    end else if(valid_P_from_last_tile && STRATEGY_REG[0])begin
      Psum_from_last_tile_0_15 <= SRAM_Psum15_0[addr_P_from_last_tile];
      Psum_from_last_tile_1_15 <= SRAM_Psum15_1[addr_P_from_last_tile];
      Psum_from_last_tile_2_15 <= SRAM_Psum15_2[addr_P_from_last_tile];
      Psum_from_last_tile_3_15 <= SRAM_Psum15_3[addr_P_from_last_tile];
    end
  end

  integer total;
  integer error0;
  integer error1;
  integer error2;
  integer error3;
  integer error4;
  integer error5;
  integer error6;
  integer error7;
  integer error8;
  integer error9;
  integer error10;
  integer error11;
  integer error12;
  integer error13;
  integer error14;
  integer error15;
  integer error;

  always@(posedge clk)begin
    if(new_tile)begin
      A <= (A_bits==2'd2) ? 4'd8 :
           (A_bits==2'd1) ? 4'd4 :
           4'd2;
      W <= (W_bits==2'd2) ? 4'd8 :
           (W_bits==2'd1) ? 4'd4 :
           4'd2;
      # 1000000000000000000;
    end
  end

  reg [9:0] answer_num [0:1];
  initial begin
    $readmemb("configuration/num_answer.txt", answer_num);
  end
/*
  integer answer_num;
  always@(*)begin
    answer_num = (DEPTH_WISE_REG[0] && MAXPOOL_REG[0]) ? 4 :
                 (DEPTH_WISE_REG[0]) ? 16 :
                 (MAXPOOL_REG[0]) ? 64 :
                 256;
  end
  */
  always@(negedge clk)begin
    if(busy_cube)begin
        total = 0;
        error0 = 0;
        error1 = 0;
        error2 = 0;
        error3 = 0;
        error4 = 0;
        error5 = 0;
        error6 = 0;
        error7 = 0;
        error8 = 0;
        error9 = 0;
        error10 = 0;
        error11 = 0;
        error12 = 0;
        error13 = 0;
        error14 = 0;
        error15 = 0;
        wait(done)begin
          for(i=0;i<2*`PAT_NUM;i=i+1)begin
            total = total + 1;
            if(SRAM_Psum0_0[i]!==SRAM_answer0_0[i]) error0 = error0 + 1;
            if(SRAM_Psum1_0[i]!==SRAM_answer1_0[i]) error1 = error1 + 1;
            if(SRAM_Psum2_0[i]!==SRAM_answer2_0[i]) error2 = error2 + 1;
            if(SRAM_Psum3_0[i]!==SRAM_answer3_0[i]) error3 = error3 + 1;
            if(SRAM_Psum4_0[i]!==SRAM_answer4_0[i]) error4 = error4 + 1;
            if(SRAM_Psum5_0[i]!==SRAM_answer5_0[i]) error5 = error5 + 1;
            if(SRAM_Psum6_0[i]!==SRAM_answer6_0[i]) error6 = error6 + 1;
            if(SRAM_Psum7_0[i]!==SRAM_answer7_0[i]) error7 = error7 + 1;
            if(SRAM_Psum8_0[i]!==SRAM_answer8_0[i]) error8 = error8 + 1;
            if(SRAM_Psum9_0[i]!==SRAM_answer9_0[i]) error9 = error9 + 1;
            if(SRAM_Psum10_0[i]!==SRAM_answer10_0[i]) error10 = error10 + 1;
            if(SRAM_Psum11_0[i]!==SRAM_answer11_0[i]) error11 = error11 + 1;
            if(SRAM_Psum12_0[i]!==SRAM_answer12_0[i]) error12 = error12 + 1;
            if(SRAM_Psum13_0[i]!==SRAM_answer13_0[i]) error13 = error13 + 1;
            if(SRAM_Psum14_0[i]!==SRAM_answer14_0[i]) error14 = error14 + 1;
            if(SRAM_Psum15_0[i]!==SRAM_answer15_0[i]) error15 = error15 + 1;
            if(SRAM_Psum0_1[i]!==SRAM_answer0_1[i]) error0 = error0 + 1;
            if(SRAM_Psum1_1[i]!==SRAM_answer1_1[i]) error1 = error1 + 1;
            if(SRAM_Psum2_1[i]!==SRAM_answer2_1[i]) error2 = error2 + 1;
            if(SRAM_Psum3_1[i]!==SRAM_answer3_1[i]) error3 = error3 + 1;
            if(SRAM_Psum4_1[i]!==SRAM_answer4_1[i]) error4 = error4 + 1;
            if(SRAM_Psum5_1[i]!==SRAM_answer5_1[i]) error5 = error5 + 1;
            if(SRAM_Psum6_1[i]!==SRAM_answer6_1[i]) error6 = error6 + 1;
            if(SRAM_Psum7_1[i]!==SRAM_answer7_1[i]) error7 = error7 + 1;
            if(SRAM_Psum8_1[i]!==SRAM_answer8_1[i]) error8 = error8 + 1;
            if(SRAM_Psum9_1[i]!==SRAM_answer9_1[i]) error9 = error9 + 1;
            if(SRAM_Psum10_1[i]!==SRAM_answer10_1[i]) error10 = error10 + 1;
            if(SRAM_Psum11_1[i]!==SRAM_answer11_1[i]) error11 = error11 + 1;
            if(SRAM_Psum12_1[i]!==SRAM_answer12_1[i]) error12 = error12 + 1;
            if(SRAM_Psum13_1[i]!==SRAM_answer13_1[i]) error13 = error13 + 1;
            if(SRAM_Psum14_1[i]!==SRAM_answer14_1[i]) error14 = error14 + 1;
            if(SRAM_Psum15_1[i]!==SRAM_answer15_1[i]) error15 = error15 + 1;
            if(SRAM_Psum0_2[i]!==SRAM_answer0_2[i]) error0 = error0 + 1;
            if(SRAM_Psum1_2[i]!==SRAM_answer1_2[i]) error1 = error1 + 1;
            if(SRAM_Psum2_2[i]!==SRAM_answer2_2[i]) error2 = error2 + 1;
            if(SRAM_Psum3_2[i]!==SRAM_answer3_2[i]) error3 = error3 + 1;
            if(SRAM_Psum4_2[i]!==SRAM_answer4_2[i]) error4 = error4 + 1;
            if(SRAM_Psum5_2[i]!==SRAM_answer5_2[i]) error5 = error5 + 1;
            if(SRAM_Psum6_2[i]!==SRAM_answer6_2[i]) error6 = error6 + 1;
            if(SRAM_Psum7_2[i]!==SRAM_answer7_2[i]) error7 = error7 + 1;
            if(SRAM_Psum8_2[i]!==SRAM_answer8_2[i]) error8 = error8 + 1;
            if(SRAM_Psum9_2[i]!==SRAM_answer9_2[i]) error9 = error9 + 1;
            if(SRAM_Psum10_2[i]!==SRAM_answer10_2[i]) error10 = error10 + 1;
            if(SRAM_Psum11_2[i]!==SRAM_answer11_2[i]) error11 = error11 + 1;
            if(SRAM_Psum12_2[i]!==SRAM_answer12_2[i]) error12 = error12 + 1;
            if(SRAM_Psum13_2[i]!==SRAM_answer13_2[i]) error13 = error13 + 1;
            if(SRAM_Psum14_2[i]!==SRAM_answer14_2[i]) error14 = error14 + 1;
            if(SRAM_Psum15_2[i]!==SRAM_answer15_2[i]) error15 = error15 + 1;
            if(SRAM_Psum0_3[i]!==SRAM_answer0_3[i]) error0 = error0 + 1;
            if(SRAM_Psum1_3[i]!==SRAM_answer1_3[i]) error1 = error1 + 1;
            if(SRAM_Psum2_3[i]!==SRAM_answer2_3[i]) error2 = error2 + 1;
            if(SRAM_Psum3_3[i]!==SRAM_answer3_3[i]) error3 = error3 + 1;
            if(SRAM_Psum4_3[i]!==SRAM_answer4_3[i]) error4 = error4 + 1;
            if(SRAM_Psum5_3[i]!==SRAM_answer5_3[i]) error5 = error5 + 1;
            if(SRAM_Psum6_3[i]!==SRAM_answer6_3[i]) error6 = error6 + 1;
            if(SRAM_Psum7_3[i]!==SRAM_answer7_3[i]) error7 = error7 + 1;
            if(SRAM_Psum8_3[i]!==SRAM_answer8_3[i]) error8 = error8 + 1;
            if(SRAM_Psum9_3[i]!==SRAM_answer9_3[i]) error9 = error9 + 1;
            if(SRAM_Psum10_3[i]!==SRAM_answer10_3[i]) error10 = error10 + 1;
            if(SRAM_Psum11_3[i]!==SRAM_answer11_3[i]) error11 = error11 + 1;
            if(SRAM_Psum12_3[i]!==SRAM_answer12_3[i]) error12 = error12 + 1;
            if(SRAM_Psum13_3[i]!==SRAM_answer13_3[i]) error13 = error13 + 1;
            if(SRAM_Psum14_3[i]!==SRAM_answer14_3[i]) error14 = error14 + 1;
            if(SRAM_Psum15_3[i]!==SRAM_answer15_3[i]) error15 = error15 + 1;
          end
          error = error0 + error1 + error2 + error3 + error4 + error5 + error6 + error7 + error8 + error9 + error10 + error11 + error12 + error13 + error14 + error15;
          $display("%d", total);
          $display("######################################################");
          $display("#                                                    #");
          //$display("%d", A_signed);
          if(A_SIGNED_REG[0]==1'b1)$display("#    signed  %dA%dW by strategy%d computing result    #", A, W, STRATEGY_REG[0]+2'b1);
          else                     $display("#   unsigned  %dA%dW by strategy%d computing result   #", A, W, STRATEGY_REG[0]+2'b1);
          
          $display("#                                                    #");
          $display("######################################################\n");
          if(error0==0) $display("               00 computing successfully");
          else          $display("               00 computing error, %d error", error0);
          if(error1==0) $display("               01 computing successfully");
          else          $display("               01 computing error, %d error", error1);
          if(error2==0) $display("               02 computing successfully");
          else          $display("               02 computing error, %d error", error2);
          if(error3==0) $display("               03 computing successfully");
          else          $display("               03 computing error, %d error", error3);
          if(error4==0) $display("               04 computing successfully");
          else          $display("               04 computing error, %d error", error4);
          if(error5==0) $display("               05 computing successfully");
          else          $display("               05 computing error, %d error", error5);
          if(error6==0) $display("               06 computing successfully");
          else          $display("               06 computing error, %d error", error6);
          if(error7==0) $display("               07 computing successfully");
          else          $display("               07 computing error, %d error", error7);
          if(error8==0) $display("               08 computing successfully");
          else          $display("               08 computing error, %d error", error8);
          if(error9==0) $display("               09 computing successfully");
          else          $display("               09 computing error, %d error", error9);
          if(error10==0) $display("               10 computing successfully");
          else           $display("               10 computing error, %d error", error10);
          if(error11==0) $display("               11 computing successfully");
          else           $display("               11 computing error, %d error", error11);
          if(error12==0) $display("               12 computing successfully");
          else           $display("               12 computing error, %d error", error12);
          if(error13==0) $display("               13 computing successfully");
          else           $display("               13 computing error, %d error", error13);
          if(error14==0) $display("               14 computing successfully");
          else           $display("               14 computing error, %d error", error14);
          if(error15==0) $display("               15 computing successfully");
          else           $display("               15 computing error, %d error", error15);
          
        end
        #(`CYCLE) $finish;
    end
  end

endmodule
