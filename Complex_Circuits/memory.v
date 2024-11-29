module memory_8x16
#
(
    parameter ADDRESS_WIDTH = 4,
    parameter DATA_WIDTH = 8
)
(
    input clk,
    input mem_en,
    input cs,
    input [ADDRESS_WIDTH - 1:0]addr,
    input [DATA_WIDTH - 1:0]data_in,
    output [DATA_WIDTH - 1:0]data_out
);
    reg [DATA_WIDTH - 1:0]temp;
    reg [DATA_WIDTH - 1:0]memory[0:15];
    always @ (posedge clk)
    begin
        if(cs && mem_en) begin
            memory[ADDRESS_WIDTH] <= data_in;
        end
    end
   
    always @ (posedge clk)
    begin
        if(cs && !mem_en) begin
            temp <= memory[ADDRESS_WIDTH];
        end
    end
   
    assign data_out = (cs && !mem_en) ? temp : 'b0;
endmodul
