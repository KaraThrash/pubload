
`timescale 1ns/10ps
`include "alu_unit_temporal.v"

module alu_tb;

wire[15:0] aa;
wire[15:0] bb ;
wire[15:0] runsum;
wire[15:0] sum;
wire[2:0] op;

integer k=0;
integer krand=0;
assign {aa} = krand ;
assign {bb} = 1;
assign {op} =  001;
aluIn the_circuit(aa,bb, op,sum);

   initial begin
	//bb = 1;
      $dumpfile("alu_unit_temporal.vcd");
     $dumpvars(0, alu_tb);
   // $monitor("other %b", aa);
$monitor($time,,,," :%b:",sum);
      for (k=0; k<1000; k=k+1)
          #10 krand = $urandom%10;// kb = kb +2;


   end

endmodule
