module PE_ctrl(
  input i_clk,
  input i_rst_n,
  input i_new_tile,
  input [20:0] i_ins,
  output o_strategy_1_en,
  output o_strategy_2_en,
  output reg [3:0] o_A_signed,
  output reg [3:0] o_W_signed,
  output reg [2:0] o_A_arrange,
  output reg [1:0] o_A_arrange_index,
  output reg [1:0] o_W_arrange,
  output reg [1:0] o_W_arrange_index,
  output reg [63:0] o_shift,
  output     [15:0] o_W_en,
  output reg o_valid_P,
  output reg [9:0] o_addr_A,
  output reg [9:0] o_addr_W,
  output reg [9:0] o_addr_P,
  output reg o_valid_P_from_last_tile,
  output reg [9:0] o_addr_P_from_last_tile,
  output reg o_accumulation,
  output reg o_busy_cube,
  output reg o_done,
  output reg o_busy_activation,
  output reg o_busy_weight
);
  
  parameter SET        = 3'd0,
            SET_WEIGHT = 3'd1,
            GET        = 3'd2,
            EX         = 3'd3,
            NEW        = 3'd4,
            DONE       = 3'd5;  
  
  
  
  reg [3:0] shift [0:15];
  reg [1:0] counter_for_get_activation;
  reg [1:0] counter_for_get_weight;
  reg [9:0] counter_for_activation_column;
  reg [1:0] A_bits_reg;
  reg [1:0] W_bits_reg;
  reg strategy_reg;
  reg A_signed_reg;
  reg W_signed_reg;
  reg [2:0] state, n_state;

///////////////////////////////decoder///////////////////////////////
  wire [1:0] weight_bit        = i_ins[1:0];
  wire       weight_signed     = i_ins[2];
  wire [1:0] activation_bit    = i_ins[4:3];
  wire       activation_signed = i_ins[5];
  wire       strategy          = i_ins[6];
  wire [9:0] num_column        = i_ins[16:7];
  wire [2:0] num_row           = i_ins[19:17];
  wire       accumulation      = i_ins[20];
