module ALU_unit_1 #(parameter n = 16)(
    input [n-1:0] a_in, b_in,
    input [3:0] opcode,
    input clk, reset_n,
    input start, // New input signal to start the operation
    output reg [n-1:0] y_out,
    output reg c_out,
    output reg zflag, sflag, cflag, pflag
);
    reg [n-1:0] result; // Intermediate result
    reg op_done; // Operation done flag

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            result <= 0;
            c_out <= 0;
            zflag <= 0;
            sflag <= 0;
            cflag <= 0;
            pflag <= 0;
            op_done <= 0;
        end else if (start && !op_done) begin
            case (opcode)
                4'b0000: {c_out, result} <= a_in + b_in; // ADD
                4'b0001: {c_out, result} <= a_in - b_in; // SUB
                4'b0010: {c_out, result} <= {1'b0, a_in + 1}; // INC
                4'b0011: {c_out, result} <= {1'b0, a_in - 1}; // DEC
                4'b0100: {c_out, result} <= {1'b0, a_in[n-1:1]}; // Shift Right
                4'b0101: {c_out, result} <= {1'b0, a_in[n-2:0], 1'b0}; // Shift Left
                4'b0110: {c_out, result} <= a_in | b_in; // OR
                4'b0111: {c_out, result} <= a_in ^ b_in; // XOR
                4'b1000: {c_out, result} <= a_in & b_in; // AND
                4'b1001: {c_out, result} <= ~a_in; // NOT
                default: {c_out, result} <= 0;
            endcase
            op_done <= 1; // Mark operation as done
        end else if (op_done) begin
            // Update flags after operation is done
            sflag <= result[n-1]; // Sign flag
            cflag <= c_out; // Carry flag
            pflag <= ^result; // Parity flag
            zflag <= (result == 0) ? 1 : 0; // Zero flag

            // Pass result to output only when operation is done
            y_out <= result;
        end
    end

    always @(posedge clk) begin
        if (op_done && !start) begin
            op_done <= 0; // Reset operation done flag when start is low
        end
    end
endmodule
