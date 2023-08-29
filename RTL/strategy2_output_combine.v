module strategy2_output_combine(
  input [31:0] i_result_0_0,
  input [31:0] i_result_0_1,
  input [31:0] i_result_0_2,
  input [31:0] i_result_0_3,
  input [31:0] i_result_0_4,
  input [31:0] i_result_0_5,
  input [31:0] i_result_0_6,
  input [31:0] i_result_0_7,
  input [31:0] i_result_0_8,
  input [31:0] i_result_0_9,
  input [31:0] i_result_0_10,
  input [31:0] i_result_0_11,
  input [31:0] i_result_0_12,
  input [31:0] i_result_0_13,
  input [31:0] i_result_0_14,
  input [31:0] i_result_0_15,
  input [31:0] i_result_1_0,
  input [31:0] i_result_1_1,
  input [31:0] i_result_1_2,
  input [31:0] i_result_1_3,
  input [31:0] i_result_1_4,
  input [31:0] i_result_1_5,
  input [31:0] i_result_1_6,
  input [31:0] i_result_1_7,
  input [31:0] i_result_1_8,
  input [31:0] i_result_1_9,
  input [31:0] i_result_1_10,
  input [31:0] i_result_1_11,
  input [31:0] i_result_1_12,
  input [31:0] i_result_1_13,
  input [31:0] i_result_1_14,
  input [31:0] i_result_1_15,
  input [31:0] i_result_2_0,
  input [31:0] i_result_2_1,
  input [31:0] i_result_2_2,
  input [31:0] i_result_2_3,
  input [31:0] i_result_2_4,
  input [31:0] i_result_2_5,
  input [31:0] i_result_2_6,
  input [31:0] i_result_2_7,
  input [31:0] i_result_2_8,
  input [31:0] i_result_2_9,
  input [31:0] i_result_2_10,
  input [31:0] i_result_2_11,
  input [31:0] i_result_2_12,
  input [31:0] i_result_2_13,
  input [31:0] i_result_2_14,
  input [31:0] i_result_2_15,
  input [31:0] i_result_3_0,
  input [31:0] i_result_3_1,
  input [31:0] i_result_3_2,
  input [31:0] i_result_3_3,
  input [31:0] i_result_3_4,
  input [31:0] i_result_3_5,
  input [31:0] i_result_3_6,
  input [31:0] i_result_3_7,
  input [31:0] i_result_3_8,
  input [31:0] i_result_3_9,
  input [31:0] i_result_3_10,
  input [31:0] i_result_3_11,
  input [31:0] i_result_3_12,
  input [31:0] i_result_3_13,
  input [31:0] i_result_3_14,
  input [31:0] i_result_3_15,
  output reg [127:0] o_result_0_for_strategy2,
  output reg [127:0] o_result_1_for_strategy2,
  output reg [127:0] o_result_2_for_strategy2,
  output reg [127:0] o_result_3_for_strategy2,
  output reg [127:0] o_result_4_for_strategy2,
  output reg [127:0] o_result_5_for_strategy2,
  output reg [127:0] o_result_6_for_strategy2,
  output reg [127:0] o_result_7_for_strategy2,
  output reg [127:0] o_result_8_for_strategy2,
  output reg [127:0] o_result_9_for_strategy2,
  output reg [127:0] o_result_10_for_strategy2,
  output reg [127:0] o_result_11_for_strategy2,
  output reg [127:0] o_result_12_for_strategy2,
  output reg [127:0] o_result_13_for_strategy2,
  output reg [127:0] o_result_14_for_strategy2,
  output reg [127:0] o_result_15_for_strategy2
);


  always@(*)begin
    o_result_0_for_strategy2  = {i_result_3_0, i_result_2_0, i_result_1_0, i_result_0_0};
    o_result_1_for_strategy2  = {i_result_3_1, i_result_2_1, i_result_1_1, i_result_0_1};
    o_result_2_for_strategy2  = {i_result_3_2, i_result_2_2, i_result_1_2, i_result_0_2};
    o_result_3_for_strategy2  = {i_result_3_3, i_result_2_3, i_result_1_3, i_result_0_3};
    o_result_4_for_strategy2  = {i_result_3_4, i_result_2_4, i_result_1_4, i_result_0_4};
    o_result_5_for_strategy2  = {i_result_3_5, i_result_2_5, i_result_1_5, i_result_0_5};
    o_result_6_for_strategy2  = {i_result_3_6, i_result_2_6, i_result_1_6, i_result_0_6};
    o_result_7_for_strategy2  = {i_result_3_7, i_result_2_7, i_result_1_7, i_result_0_7};
    o_result_8_for_strategy2  = {i_result_3_8, i_result_2_8, i_result_1_8, i_result_0_8};
    o_result_9_for_strategy2  = {i_result_3_9, i_result_2_9, i_result_1_9, i_result_0_9};
    o_result_10_for_strategy2 = {i_result_3_10, i_result_2_10, i_result_1_10, i_result_0_10};
    o_result_11_for_strategy2 = {i_result_3_11, i_result_2_11, i_result_1_11, i_result_0_11};
    o_result_12_for_strategy2 = {i_result_3_12, i_result_2_12, i_result_1_12, i_result_0_12};
    o_result_13_for_strategy2 = {i_result_3_13, i_result_2_13, i_result_1_13, i_result_0_13};
    o_result_14_for_strategy2 = {i_result_3_14, i_result_2_14, i_result_1_14, i_result_0_14};
    o_result_15_for_strategy2 = {i_result_3_15, i_result_2_15, i_result_1_15, i_result_0_15};
  end


endmodule