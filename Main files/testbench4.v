//Test Bench
module FPGA_TB_4();
  
  reg [3:0] rin;
  wire [7:0] wout;
  
  reg [32:0] tb_mem [0:13];
  
//fpga(d0, d1, d2, d3, d4, d5, d6, d7, , i0, i1, i2, , , , , , , , , , , )
  
  fpga fpga_inst(.o0(wout[0]), .o1(wout[1]), .o2(wout[2]), .o3(wout[3]), .o4(wout[4]), .o5(wout[5]), .o6(wout[6]), .o7(wout[7]), .o8(), .i0(rin[0]), .i1(rin[1]), .i2(rin[2]), .i3(1'b0), .i4(1'b0), .i5(1'b0), .i6(1'b0), .i7(1'b0), .i8(1'b0), .i9(1'b0), .i10(1'b0), .i11(1'b0), .clear(1'b0), .clock(1'b0));
  
  initial $readmemh("configure4.mem", tb_mem);
  
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
      
      rin = 3'b000;
      #20
      $display("%b", wout);
      
      rin = 3'b001;
      #20
      $display("%b", wout);
      
      rin = 3'b010;
      #20
      $display("%b", wout);
      
      rin = 3'b011;
      #20
      $display("%b", wout);
      
      rin = 3'b100;
      #20
      $display("%b", wout);
      
      rin = 3'b101;
      #20
      $display("%b", wout);
      
      rin = 3'b110;
      #20
      $display("%b", wout);
      
      rin = 3'b111;
      #20
      $display("%b", wout);
    end
  
  initial
    begin
      $dumpfile("fpga.vcd");
      $dumpvars;
    end
  
endmodule