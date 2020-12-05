module logic_tile(out, clock, in1, in2, in3, in4, in5);
  input clock,in1,in2,in3,in4,in5;
  output out;
  reg inter1;
  reg [32:0] mem;
  reg out;
  always @(mem[31:0],in1,in2,in3,in4,in5) 
	begin
    	case ({in5,in4,in3,in2,in1})
          5'b00000 : inter1=mem[0];
          5'b00001 : inter1=mem[1];
          5'b00010 : inter1=mem[2];
          5'b00011 : inter1=mem[3];
          5'b00100 : inter1=mem[4];
          5'b00101 : inter1=mem[5];
          5'b00110 : inter1=mem[6];
          5'b00111 : inter1=mem[7];
          5'b01000 : inter1=mem[8];
          5'b01001 : inter1=mem[9];
          5'b01010 : inter1=mem[10];
          5'b01011 : inter1=mem[11];
          5'b01100 : inter1=mem[12];
          5'b01101 : inter1=mem[13];
          5'b01110 : inter1=mem[14];
          5'b01111 : inter1=mem[15];
          5'b10000 : inter1=mem[16];
          5'b10001 : inter1=mem[17];
          5'b10010 : inter1=mem[18];
          5'b10011 : inter1=mem[19];
          5'b10100 : inter1=mem[20];
          5'b10101 : inter1=mem[21];
          5'b10110 : inter1=mem[22];
          5'b10111 : inter1=mem[23];
          5'b11000 : inter1=mem[24];
          5'b11001 : inter1=mem[25];
          5'b11010 : inter1=mem[26];
          5'b11011 : inter1=mem[27];
          5'b11100 : inter1=mem[28];
          5'b11101 : inter1=mem[29];
          5'b11110 : inter1=mem[30];
          5'b11111 : inter1=mem[31];
      default : inter1=1'b0;
    endcase
  end
  reg q,qbar;
  always @(posedge clock)
    begin
      q<=inter1;
      qbar<=!inter1;
    end
  always @(q,inter1,mem[32])
    begin
      case (mem[32])
        1'b0 : out=inter1;
        1'b1 : out=q;
        default : out=1'bx;
      endcase
    end
endmodule

module switch_box_4x4(out, in);
  input [3:0] in;
  output [3:0] out;
  wire inter1;
  reg [15:0] configure;
  
    assign out[0]=(configure[0] & in[0]) | (configure[1] & in[1])|		 (configure[2] & in[2]) | (configure[3] & in[3]);
    assign out[1]=(configure[4] & in[0]) | (configure[5] & in[1]) |      (configure[6] & in[2]) | (configure[7] & in[3]);
    assign out[2]=(configure[8] & in[0]) | (configure[9] & in[1]) |       (configure[10] & in[2]) | (configure[11]&in[3]);
    assign out[3]=(configure[12] & in[0]) | (configure[13] & in[1])       | (configure[14] & in[2]) | (configure[15]&in[3]);
endmodule


module fpga(clock , out , in);
  input [11:0] in;
  output [11:0] out;
  input clock;
  wire [3:0] sb1_out,sb2_out,sb3_out,sb4_out,sb5_out;
  logic_tile lt1(out[0], clock, sb1_out[0], sb2_out[0], sb3_out[0], sb4_out[0], sb5_out[0]);
  logic_tile lt2(out[1], clock, sb1_out[1], sb2_out[1], sb3_out[1], sb4_out[1], sb5_out[1]);
  logic_tile lt3(out[2], clock, sb1_out[2], sb2_out[2], sb3_out[2], sb4_out[2], sb5_out[2]);
  logic_tile lt4(out[3], clock, sb1_out[3], sb2_out[3], sb3_out[3], sb4_out[3], sb5_out[3]);
  logic_tile lt5(out[4], clock, sb1_out[0], sb2_out[0], sb3_out[0], sb4_out[0], sb5_out[0]);
  logic_tile lt6(out[5], clock, sb1_out[1], sb2_out[1], sb3_out[1], sb4_out[1], sb5_out[1]);
  logic_tile lt7(out[6], clock, sb1_out[2], sb2_out[2], sb3_out[2], sb4_out[2], sb5_out[2]);
  logic_tile lt8(out[7], clock, sb1_out[3], sb2_out[3], sb3_out[3], sb4_out[3], sb5_out[3]);
  switch_box_4x4 sb1(sb1_out,in[3:0]);
  switch_box_4x4 sb2(sb2_out,in[7:4]);
  switch_box_4x4 sb3(sb3_out,{out[2:0],in[8]});
  switch_box_4x4 sb4(sb4_out,out[3:0]);
  switch_box_4x4 sb5(sb5_out,out[7:4]);
endmodule

  