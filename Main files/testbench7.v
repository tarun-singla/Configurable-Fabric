//Test Bench
module FPGA_TB_7();
  
  reg rsi, rshl, rshr, rl, clear, clock;
  reg [7:0] rin_par;
  wire wso;
  wire [7:0] wout_par;
  
  reg [32:0] tb_mem [0:13];
  
//fpga(d0, d1, d2, d3, d4, d5, d6, d7, so, i0, i1, i2, i3, i4, i5, i6, i7, si, shl, shr, l, clear, clock)  
  
  fpga fpga_inst(.o0(wout_par[0]), .o1(wout_par[1]), .o2(wout_par[2]), .o3(wout_par[3]), .o4(wout_par[4]), .o5(wout_par[5]), .o6(wout_par[6]), .o7(wout_par[7]), .o8(wso), .i0(rin_par[0]), .i1(rin_par[1]), .i2(rin_par[2]), .i3(rin_par[3]), .i4(rin_par[4]), .i5(rin_par[5]), .i6(rin_par[6]), .i7(rin_par[7]), .i8(rsi), .i9(rshl), .i10(rshr), .i11(rl), .clear(clear), .clock(clock));
    
  initial clock = 0;
  always #10 clock = ~clock;
  
  initial $readmemh("configure7.mem", tb_mem);
  
  initial
    begin
      fpga_inst.select.mem = tb_mem[0];
      
      fpga_inst.lta_0.mem = tb_mem[1];
      fpga_inst.lta_1.mem = tb_mem[1];
      fpga_inst.lta_2.mem = tb_mem[1];
      fpga_inst.lta_3.mem = tb_mem[1];
      fpga_inst.lta_4.mem = tb_mem[1];
      fpga_inst.lta_5.mem = tb_mem[1];
      fpga_inst.lta_6.mem = tb_mem[1];
      fpga_inst.lta_7.mem = tb_mem[1];
      
      fpga_inst.sb0a.configure = tb_mem[2][15:0];
      fpga_inst.sb1a.configure = tb_mem[2][15:0];
      fpga_inst.sb2a.configure = tb_mem[2][15:0];
      fpga_inst.sb3a.configure = tb_mem[2][15:0];
      fpga_inst.sb4a.configure = tb_mem[2][15:0];
      fpga_inst.sb5a.configure = tb_mem[2][15:0];
      fpga_inst.sb6a.configure = tb_mem[2][15:0];
      fpga_inst.sb7a.configure = tb_mem[2][15:0];
      
      fpga_inst.sb0b.configure = tb_mem[2][15:0];
      fpga_inst.sb1b.configure = tb_mem[2][15:0];
      fpga_inst.sb2b.configure = tb_mem[2][15:0];
      fpga_inst.sb3b.configure = tb_mem[2][15:0];
      fpga_inst.sb4b.configure = tb_mem[2][15:0];
      fpga_inst.sb5b.configure = tb_mem[2][15:0];
      fpga_inst.sb6b.configure = tb_mem[2][15:0];
      fpga_inst.sb7b.configure = tb_mem[2][15:0];
      
      fpga_inst.sb0c.configure = tb_mem[2][15:0];
      fpga_inst.sb1c.configure = tb_mem[2][15:0];
      fpga_inst.sb2c.configure = tb_mem[2][15:0];
      fpga_inst.sb3c.configure = tb_mem[2][15:0];
      fpga_inst.sb4c.configure = tb_mem[2][15:0];
      fpga_inst.sb5c.configure = tb_mem[2][15:0];
      fpga_inst.sb6c.configure = tb_mem[2][15:0];
      fpga_inst.sb7c.configure = tb_mem[2][15:0];
      
      fpga_inst.sb0d.configure = tb_mem[3][15:0];
      fpga_inst.sb1d.configure = tb_mem[3][15:0];
      fpga_inst.sb2d.configure = tb_mem[3][15:0];
      fpga_inst.sb3d.configure = tb_mem[3][15:0];
      fpga_inst.sb4d.configure = tb_mem[3][15:0];
      fpga_inst.sb5d.configure = tb_mem[3][15:0];
      fpga_inst.sb6d.configure = tb_mem[3][15:0];
      fpga_inst.sb7d.configure = tb_mem[3][15:0];
      
      fpga_inst.lt_0.mem = tb_mem[4];
      fpga_inst.lt_1.mem = tb_mem[5];
      fpga_inst.lt_2.mem = tb_mem[6];
      fpga_inst.lt_3.mem = tb_mem[7];
      fpga_inst.lt_4.mem = tb_mem[8];
      fpga_inst.lt_5.mem = tb_mem[9];
      fpga_inst.lt_6.mem = tb_mem[10];
      fpga_inst.lt_7.mem = tb_mem[11];
      
      fpga_inst.sb0e.configure = tb_mem[12][15:0];
      fpga_inst.sb5e.configure = tb_mem[12][15:0];
      fpga_inst.sb6e.configure = tb_mem[12][15:0];
      fpga_inst.sb7e.configure = tb_mem[12][15:0];
      fpga_inst.sb8e.configure = tb_mem[12][15:0];
      
      fpga_inst.sb1e.configure = tb_mem[13][15:0];
      fpga_inst.sb2e.configure = tb_mem[13][15:0];
      fpga_inst.sb3e.configure = tb_mem[13][15:0];
      fpga_inst.sb4e.configure = tb_mem[13][15:0];
      
      clear = 1'b0;
      #0
      
      clear = 1'b1;
      rin_par = 8'b10101101;
      rsi = 1'b1;
      rshl = 1'b0; rshr = 1'b0; rl = 1'b1;
      #20
      $display("%b %b", wout_par, wso);
      
      rshl = 1'b1; rshr = 1'b0; rl = 1'b0;
      #20
      $display("%b %b", wout_par, wso);
      
      rshl = 1'b1; rshr = 1'b0; rl = 1'b0;
      #20
      $display("%b %b", wout_par, wso);
      
      rshl = 1'b0; rshr = 1'b0; rl = 1'b0;
      #20
      $display("%b %b", wout_par, wso);
      
      rshl = 1'b0; rshr = 1'b1; rl = 1'b0;
      #20
      $display("%b %b", wout_par, wso);
      
      rsi = 1'b0;
      rshl = 1'b0; rshr = 1'b1; rl = 1'b0;
      #20
      $display("%b %b", wout_par, wso);
      
      rshl = 1'b0; rshr = 1'b1; rl = 1'b0;
      #20
      $display("%b %b", wout_par, wso);
      
      rin_par = 8'b11111111;
      rshl = 1'b0; rshr = 1'b0; rl = 1'b1;
      #20
      $display("%b %b", wout_par, wso);
      
      clear = 1'b0;
      #20
      $display("%b %b", wout_par, wso);
      
      #20 $finish;
    end
  
  initial
    begin
      $dumpfile("fpga.vcd");
      $dumpvars;
    end
  
endmodule

//shr  shl   l  Function
// 0    0    0  Retain
// 0    0    1  Load
// 0    1    0  Left Shift
// 1    0    0  Right Shift