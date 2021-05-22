//Logic Tile
module logic_tile(out, clock, reset, in1, in2, in3, in4, in5);
  input in1, in2, in3, in4, in5, clock, reset;
  output out;
  
  wire in1_b, in2_b, in3_b, in4_b, in5_b, out_b;
  assign in1_b = (~in1);
  assign in2_b = (~in2);
  assign in3_b = (~in3);
  assign in4_b = (~in4);
  assign in5_b = (~in5);
  
  reg [32:0] mem;
  wire [31:0] temp;
  
  assign temp[0] = in5_b & in4_b & in3_b & in2_b & in1_b & mem[0];
  assign temp[1] = in5_b & in4_b & in3_b & in2_b & in1 & mem[1];
  assign temp[2] = in5_b & in4_b & in3_b & in2 & in1_b & mem[2];
  assign temp[3] = in5_b & in4_b & in3_b & in2 & in1 & mem[3];
  assign temp[4] = in5_b & in4_b & in3 & in2_b & in1_b & mem[4];
  assign temp[5] = in5_b & in4_b & in3 & in2_b & in1 & mem[5];
  assign temp[6] = in5_b & in4_b & in3 & in2 & in1_b & mem[6];
  assign temp[7] = in5_b & in4_b & in3 & in2 & in1 & mem[7];
  assign temp[8] = in5_b & in4 & in3_b & in2_b & in1_b & mem[8];
  assign temp[9] = in5_b & in4 & in3_b & in2_b & in1 & mem[9];
  assign temp[10] = in5_b & in4 & in3_b & in2 & in1_b & mem[10];
  assign temp[11] = in5_b & in4 & in3_b & in2 & in1 & mem[11];
  assign temp[12] = in5_b & in4 & in3 & in2_b & in1_b & mem[12];
  assign temp[13] = in5_b & in4 & in3 & in2_b & in1 & mem[13];
  assign temp[14] = in5_b & in4 & in3 & in2 & in1_b & mem[14];
  assign temp[15] = in5_b & in4 & in3 & in2 & in1 & mem[15];
  assign temp[16] = in5 & in4_b & in3_b & in2_b & in1_b & mem[16];
  assign temp[17] = in5 & in4_b & in3_b & in2_b & in1 & mem[17];
  assign temp[18] = in5 & in4_b & in3_b & in2 & in1_b & mem[18];
  assign temp[19] = in5 & in4_b & in3_b & in2 & in1 & mem[19];
  assign temp[20] = in5 & in4_b & in3 & in2_b & in1_b & mem[20];
  assign temp[21] = in5 & in4_b & in3 & in2_b & in1 & mem[21];
  assign temp[22] = in5 & in4_b & in3 & in2 & in1_b & mem[22];
  assign temp[23] = in5 & in4_b & in3 & in2 & in1 & mem[23];
  assign temp[24] = in5 & in4 & in3_b & in2_b & in1_b & mem[24];
  assign temp[25] = in5 & in4 & in3_b & in2_b & in1 & mem[25];
  assign temp[26] = in5 & in4 & in3_b & in2 & in1_b & mem[26];
  assign temp[27] = in5 & in4 & in3_b & in2 & in1 & mem[27];
  assign temp[28] = in5 & in4 & in3 & in2_b & in1_b & mem[28];
  assign temp[29] = in5 & in4 & in3 & in2_b & in1 & mem[29];
  assign temp[30] = in5 & in4 & in3 & in2 & in1_b & mem[30];
  assign temp[31] = in5 & in4 & in3 & in2 & in1 & mem[31];
  
  assign out_b = temp[0] | temp[1] | temp[2] | temp[3] | temp[4] | temp[5] | temp[6] | temp[7] | temp[8] | temp[9] | temp[10] | temp[11] | temp[12] | temp[13] | temp[14] | temp[15] | temp[16] | temp[17] | temp[18] | temp[19] | temp[20] | temp[21] | temp[22] | temp[23] | temp[24] | temp[25] | temp[26] | temp[27] | temp[28] | temp[29] | temp[30] | temp[31];
    
  reg q;
  
  always@(posedge clock or negedge reset)
    begin
      if(~reset)
        q = 1'b0;
      else
        q = out_b;
	end
  
  assign out = (mem[32] & q) | ((~mem[32]) & out_b);

