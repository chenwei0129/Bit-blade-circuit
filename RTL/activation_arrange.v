module activation_arrange(
  input i_clk,
  input i_rst_n,
  input [127:0] i_src_A_0,
  input [127:0] i_src_A_1,
  input [127:0] i_src_A_2,
  input [127:0] i_src_A_3,
  input [2:0] i_A_arrange,
  input [1:0] i_A_arrange_index,
  output reg [31:0] o_A0,
  output reg [31:0] o_A1,
  output reg [31:0] o_A2,
  output reg [31:0] o_A3,
  output reg [31:0] o_A4,
  output reg [31:0] o_A5,
  output reg [31:0] o_A6,
  output reg [31:0] o_A7,
  output reg [31:0] o_A8,
  output reg [31:0] o_A9,
  output reg [31:0] o_A10,
  output reg [31:0] o_A11,
  output reg [31:0] o_A12,
  output reg [31:0] o_A13,
  output reg [31:0] o_A14,
  output reg [31:0] o_A15
);

  reg [31:0] A0_temp;
  reg [31:0] A1_temp;
  reg [31:0] A2_temp;
  reg [31:0] A3_temp;
  reg [31:0] A4_temp;
  reg [31:0] A5_temp;
  reg [31:0] A6_temp;
  reg [31:0] A7_temp;
  reg [31:0] A8_temp;
  reg [31:0] A9_temp;
  reg [31:0] A10_temp;
  reg [31:0] A11_temp;
  reg [31:0] A12_temp;
  reg [31:0] A13_temp;
  reg [31:0] A14_temp;
  reg [31:0] A15_temp;

  wire [31:0] A0_temp_new  = {A0_temp[1:0], A1_temp[1:0], A2_temp[1:0], A3_temp[1:0], A4_temp[1:0], A5_temp[1:0], A6_temp[1:0], A7_temp[1:0], A8_temp[1:0], A9_temp[1:0], A10_temp[1:0], A11_temp[1:0], A12_temp[1:0], A13_temp[1:0], A14_temp[1:0], A15_temp[1:0]};
  wire [31:0] A1_temp_new  = {A0_temp[3:2], A1_temp[3:2], A2_temp[3:2], A3_temp[3:2], A4_temp[3:2], A5_temp[3:2], A6_temp[3:2], A7_temp[3:2], A8_temp[3:2], A9_temp[3:2], A10_temp[3:2], A11_temp[3:2], A12_temp[3:2], A13_temp[3:2], A14_temp[3:2], A15_temp[3:2]};
  wire [31:0] A2_temp_new  = {A0_temp[5:4], A1_temp[5:4], A2_temp[5:4], A3_temp[5:4], A4_temp[5:4], A5_temp[5:4], A6_temp[5:4], A7_temp[5:4], A8_temp[5:4], A9_temp[5:4], A10_temp[5:4], A11_temp[5:4], A12_temp[5:4], A13_temp[5:4], A14_temp[5:4], A15_temp[5:4]};
  wire [31:0] A3_temp_new  = {A0_temp[7:6], A1_temp[7:6], A2_temp[7:6], A3_temp[7:6], A4_temp[7:6], A5_temp[7:6], A6_temp[7:6], A7_temp[7:6], A8_temp[7:6], A9_temp[7:6], A10_temp[7:6], A11_temp[7:6], A12_temp[7:6], A13_temp[7:6], A14_temp[7:6], A15_temp[7:6]};
  wire [31:0] A4_temp_new  = {A0_temp[9:8], A1_temp[9:8], A2_temp[9:8], A3_temp[9:8], A4_temp[9:8], A5_temp[9:8], A6_temp[9:8], A7_temp[9:8], A8_temp[9:8], A9_temp[9:8], A10_temp[9:8], A11_temp[9:8], A12_temp[9:8], A13_temp[9:8], A14_temp[9:8], A15_temp[9:8]};
  wire [31:0] A5_temp_new  = {A0_temp[11:10], A1_temp[11:10], A2_temp[11:10], A3_temp[11:10], A4_temp[11:10], A5_temp[11:10], A6_temp[11:10], A7_temp[11:10], A8_temp[11:10], A9_temp[11:10], A10_temp[11:10], A11_temp[11:10], A12_temp[11:10], A13_temp[11:10], A14_temp[11:10], A15_temp[11:10]};
  wire [31:0] A6_temp_new  = {A0_temp[13:12], A1_temp[13:12], A2_temp[13:12], A3_temp[13:12], A4_temp[13:12], A5_temp[13:12], A6_temp[13:12], A7_temp[13:12], A8_temp[13:12], A9_temp[13:12], A10_temp[13:12], A11_temp[13:12], A12_temp[13:12], A13_temp[13:12], A14_temp[13:12], A15_temp[13:12]};
  wire [31:0] A7_temp_new  = {A0_temp[15:14], A1_temp[15:14], A2_temp[15:14], A3_temp[15:14], A4_temp[15:14], A5_temp[15:14], A6_temp[15:14], A7_temp[15:14], A8_temp[15:14], A9_temp[15:14], A10_temp[15:14], A11_temp[15:14], A12_temp[15:14], A13_temp[15:14], A14_temp[15:14], A15_temp[15:14]};
  wire [31:0] A8_temp_new  = {A0_temp[17:16], A1_temp[17:16], A2_temp[17:16], A3_temp[17:16], A4_temp[17:16], A5_temp[17:16], A6_temp[17:16], A7_temp[17:16], A8_temp[17:16], A9_temp[17:16], A10_temp[17:16], A11_temp[17:16], A12_temp[17:16], A13_temp[17:16], A14_temp[17:16], A15_temp[17:16]};
  wire [31:0] A9_temp_new  = {A0_temp[19:18], A1_temp[19:18], A2_temp[19:18], A3_temp[19:18], A4_temp[19:18], A5_temp[19:18], A6_temp[19:18], A7_temp[19:18], A8_temp[19:18], A9_temp[19:18], A10_temp[19:18], A11_temp[19:18], A12_temp[19:18], A13_temp[19:18], A14_temp[19:18], A15_temp[19:18]};
  wire [31:0] A10_temp_new = {A0_temp[21:20], A1_temp[21:20], A2_temp[21:20], A3_temp[21:20], A4_temp[21:20], A5_temp[21:20], A6_temp[21:20], A7_temp[21:20], A8_temp[21:20], A9_temp[21:20], A10_temp[21:20], A11_temp[21:20], A12_temp[21:20], A13_temp[21:20], A14_temp[21:20], A15_temp[21:20]};
  wire [31:0] A11_temp_new = {A0_temp[23:22], A1_temp[23:22], A2_temp[23:22], A3_temp[23:22], A4_temp[23:22], A5_temp[23:22], A6_temp[23:22], A7_temp[23:22], A8_temp[23:22], A9_temp[23:22], A10_temp[23:22], A11_temp[23:22], A12_temp[23:22], A13_temp[23:22], A14_temp[23:22], A15_temp[23:22]};
  wire [31:0] A12_temp_new = {A0_temp[25:24], A1_temp[25:24], A2_temp[25:24], A3_temp[25:24], A4_temp[25:24], A5_temp[25:24], A6_temp[25:24], A7_temp[25:24], A8_temp[25:24], A9_temp[25:24], A10_temp[25:24], A11_temp[25:24], A12_temp[25:24], A13_temp[25:24], A14_temp[25:24], A15_temp[25:24]};
  wire [31:0] A13_temp_new = {A0_temp[27:26], A1_temp[27:26], A2_temp[27:26], A3_temp[27:26], A4_temp[27:26], A5_temp[27:26], A6_temp[27:26], A7_temp[27:26], A8_temp[27:26], A9_temp[27:26], A10_temp[27:26], A11_temp[27:26], A12_temp[27:26], A13_temp[27:26], A14_temp[27:26], A15_temp[27:26]};
  wire [31:0] A14_temp_new = {A0_temp[29:28], A1_temp[29:28], A2_temp[29:28], A3_temp[29:28], A4_temp[29:28], A5_temp[29:28], A6_temp[29:28], A7_temp[29:28], A8_temp[29:28], A9_temp[29:28], A10_temp[29:28], A11_temp[29:28], A12_temp[29:28], A13_temp[29:28], A14_temp[29:28], A15_temp[29:28]};
  wire [31:0] A15_temp_new = {A0_temp[31:30], A1_temp[31:30], A2_temp[31:30], A3_temp[31:30], A4_temp[31:30], A5_temp[31:30], A6_temp[31:30], A7_temp[31:30], A8_temp[31:30], A9_temp[31:30], A10_temp[31:30], A11_temp[31:30], A12_temp[31:30], A13_temp[31:30], A14_temp[31:30], A15_temp[31:30]};
  
  
  always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
      o_A0  <= 32'd0;
      o_A1  <= 32'd0;
      o_A2  <= 32'd0;
      o_A3  <= 32'd0;
      o_A4  <= 32'd0;
      o_A5  <= 32'd0;
      o_A6  <= 32'd0;
      o_A7  <= 32'd0;
      o_A8  <= 32'd0;
      o_A9  <= 32'd0;
      o_A10 <= 32'd0;
      o_A11 <= 32'd0;
      o_A12 <= 32'd0;
      o_A13 <= 32'd0;
      o_A14 <= 32'd0;
      o_A15 <= 32'd0;
    end else begin
      o_A0  <= A0_temp_new;  
      o_A1  <= A1_temp_new;
      o_A2  <= A2_temp_new;
      o_A3  <= A3_temp_new;
      o_A4  <= A4_temp_new;
      o_A5  <= A5_temp_new;
      o_A6  <= A6_temp_new;
      o_A7  <= A7_temp_new;
      o_A8  <= A8_temp_new;
      o_A9  <= A9_temp_new;
      o_A10 <= A10_temp_new;
      o_A11 <= A11_temp_new;
      o_A12 <= A12_temp_new;
      o_A13 <= A13_temp_new;
      o_A14 <= A14_temp_new;
      o_A15 <= A15_temp_new; 
    end
  end

  wire [127:0] A_for_now_8;
  assign A_for_now_8 = (i_A_arrange_index==2'd0) ? i_src_A_0 :
                       (i_A_arrange_index==2'd1) ? i_src_A_1 :
                       (i_A_arrange_index==2'd2) ? i_src_A_2 :
                       i_src_A_3;

  wire [127:0] A_for_now_4_0;
  assign A_for_now_4_0 = (i_A_arrange_index==2'd0) ? i_src_A_0 : i_src_A_2;
  wire [127:0] A_for_now_4_1;
  assign A_for_now_4_1 = (i_A_arrange_index==2'd0) ? i_src_A_1 : i_src_A_3;

  always@(*)begin
    case(i_A_arrange)
      3'd0:begin
        A0_temp  = i_src_A_0[31:0];
        A1_temp  = i_src_A_0[63:32];
        A2_temp  = i_src_A_0[95:64];
        A3_temp  = i_src_A_0[127:96];
        A4_temp  = i_src_A_1[31:0];
        A5_temp  = i_src_A_1[63:32];
        A6_temp  = i_src_A_1[95:64];
        A7_temp  = i_src_A_1[127:96];
        A8_temp  = i_src_A_2[31:0];
        A9_temp  = i_src_A_2[63:32];
        A10_temp = i_src_A_2[95:64];
        A11_temp = i_src_A_2[127:96];
        A12_temp = i_src_A_3[31:0];
        A13_temp = i_src_A_3[63:32];
        A14_temp = i_src_A_3[95:64];
        A15_temp = i_src_A_3[127:96];
      end
      3'd1:begin//42
        A0_temp  = i_src_A_0[31:0];
        A1_temp  = i_src_A_0[63:32];
        A2_temp  = i_src_A_0[95:64];
        A3_temp  = i_src_A_0[127:96];
        A4_temp  = i_src_A_1[31:0];
        A5_temp  = i_src_A_1[63:32];
        A6_temp  = i_src_A_1[95:64];
        A7_temp  = i_src_A_1[127:96];
        A8_temp  = i_src_A_2[31:0];
        A9_temp  = i_src_A_2[63:32];
        A10_temp = i_src_A_2[95:64];
        A11_temp = i_src_A_2[127:96];
        A12_temp = i_src_A_3[31:0];
        A13_temp = i_src_A_3[63:32];
        A14_temp = i_src_A_3[95:64];
        A15_temp = i_src_A_3[127:96];
      end
      3'd2:begin//44
        A0_temp  = {A_for_now_4_0[15:8], A_for_now_4_0[15:8], A_for_now_4_0[7:0], A_for_now_4_0[7:0]};
        A1_temp  = {A_for_now_4_0[31:24], A_for_now_4_0[31:24], A_for_now_4_0[23:16], A_for_now_4_0[23:16]};
        A2_temp  = {A_for_now_4_0[47:40], A_for_now_4_0[47:40], A_for_now_4_0[39:32], A_for_now_4_0[39:32]};
        A3_temp  = {A_for_now_4_0[63:56], A_for_now_4_0[63:56], A_for_now_4_0[55:48], A_for_now_4_0[55:48]};
        A4_temp  = {A_for_now_4_0[79:72], A_for_now_4_0[79:72], A_for_now_4_0[71:64], A_for_now_4_0[71:64]};
        A5_temp  = {A_for_now_4_0[95:88], A_for_now_4_0[95:88], A_for_now_4_0[87:80], A_for_now_4_0[87:80]};
        A6_temp  = {A_for_now_4_0[111:104], A_for_now_4_0[111:104], A_for_now_4_0[103:96], A_for_now_4_0[103:96]};
        A7_temp  = {A_for_now_4_0[127:120], A_for_now_4_0[127:120], A_for_now_4_0[119:112], A_for_now_4_0[119:112]};
        A8_temp  = {A_for_now_4_1[15:8], A_for_now_4_1[15:8], A_for_now_4_1[7:0], A_for_now_4_1[7:0]};
        A9_temp  = {A_for_now_4_1[31:24], A_for_now_4_1[31:24], A_for_now_4_1[23:16], A_for_now_4_1[23:16]};
        A10_temp = {A_for_now_4_1[47:40], A_for_now_4_1[47:40], A_for_now_4_1[39:32], A_for_now_4_1[39:32]};
        A11_temp = {A_for_now_4_1[63:56], A_for_now_4_1[63:56], A_for_now_4_1[55:48], A_for_now_4_1[55:48]};
        A12_temp = {A_for_now_4_1[79:72], A_for_now_4_1[79:72], A_for_now_4_1[71:64], A_for_now_4_1[71:64]};
        A13_temp = {A_for_now_4_1[95:88], A_for_now_4_1[95:88], A_for_now_4_1[87:80], A_for_now_4_1[87:80]};
        A14_temp = {A_for_now_4_1[111:104], A_for_now_4_1[111:104], A_for_now_4_1[103:96], A_for_now_4_1[103:96]};
        A15_temp = {A_for_now_4_1[127:120], A_for_now_4_1[127:120], A_for_now_4_1[119:112], A_for_now_4_1[119:112]};
      end
      3'd3:begin//82
        A0_temp  = i_src_A_0[31:0];
        A1_temp  = i_src_A_0[63:32];
        A2_temp  = i_src_A_0[95:64];
        A3_temp  = i_src_A_0[127:96];
        A4_temp  = i_src_A_1[31:0];
        A5_temp  = i_src_A_1[63:32];
        A6_temp  = i_src_A_1[95:64];
        A7_temp  = i_src_A_1[127:96];
        A8_temp  = i_src_A_2[31:0];
        A9_temp  = i_src_A_2[63:32];
        A10_temp = i_src_A_2[95:64];
        A11_temp = i_src_A_2[127:96];
        A12_temp = i_src_A_3[31:0];
        A13_temp = i_src_A_3[63:32];
        A14_temp = i_src_A_3[95:64];
        A15_temp = i_src_A_3[127:96];
      end
      3'd4:begin//84
        A0_temp  = {A_for_now_4_0[15:8], A_for_now_4_0[15:8], A_for_now_4_0[7:0], A_for_now_4_0[7:0]};
        A1_temp  = {A_for_now_4_0[31:24], A_for_now_4_0[31:24], A_for_now_4_0[23:16], A_for_now_4_0[23:16]};
        A2_temp  = {A_for_now_4_0[47:40], A_for_now_4_0[47:40], A_for_now_4_0[39:32], A_for_now_4_0[39:32]};
        A3_temp  = {A_for_now_4_0[63:56], A_for_now_4_0[63:56], A_for_now_4_0[55:48], A_for_now_4_0[55:48]};
        A4_temp  = {A_for_now_4_0[79:72], A_for_now_4_0[79:72], A_for_now_4_0[71:64], A_for_now_4_0[71:64]};
        A5_temp  = {A_for_now_4_0[95:88], A_for_now_4_0[95:88], A_for_now_4_0[87:80], A_for_now_4_0[87:80]};
        A6_temp  = {A_for_now_4_0[111:104], A_for_now_4_0[111:104], A_for_now_4_0[103:96], A_for_now_4_0[103:96]};
        A7_temp  = {A_for_now_4_0[127:120], A_for_now_4_0[127:120], A_for_now_4_0[119:112], A_for_now_4_0[119:112]};
        A8_temp  = {A_for_now_4_1[15:8], A_for_now_4_1[15:8], A_for_now_4_1[7:0], A_for_now_4_1[7:0]};
        A9_temp  = {A_for_now_4_1[31:24], A_for_now_4_1[31:24], A_for_now_4_1[23:16], A_for_now_4_1[23:16]};
        A10_temp = {A_for_now_4_1[47:40], A_for_now_4_1[47:40], A_for_now_4_1[39:32], A_for_now_4_1[39:32]};
        A11_temp = {A_for_now_4_1[63:56], A_for_now_4_1[63:56], A_for_now_4_1[55:48], A_for_now_4_1[55:48]};
        A12_temp = {A_for_now_4_1[79:72], A_for_now_4_1[79:72], A_for_now_4_1[71:64], A_for_now_4_1[71:64]};
        A13_temp = {A_for_now_4_1[95:88], A_for_now_4_1[95:88], A_for_now_4_1[87:80], A_for_now_4_1[87:80]};
        A14_temp = {A_for_now_4_1[111:104], A_for_now_4_1[111:104], A_for_now_4_1[103:96], A_for_now_4_1[103:96]};
        A15_temp = {A_for_now_4_1[127:120], A_for_now_4_1[127:120], A_for_now_4_1[119:112], A_for_now_4_1[119:112]};
      end
      default:begin//88
        A0_temp  = {A_for_now_8[7:0], A_for_now_8[7:0], A_for_now_8[7:0], A_for_now_8[7:0]};      
        A1_temp  = {A_for_now_8[15:8], A_for_now_8[15:8], A_for_now_8[15:8], A_for_now_8[15:8]};
        A2_temp  = {A_for_now_8[23:16], A_for_now_8[23:16], A_for_now_8[23:16], A_for_now_8[23:16]};
        A3_temp  = {A_for_now_8[31:24], A_for_now_8[31:24], A_for_now_8[31:24], A_for_now_8[31:24]};
        A4_temp  = {A_for_now_8[39:32], A_for_now_8[39:32], A_for_now_8[39:32], A_for_now_8[39:32]};
        A5_temp  = {A_for_now_8[47:40], A_for_now_8[47:40], A_for_now_8[47:40], A_for_now_8[47:40]};
        A6_temp  = {A_for_now_8[55:48], A_for_now_8[55:48], A_for_now_8[55:48], A_for_now_8[55:48]};
        A7_temp  = {A_for_now_8[63:56], A_for_now_8[63:56], A_for_now_8[63:56], A_for_now_8[63:56]};
        A8_temp  = {A_for_now_8[71:64], A_for_now_8[71:64], A_for_now_8[71:64], A_for_now_8[71:64]};
        A9_temp  = {A_for_now_8[79:72], A_for_now_8[79:72], A_for_now_8[79:72], A_for_now_8[79:72]};
        A10_temp = {A_for_now_8[87:80], A_for_now_8[87:80], A_for_now_8[87:80], A_for_now_8[87:80]};
        A11_temp = {A_for_now_8[95:88], A_for_now_8[95:88], A_for_now_8[95:88], A_for_now_8[95:88]};
        A12_temp = {A_for_now_8[103:96], A_for_now_8[103:96], A_for_now_8[103:96], A_for_now_8[103:96]};
        A13_temp = {A_for_now_8[111:104], A_for_now_8[111:104], A_for_now_8[111:104], A_for_now_8[111:104]};
        A14_temp = {A_for_now_8[119:112], A_for_now_8[119:112], A_for_now_8[119:112], A_for_now_8[119:112]};
        A15_temp = {A_for_now_8[127:120], A_for_now_8[127:120], A_for_now_8[127:120], A_for_now_8[127:120]};   
      end/*
      default:begin
        {A0_15, A0_14, A0_13, A0_12, A0_11, A0_10, A0_9, A0_8, A0_7, A0_6, A0_5, A0_4, A0_3, A0_2, A0_1, A0_0}                 = {A_for_now_8[7:0], A_for_now_8[7:0], A_for_now_8[7:0], A_for_now_8[7:0]};      
        {A1_15, A1_14, A1_13, A1_12, A1_11, A1_10, A1_9, A1_8, A1_7, A1_6, A1_5, A1_4, A1_3, A1_2, A1_1, A1_0}                 = {A_for_now_8[15:8], A_for_now_8[15:8], A_for_now_8[15:8], A_for_now_8[15:8]};
        {A2_15, A2_14, A2_13, A2_12, A2_11, A2_10, A2_9, A2_8, A2_7, A2_6, A2_5, A2_4, A2_3, A2_2, A2_1, A2_0}                 = {A_for_now_8[23:16], A_for_now_8[23:16], A_for_now_8[23:16], A_for_now_8[23:16]};
        {A3_15, A3_14, A3_13, A3_12, A3_11, A3_10, A3_9, A3_8, A3_7, A3_6, A3_5, A3_4, A3_3, A3_2, A3_1, A3_0}                 = {A_for_now_8[31:24], A_for_now_8[31:24], A_for_now_8[31:24], A_for_now_8[31:24]};
        {A4_15, A4_14, A4_13, A4_12, A4_11, A4_10, A4_9, A4_8, A4_7, A4_6, A4_5, A4_4, A4_3, A4_2, A4_1, A4_0}                 = {A_for_now_8[39:32], A_for_now_8[39:32], A_for_now_8[39:32], A_for_now_8[39:32]};
        {A5_15, A5_14, A5_13, A5_12, A5_11, A5_10, A5_9, A5_8, A5_7, A5_6, A5_5, A5_4, A5_3, A5_2, A5_1, A5_0}                 = {A_for_now_8[47:40], A_for_now_8[47:40], A_for_now_8[47:40], A_for_now_8[47:40]};
        {A6_15, A6_14, A6_13, A6_12, A6_11, A6_10, A6_9, A6_8, A6_7, A6_6, A6_5, A6_4, A6_3, A6_2, A6_1, A6_0}                 = {A_for_now_8[55:48], A_for_now_8[55:48], A_for_now_8[55:48], A_for_now_8[55:48]};
        {A7_15, A7_14, A7_13, A7_12, A7_11, A7_10, A7_9, A7_8, A7_7, A7_6, A7_5, A7_4, A7_3, A7_2, A7_1, A7_0}                 = {A_for_now_8[63:56], A_for_now_8[63:56], A_for_now_8[63:56], A_for_now_8[63:56]};
        {A8_15, A8_14, A8_13, A8_12, A8_11, A8_10, A8_9, A8_8, A8_7, A8_6, A8_5, A8_4, A8_3, A8_2, A8_1, A8_0}                 = {A_for_now_8[71:64], A_for_now_8[71:64], A_for_now_8[71:64], A_for_now_8[71:64]};
        {A9_15, A9_14, A9_13, A9_12, A9_11, A9_10, A9_9, A9_8, A9_7, A9_6, A9_5, A9_4, A9_3, A9_2, A9_1, A9_0}                 = {A_for_now_8[79:72], A_for_now_8[79:72], A_for_now_8[79:72], A_for_now_8[79:72]};
        {A10_15, A10_14, A10_13, A10_12, A10_11, A10_10, A10_9, A10_8, A10_7, A10_6, A10_5, A10_4, A10_3, A10_2, A10_1, A10_0} = {A_for_now_8[87:80], A_for_now_8[87:80], A_for_now_8[87:80], A_for_now_8[87:80]};
        {A11_15, A11_14, A11_13, A11_12, A11_11, A11_10, A11_9, A11_8, A11_7, A11_6, A11_5, A11_4, A11_3, A11_2, A11_1, A11_0} = {A_for_now_8[95:88], A_for_now_8[95:88], A_for_now_8[95:88], A_for_now_8[95:88]};
        {A12_15, A12_14, A12_13, A12_12, A12_11, A12_10, A12_9, A12_8, A12_7, A12_6, A12_5, A12_4, A12_3, A12_2, A12_1, A12_0} = {A_for_now_8[103:96], A_for_now_8[103:96], A_for_now_8[103:96], A_for_now_8[103:96]};
        {A13_15, A13_14, A13_13, A13_12, A13_11, A13_10, A13_9, A13_8, A13_7, A13_6, A13_5, A13_4, A13_3, A13_2, A13_1, A13_0} = {A_for_now_8[111:104], A_for_now_8[111:104], A_for_now_8[111:104], A_for_now_8[111:104]};
        {A14_15, A14_14, A14_13, A14_12, A14_11, A14_10, A14_9, A14_8, A14_7, A14_6, A14_5, A14_4, A14_3, A14_2, A14_1, A14_0} = {A_for_now_8[119:112], A_for_now_8[119:112], A_for_now_8[119:112], A_for_now_8[119:112]};
        {A15_15, A15_14, A15_13, A15_12, A15_11, A15_10, A15_9, A15_8, A15_7, A15_6, A15_5, A15_4, A15_3, A15_2, A15_1, A15_0} = {A_for_now_8[127:120], A_for_now_8[127:120], A_for_now_8[127:120], A_for_now_8[127:120]};   
      end*/
    endcase
  end

endmodule