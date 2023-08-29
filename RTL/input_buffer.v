module input_buffer(
  input              i_clk,
  input              i_rst_n,
  input              i_busy_A,
  input              i_busy_W,
  input   [127:0]    i_src_A_0,
  input   [127:0]    i_src_A_1,
  input   [127:0]    i_src_A_2,
  input   [127:0]    i_src_A_3,
  input   [127:0]    i_src_W_0,
  input   [127:0]    i_src_W_1,
  input   [127:0]    i_src_W_2,
  input   [127:0]    i_src_W_3,
  output reg [127:0] o_src_A_0,
  output reg [127:0] o_src_A_1,
  output reg [127:0] o_src_A_2,
  output reg [127:0] o_src_A_3,
  output reg [127:0] o_src_W_0,
  output reg [127:0] o_src_W_1,
  output reg [127:0] o_src_W_2,
  output reg [127:0] o_src_W_3
);
  
  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      o_src_A_0     <= 128'd0;
      o_src_A_1     <= 128'd0;
      o_src_A_2     <= 128'd0;
      o_src_A_3     <= 128'd0;
    end else if(~i_busy_A)begin
      o_src_A_0     <= i_src_A_0;
      o_src_A_1     <= i_src_A_1;
      o_src_A_2     <= i_src_A_2;
      o_src_A_3     <= i_src_A_3;
    end else begin
      o_src_A_0     <= o_src_A_0;
      o_src_A_1     <= o_src_A_1;
      o_src_A_2     <= o_src_A_2;
      o_src_A_3     <= o_src_A_3;
    end
  end
  
  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      o_src_W_0 <= 128'd0;
      o_src_W_1 <= 128'd0;
      o_src_W_2 <= 128'd0;
      o_src_W_3 <= 128'd0;
    end else if(~i_busy_W)begin
      o_src_W_0 <= i_src_W_0;
      o_src_W_1 <= i_src_W_1;
      o_src_W_2 <= i_src_W_2;
      o_src_W_3 <= i_src_W_3;
    end else begin
      o_src_W_0 <= o_src_W_0;
      o_src_W_1 <= o_src_W_1;
      o_src_W_2 <= o_src_W_2;
      o_src_W_3 <= o_src_W_3;
    end
  end
  
endmodule