endmodule

//Switch Box
module switch_box_4x4(out, in);
  input [3:0] in;
  output [3:0] out;
  
  reg [15:0] configure;
  
  assign out[0] = configure[0] & in[0] | configure[1] & in[1] | configure[2] & in[2] | configure[3] & in[3];
  assign out[1] = configure[4] & in[0] | configure[5] & in[1] | configure[6] & in[2] | configure[7] & in[3];
  assign out[2] = configure[8] & in[0] | configure[9] & in[1] | configure[10] & in[2] | configure[11] & in[3];
  assign out[3] = configure[12] & in[0] | configure[13] & in[1] | configure[14] & in[2] | configure[15] & in[3];
  
endmodule

//FPGA
module fpga(o0, o1, o2, o3, o4, o5, o6, o7, o8, i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, clear, clock);
  input i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, clear, clock;
  output o0, o1, o2, o3, o4, o5, o6, o7, o8;
  
  wire s, x, y, z;
  wire [7:0] w, out, a, b, c, d, e;
  
  logic_tile select(s, clock, clear, i9, i10, 0, 0, 0);
  
  logic_tile lta_0(w[0], clock, clear, o1, 0, i10, i9, 0);
  switch_box_4x4 sb0a({x, y, z, a[0]}, {1'b0, i0, w[0], i0});
  switch_box_4x4 sb0b({x, y, z, b[0]}, {1'b0, i4, i0, i1});
  switch_box_4x4 sb0c({x, y, z, c[0]}, {1'b0, i8, out[0], i2});
  switch_box_4x4 sb0d({x, y, e[0], d[0]}, {1'b0, 1'b0, i11, s});
  logic_tile lt_0(out[0], clock, clear, a[0], b[0], c[0], d[0], e[0]);
  switch_box_4x4 sb0e({x, y, z, o0}, {1'b0, 1'b0, 1'b0, out[0]});
  
  logic_tile lta_1(w[1], clock, clear, o2, o0, i10, i9, 0);
  switch_box_4x4 sb1a({x, y, z, a[1]}, {1'b0, i0, w[1], i0});
  switch_box_4x4 sb1b({x, y, z, b[1]}, {1'b0, i4, i1, i1});
  switch_box_4x4 sb1c({x, y, z, c[1]}, {1'b0, i8, out[1], i2});
  switch_box_4x4 sb1d({x, y, e[1], d[1]}, {1'b0, 1'b0, i11, s});
  logic_tile lt_1(out[1], clock, clear, a[1], b[1], c[1], d[1], e[1]);
  switch_box_4x4 sb1e({x, y, z, o1}, {1'b0, 1'b0, out[2], out[1]});
  
  logic_tile lta_2(w[2], clock, clear, o3, o1, i10, i9, 0);
  switch_box_4x4 sb2a({x, y, z, a[2]}, {1'b0, i1, w[2], i0});
  switch_box_4x4 sb2b({x, y, z, b[2]}, {1'b0, i5, i2, i1});
  switch_box_4x4 sb2c({x, y, z, c[2]}, {1'b0, out[1], out[2], i2});
  switch_box_4x4 sb2d({x, y, e[2], d[2]}, {1'b0, 1'b0, i11, s});
  logic_tile lt_2(out[2], clock, clear, a[2], b[2], c[2], d[2], e[2]);
  switch_box_4x4 sb2e({x, y, z, o2}, {1'b0, 1'b0, out[4], out[2]});
  
  logic_tile lta_3(w[3], clock, clear, o4, o2, i10, i9, 0);
  switch_box_4x4 sb3a({x, y, z, a[3]}, {1'b0, i1, w[3], i0});
  switch_box_4x4 sb3b({x, y, z, b[3]}, {1'b0, i5, i3, i1});
  switch_box_4x4 sb3c({x, y, z, c[3]}, {1'b0, out[1], out[3], i2});
  switch_box_4x4 sb3d({x, y, e[3], d[3]}, {1'b0, 1'b0, i11, s});
  logic_tile lt_3(out[3], clock, clear, a[3], b[3], c[3], d[3], e[3]);
  switch_box_4x4 sb3e({x, y, z, o3}, {1'b0, 1'b0, out[6], out[3]});
  
  logic_tile lta_4(w[4], clock, clear, o5, o3, i10, i9, 0);
  switch_box_4x4 sb4a({x, y, z, a[4]}, {1'b0, i2, w[4], i0});
  switch_box_4x4 sb4b({x, y, z, b[4]}, {1'b0, i6, i4, i1});
  switch_box_4x4 sb4c({x, y, z, c[4]}, {1'b0, out[3], out[4], i2});
  switch_box_4x4 sb4d({x, y, e[4], d[4]}, {1'b0, 1'b0, i11, s});
  logic_tile lt_4(out[4], clock, clear, a[4], b[4], c[4], d[4], e[4]);
  switch_box_4x4 sb4e({x, y, z, o4}, {1'b0, 1'b0, out[7], out[4]});
  
  logic_tile lta_5(w[5], clock, clear, o6, o4, i10, i9, 0);
  switch_box_4x4 sb5a({x, y, z, a[5]}, {1'b0, i2, w[5], i0});
  switch_box_4x4 sb5b({x, y, z, b[5]}, {1'b0, i6, i5, i1});
  switch_box_4x4 sb5c({x, y, z, c[5]}, {1'b0, out[3], out[5], i2});
  switch_box_4x4 sb5d({x, y, e[5], d[5]}, {1'b0, 1'b0, i11, s});
  logic_tile lt_5(out[5], clock, clear, a[5], b[5], c[5], d[5], e[5]);
  switch_box_4x4 sb5e({x, y, z, o5}, {1'b0, 1'b0, 1'b0, out[5]});
  
  logic_tile lta_6(w[6], clock, clear, o7, o5, i10, i9, 0);
  switch_box_4x4 sb6a({x, y, z, a[6]}, {1'b0, i3, w[6], i0});
  switch_box_4x4 sb6b({x, y, z, b[6]}, {1'b0, i7, i6, i1});
  switch_box_4x4 sb6c({x, y, z, c[6]}, {1'b0, out[5], out[6], i2});
  switch_box_4x4 sb6d({x, y, e[6], d[6]}, {1'b0, 1'b0, i11, s});
  logic_tile lt_6(out[6], clock, clear, a[6], b[6], c[6], d[6], e[6]);
  switch_box_4x4 sb6e({x, y, z, o6}, {1'b0, 1'b0, 1'b0, out[6]});
 
  logic_tile lta_7(w[7], clock, clear, i8, o6, i10, i9, 0);
  switch_box_4x4 sb7a({x, y, z, a[7]}, {1'b0, i3, w[7], i0});
  switch_box_4x4 sb7b({x, y, z, b[7]}, {1'b0, i7, i7, i1});
  switch_box_4x4 sb7c({x, y, z, c[7]}, {1'b0, out[5], out[7], i2});
  switch_box_4x4 sb7d({x, y, e[7], d[7]}, {1'b0, 1'b0, i11, s});
  logic_tile lt_7(out[7], clock, clear, a[7], b[7], c[7], d[7], e[7]);
  switch_box_4x4 sb7e({x, y, z, o7}, {1'b0, 1'b0, 1'b0, out[7]});
  
  switch_box_4x4 sb8e({x, y, z, o8}, {1'b0, 1'b0, 1'b0, out[0]});
  
endmodule