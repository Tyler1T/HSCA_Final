//
// File name : tb
// Title     : test
// project   : HW3
// Library   : test
// Purpose   : definition of modules for testbench 
// notes :   
//
// Copyright Oklahoma State University
//

// Top level stimulus module

`timescale 1ns/1ps
module stimulus;

   logic [4:0] address;   
   logic [7:0] data;   

   logic 	 clk;   

   integer 	 handle3;
   integer 	 desc3;
   integer 	 i;   
   
   // instatiate part to test
   rom_a0 dut (data, address);

   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end
   
   initial
     begin
	handle3 = $fopen("tbl.out");
	desc3 = handle3;	
	#250 $finish;		
     end
   
   initial
     begin
	for (i=0; i < 64; i=i+1)
	  begin
	     // Put vectors before beginning of clk
	     @(posedge clk)
	       begin
		  address = $random;
	       end
	     @(negedge clk)
	       begin
		  $fdisplay(desc3, "%h || %h", address, data);
		  
	       end
	  end // @(negedge clk)
     end // for (j=0; j < 32; j=j+1)
   
endmodule // stimulus
