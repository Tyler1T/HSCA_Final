module rom_a0 (data, address);

   input logic [7:0] address;
   output logic [29:0] data;


   // [29:0] indicates size of memory
   // [0:127] indicates 128 values of memory
   logic [29:0] 	      memory[0:127];

   initial
     begin
	        $readmemb("./table.bin", memory);
     end

   assign data = memory[address];

endmodule
