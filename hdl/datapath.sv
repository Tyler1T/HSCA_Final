module datapath(input logic[15:0] X,
                output logic [15:0] answer);

        wire [29:0] stuff;
        rom_sbtm lookup(.address(X[15:8]),
                      .data(stuff));

        CSAM multiplier(.X(X[7:0]),
                        .Y(stuff[11:0]),
                        .Z(a1_X));

        assign raw = stuff[29:12] - a1_X;

        RNE18 rounder(.big(raw),
                        .rounded(last));


        assign answer = last;
endmodule // datapath
