module complex_circuits
#
(
    parameter DATA_WIDTH = 8,
    parameter ADDRESS_WIDTH = 4
)
(
    input clk,
    input reset_n,
    input mem_en0,mem_en1,
    input cs0,cs1,
    input [ADDRESS_WIDTH-1 : 0]addr0,addr1,
    input [ADDRESS_WIDTH-1 : 0]opcode_in,
    input [DATA_WIDTH-1 : 0]a_in,b_in,
    output reg [DATA_WIDTH-1 : 0]result_out,
    output reg carry_out    
);
    reg [ADDRESS_WIDTH - 1:0]opcode_temp;
    wire [DATA_WIDTH - 1:0]data_out0;
    wire [DATA_WIDTH - 1:0]data_out1;
    wire [DATA_WIDTH - 1:0]data_out_temp;
    wire carry;
   
    memory_8x16 m1(.clk(clk),.cs(cs0),.mem_en(mem_en0),
                   .addr(addr0),.data_in(a_in),.data_out(data_out0));
    memory_8x16 m2(.clk(clk),.cs(cs1),.mem_en(mem_en1),
                   .addr(addr1),.data_in(b_in),.data_out(data_out1));
   
    always @ (posedge clk, negedge reset_n)
    begin
        if(reset_n) begin
            opcode_temp <= 'b0;
        end
        else begin
            opcode_temp <= opcode_in;
        end
    end
   
    ALU a1(.a_in(data_out0),.b_in(data_out1),
           .opcode(opcode_temp),.result_out(data_out_temp),.carry(carry));
   
    always @ (posedge clk, negedge reset_n)
    begin
        if(~reset_n) begin
            {carry_out, result_out} <= 'b0;
        end
        else begin
            {carry_out, result_out} <= {carry,data_out_temp};
        end
    end      
endmodule
