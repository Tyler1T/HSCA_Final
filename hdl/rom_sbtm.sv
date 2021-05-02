module rom_a0 (data, address);

   input logic [4:0] address;   
   output logic [7:0] data;

   // [7:0] indicates size of memory
   // [0:31] indicates 32 values of memory
   logic [7:0] 	      memory[0:31];

   initial
     begin
	$readmemb("./a0.dat", memory);
     end

   assign data = memory[address];

endmodule

