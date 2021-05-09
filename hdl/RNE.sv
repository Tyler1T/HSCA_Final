module RNE19(input logic[37:0] big,
            output logic [18:0] rounded);

    assign rounded[18:1] = big[37:19];
    assign rounded[0] = (big[18] & big[17]) | (big[17]&big[16]);


endmodule

module RNE18(input logic[17:0] big,
            output logic [14:0] rounded);

    assign rounded[14:1] = big[17:3];
    assign rounded[0] = (big[2] & big[1]) | (big[1] & big[0]);


endmodule

module RNE16(input logic[18:0] big,
            output logic [15:0] rounded);

    assign rounded[15:1] = big[18:3];
    assign rounded[0] = (big[2] & big[1]) | (big[1]&big[0]);

endmodule