////////////////////////////////////////////////////////////////////

  wire o_A_signed_0 = (A_bits_reg==2'd0) ? A_signed_reg : 1'b0;
  
  wire o_A_signed_1 = (A_bits_reg==2'd2) ? 1'b0: A_signed_reg;
  
  wire o_A_signed_2 = (A_bits_reg==2'd0) ? A_signed_reg : 1'b0;
  
  wire o_A_signed_3 = A_signed_reg;

  wire o_W_signed_0 = (W_bits_reg==2'd0) ? W_signed_reg : 1'b0;
  
  wire o_W_signed_1 = (W_bits_reg==2'd2) ? 1'b0: W_signed_reg;
  
  wire o_W_signed_2 = (W_bits_reg==2'd0) ? W_signed_reg : 1'b0;
  
  wire o_W_signed_3 = W_signed_reg;

  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      state <= SET;
    end else begin
      state <= n_state;
    end
  end

  reg [9:0] VALID_RANGE_START;
  reg [9:0] VALID_RANGE_END;
  reg [9:0] TIME_TO_STOP;
  reg [2:0] num_NEW_to_stop;

  reg [9:0] COLUMN;

  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      A_bits_reg <= 2'b0;
      W_bits_reg <= 2'b0;
      COLUMN <= 10'd0;
      VALID_RANGE_START <= 8'd0;
      VALID_RANGE_END   <= 8'd0;
      TIME_TO_STOP <= 8'd0;
      num_NEW_to_stop <= 3'd1;
      o_accumulation <= 1'b0;
    end else if(i_new_tile)begin
      A_bits_reg <= activation_bit;
      W_bits_reg <= weight_bit;
      COLUMN <= num_column;
      VALID_RANGE_START <= (strategy) ? 10'd4 : 8'd6;
      VALID_RANGE_END   <= (strategy) ? num_column + 10'd3 : num_column + 10'd5;
      TIME_TO_STOP <= (strategy) ? num_column + 10'd4 : num_column + 10'd6;
      num_NEW_to_stop <= num_row;
      o_accumulation <= accumulation;
    end else begin
      A_bits_reg <= A_bits_reg;
      W_bits_reg <= W_bits_reg;
      COLUMN <= COLUMN;
      VALID_RANGE_START <= VALID_RANGE_START;
      VALID_RANGE_END   <= VALID_RANGE_END;
      TIME_TO_STOP <= TIME_TO_STOP;
      num_NEW_to_stop <= num_NEW_to_stop;
      o_accumulation <= o_accumulation;
    end
  end

  assign o_strategy_1_en = !strategy_reg;
  assign o_strategy_2_en =  strategy_reg;

  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      strategy_reg <= 1'b0;
    end else if(i_new_tile)begin
      strategy_reg <= strategy;
    end else begin
      strategy_reg <= strategy_reg;
    end
  end

  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      A_signed_reg <= 1'b0;
      W_signed_reg <= 1'b0;
    end else if(i_new_tile)begin
      A_signed_reg <= activation_signed;
      W_signed_reg <= weight_signed;
    end else begin
      A_signed_reg <= A_signed_reg;
      W_signed_reg <= W_signed_reg;
    end
  end
  
  reg W_en0;
  reg W_en1;
  reg W_en2;
  reg W_en3;
  reg W_en4;
  reg W_en5;
  reg W_en6;
  reg W_en7;
  reg W_en8;
  reg W_en9;
  reg W_en10;
  reg W_en11;
  reg W_en12;
  reg W_en13;
  reg W_en14;
  reg W_en15;
  
  assign o_W_en = {W_en15, W_en14, W_en13, W_en12, W_en11, W_en10, W_en9, W_en8, W_en7, W_en6, W_en5, W_en4, W_en3, W_en2, W_en1, W_en0};

  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      W_en0  <= 1'b0;
      W_en1  <= 1'b0;
      W_en2  <= 1'b0;
      W_en3  <= 1'b0;
      W_en4  <= 1'b0;
      W_en5  <= 1'b0;
      W_en6  <= 1'b0;
      W_en7  <= 1'b0;
      W_en8  <= 1'b0;
      W_en9  <= 1'b0;
      W_en10 <= 1'b0;
      W_en11 <= 1'b0;
      W_en12 <= 1'b0;
      W_en13 <= 1'b0;
      W_en14 <= 1'b0;
      W_en15 <= 1'b0;
    end else begin
      W_en0  <= (state==SET_WEIGHT && counter_for_activation_column==10'd1);
      W_en1  <= (state==SET_WEIGHT && counter_for_activation_column==10'd2);
      W_en2  <= (state==SET_WEIGHT && counter_for_activation_column==10'd3);
      W_en3  <= (state==SET_WEIGHT && counter_for_activation_column==10'd4);
      W_en4  <= (state==SET_WEIGHT && counter_for_activation_column==10'd5);
      W_en5  <= (state==SET_WEIGHT && counter_for_activation_column==10'd6);
      W_en6  <= (state==SET_WEIGHT && counter_for_activation_column==10'd7);
      W_en7  <= (state==SET_WEIGHT && counter_for_activation_column==10'd8);
      W_en8  <= (state==SET_WEIGHT && counter_for_activation_column==10'd9);
      W_en9  <= (state==SET_WEIGHT && counter_for_activation_column==10'd10);
      W_en10 <= (state==SET_WEIGHT && counter_for_activation_column==10'd11);
      W_en11 <= (state==SET_WEIGHT && counter_for_activation_column==10'd12);
      W_en12 <= (state==SET_WEIGHT && counter_for_activation_column==10'd13);
      W_en13 <= (state==SET_WEIGHT && counter_for_activation_column==10'd14);
      W_en14 <= (state==SET_WEIGHT && counter_for_activation_column==10'd15);
      W_en15 <= (state==SET_WEIGHT && counter_for_activation_column==10'd16);
    end
  end

  reg valid_P_temp;// for tile accumulation
  reg [9:0] addr_P_temp;// for tile accumulation

  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      o_valid_P               <= 1'b0;
    end else begin
      o_valid_P               <= (state>SET_WEIGHT&&counter_for_activation_column<=VALID_RANGE_END&&counter_for_activation_column>=VALID_RANGE_START);
    end
  end
  
  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      o_addr_P               <= 10'b0;
    end else if(o_valid_P)begin
      o_addr_P               <= o_addr_P  + 10'd1;
    end
  end

  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      o_valid_P_from_last_tile <= 1'b0;
    end else begin
      o_valid_P_from_last_tile <= (state>SET_WEIGHT&&counter_for_activation_column<=VALID_RANGE_END-2&&counter_for_activation_column>=VALID_RANGE_START-2);
    end
  end
  
  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      o_addr_P_from_last_tile <= 10'b0;
    end else if(o_valid_P_from_last_tile)begin
      o_addr_P_from_last_tile <= o_addr_P_from_last_tile  + 10'd1;
    end
  end

  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      o_addr_W <= 10'b0;
    end else if(!o_busy_weight)begin
      o_addr_W <= o_addr_W  + 10'd1;
    end
  end

  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      o_addr_A <= 10'b0;
    end else if(state==NEW)begin
      o_addr_A <= 10'd0;
    end else if(!o_busy_activation)begin
      o_addr_A <= o_addr_A  + 10'd1;
    end
  end

  wire [1:0] counter_dst_activation = (W_bits_reg==2'd2) ? 2'd3 :
                                      (W_bits_reg==2'd1) ? 2'd1 :
                                      2'd0;
  
  wire [1:0] counter_dst_weight = (A_bits_reg==2'd2) ? 2'd3 :
                                  (A_bits_reg==2'd1) ? 2'd1 :
                                  2'd0;
  
  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      counter_for_activation_column <= 10'd0;
    end else if(state==SET || state==SET_WEIGHT && n_state==GET || state==NEW)begin
      counter_for_activation_column <= 10'd0;
    end else begin
      counter_for_activation_column <= counter_for_activation_column + 10'd1;
    end
  end

  always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
      counter_for_get_activation <= 2'd0;
    end else if(n_state<=GET)begin
      counter_for_get_activation <= 2'd0;
    end else begin
      counter_for_get_activation <= counter_for_get_activation + 2'd1;
    end
  end

  always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
      counter_for_get_weight <= 2'd0;
    end else if(counter_for_get_weight==counter_dst_weight || state==NEW)begin
      counter_for_get_weight <= 2'd0;
    end else begin
      counter_for_get_weight <= counter_for_get_weight + 2'd1;
    end
  end

  always@(posedge i_clk or negedge i_rst_n) begin
    if (~i_rst_n) begin
      o_A_arrange_index <= 2'd0;
    end else begin
      o_A_arrange_index <= counter_for_get_activation;
    end
  end

  always@(posedge i_clk or negedge i_rst_n)begin
    if (~i_rst_n) begin
      o_W_arrange_index <= 2'd0;
    end else begin
      o_W_arrange_index <= counter_for_get_weight;
    end
  end
  
  reg [2:0] have_gone_NEW;
  always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
      have_gone_NEW <= 3'd0;
    end else if(state==NEW)begin
      have_gone_NEW <= have_gone_NEW + 3'd1;
    end
  end

  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      o_busy_cube <= 1'b0;
    end else if(counter_for_activation_column==TIME_TO_STOP && have_gone_NEW==num_NEW_to_stop)begin
      o_busy_cube <= 1'b0;
    end else if(state==SET && n_state==SET_WEIGHT)begin
      o_busy_cube <= 1'd1;
    end
  end

  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      o_busy_activation <= 1'b1;
    end else if(n_state==GET && (counter_for_activation_column<COLUMN-1 || state==SET_WEIGHT))begin
      o_busy_activation <= 1'b0;
    end else begin
      o_busy_activation <= 1'd1;
    end
  end

  always@(posedge i_clk or negedge i_rst_n)begin
    if(~i_rst_n)begin
      o_busy_weight <= 1'b1;
    end else if(counter_for_get_weight==counter_dst_weight && n_state==SET_WEIGHT && counter_for_activation_column<10'd15 || state==NEW)begin
      o_busy_weight <= 1'b0;
    end else begin
      o_busy_weight <= 1'd1;
    end
  end

  always@(*)begin
    o_A_signed = {o_A_signed_3, o_A_signed_2, o_A_signed_1, o_A_signed_0};
    o_W_signed = {o_W_signed_3, o_W_signed_2, o_W_signed_1, o_W_signed_0};
    o_shift    = {shift[15], shift[14], shift[13], shift[12], shift[11], shift[10], shift[9], shift[8], shift[7], shift[6], shift[5], shift[4], shift[3], shift[2], shift[1], shift[0]};
  end

  always@(*)begin
    case({A_bits_reg, W_bits_reg})
      4'b00_00:begin
        o_A_arrange = 3'd0;
      end
      4'b01_00:begin
        o_A_arrange = 3'd1;
      end
      4'b01_01:begin
        o_A_arrange = 3'd2;
      end
      4'b10_00:begin
        o_A_arrange = 3'd3;
      end
      4'b10_01:begin
        o_A_arrange = 3'd4;
      end
      default:begin
        o_A_arrange = 3'd5;
      end
    endcase
  end

  always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
      o_done <= 1'b0;
    end else if(state==DONE)begin
      o_done <= 1'b1;
    end else begin
      o_done <= 1'b0;
    end
  end

  always@(*)begin
    case(state)
      SET:       n_state = (i_new_tile) ? SET_WEIGHT : SET;
      SET_WEIGHT:n_state = (counter_for_activation_column==8'd16) ? GET : SET_WEIGHT;
      GET:       n_state = (counter_for_activation_column==VALID_RANGE_END+10'd1 && have_gone_NEW==num_NEW_to_stop) ? DONE :
                           (counter_for_activation_column==VALID_RANGE_END+10'd1) ? NEW :
                           (W_bits_reg==2'd0) ? GET :
                           EX;
      EX:        n_state = (counter_for_activation_column==VALID_RANGE_END+10'd1 && have_gone_NEW==num_NEW_to_stop) ? DONE :
                           (counter_for_activation_column==VALID_RANGE_END+10'd1) ? NEW :
                           (counter_for_get_activation==counter_dst_activation) ? GET :
                           EX;
      NEW:       n_state = SET_WEIGHT;
      DONE:      n_state = GET;
      default:   n_state = GET;
    endcase
  end

  always@(*)begin
    case({A_bits_reg, W_bits_reg})
      4'b00_00:begin
        o_W_arrange = 2'd0;
      end
      4'b01_00:begin
        o_W_arrange = 2'd1;
      end
      4'b01_01:begin
        o_W_arrange = 2'd2;
      end
      default:begin
        o_W_arrange = 2'd3;
      end
    endcase
  end

  always@(*)begin
    case({A_bits_reg, W_bits_reg})
      4'b00_00:begin //2 bits * 2 bits
        shift[ 0] = 4'd0;
        shift[ 1] = 4'd0;
        shift[ 2] = 4'd0;
        shift[ 3] = 4'd0;
        shift[ 4] = 4'd0;
        shift[ 5] = 4'd0;
        shift[ 6] = 4'd0;
        shift[ 7] = 4'd0;
        shift[ 8] = 4'd0;
        shift[ 9] = 4'd0;
        shift[10] = 4'd0;
        shift[11] = 4'd0;
        shift[12] = 4'd0;
        shift[13] = 4'd0;
        shift[14] = 4'd0;
        shift[15] = 4'd0;
      end
      4'b01_00:begin //4 bits * 2 bits
        shift[ 0] = 4'd0;
        shift[ 1] = 4'd2;
        shift[ 2] = 4'd0;
        shift[ 3] = 4'd2;
        shift[ 4] = 4'd0;
        shift[ 5] = 4'd2;
        shift[ 6] = 4'd0;
        shift[ 7] = 4'd2;
        shift[ 8] = 4'd0;
        shift[ 9] = 4'd2;
        shift[10] = 4'd0;
        shift[11] = 4'd2;
        shift[12] = 4'd0;
        shift[13] = 4'd2;
        shift[14] = 4'd0;
        shift[15] = 4'd2;
      end
      4'b01_01:begin //4 bits * 4 bits
        shift[ 0] = 4'd0;
        shift[ 1] = 4'd2;
        shift[ 2] = 4'd0;
        shift[ 3] = 4'd2;
        shift[ 4] = 4'd2;
        shift[ 5] = 4'd4;
        shift[ 6] = 4'd2;
        shift[ 7] = 4'd4;
        shift[ 8] = 4'd0;
        shift[ 9] = 4'd2;
        shift[10] = 4'd0;
        shift[11] = 4'd2;
        shift[12] = 4'd2;
        shift[13] = 4'd4;
        shift[14] = 4'd2;
        shift[15] = 4'd4;
      end
      4'b10_00:begin //8 bits * 2 bits
        shift[ 0] = 4'd0;
        shift[ 1] = 4'd2;
        shift[ 2] = 4'd4;
        shift[ 3] = 4'd6;
        shift[ 4] = 4'd0;
        shift[ 5] = 4'd2;
        shift[ 6] = 4'd4;
        shift[ 7] = 4'd6;
        shift[ 8] = 4'd0;
        shift[ 9] = 4'd2;
        shift[10] = 4'd4;
        shift[11] = 4'd6;
        shift[12] = 4'd0;
        shift[13] = 4'd2;
        shift[14] = 4'd4;
        shift[15] = 4'd6;
      end
      4'b10_01:begin //8 bits * 4 bits
        shift[ 0] = 4'd0;
        shift[ 1] = 4'd2;
        shift[ 2] = 4'd4;
        shift[ 3] = 4'd6;
        shift[ 4] = 4'd2;
        shift[ 5] = 4'd4;
        shift[ 6] = 4'd6;
        shift[ 7] = 4'd8;
        shift[ 8] = 4'd0;
        shift[ 9] = 4'd2;
        shift[10] = 4'd4;
        shift[11] = 4'd6;
        shift[12] = 4'd2;
        shift[13] = 4'd4;
        shift[14] = 4'd6;
        shift[15] = 4'd8;
      end
      default:begin //8 bits * 8 bits
        shift[ 0] = 4'd0;
        shift[ 1] = 4'd2;
        shift[ 2] = 4'd4;
        shift[ 3] = 4'd6;
        shift[ 4] = 4'd2;
        shift[ 5] = 4'd4;
        shift[ 6] = 4'd6;
        shift[ 7] = 4'd8;
        shift[ 8] = 4'd4;
        shift[ 9] = 4'd6;
        shift[10] = 4'd8;
        shift[11] = 4'd10;
        shift[12] = 4'd6;
        shift[13] = 4'd8;
        shift[14] = 4'd10;
        shift[15] = 4'd12;
      end
    endcase
  end

endmodule