module tb();
  reg [31:0] inp[13:0];
  initial
  begin
    $readmemh("lut_counter.mem",inp);
  end
  reg clk;
  initial clk = 0; 
  always #10 clk = ~clk;
  reg [3:0] in1,in2;
  wire [11:0] out;
  fpga inst1(.clock(clk), .in({in2,in2,in1}), .out(out));
  initial
    begin
      inst1.lt1.mem={inp[0][0],inp[1]};
      inst1.lt2.mem={inp[0][0],inp[2]};
      inst1.lt3.mem={inp[0][0],inp[3]};
      inst1.lt4.mem={inp[8][31],inp[4]};
      inst1.lt5.mem={inp[0][0],inp[5]};
      inst1.lt6.mem={inp[0][0],inp[6]};
      inst1.lt7.mem={inp[0][0],inp[7]};
      inst1.lt8.mem={inp[0][0],inp[8]};
      inst1.sb1.configure=inp[9][15:0];
      inst1.sb2.configure=inp[10][15:0];
      inst1.sb3.configure=inp[11][15:0];
      inst1.sb4.configure=inp[12][15:0];
      inst1.sb5.configure=inp[13][15:0];
      in1=4'b0000;
      in2=4'b0000;
      #20
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0001;
      in2=4'b0000;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0000;
      in2=4'b0001;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0000;
      in2=4'b0001;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0000;
      in2=4'b0001;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      in1=4'b0000;
      in2=4'b0001;
      #20
      $display ("c: %b d: %b counter: %b ",in1[0],in2[0],{out[4],out[2:0]});
      
      
      $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
   	  $dumpvars;
    end
endmodule
