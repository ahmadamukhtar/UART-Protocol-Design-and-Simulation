`timescale 1ns / 1ps
module clock_divider_receiver(
  input logic clk_in,        
    input logic reset,        
    output logic clk_out=1'b1,     
    input logic [31:0]DIV_FACTOR
    );
    logic [31:0] counter;
    always_ff @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter <= 32'b0;
            clk_out <= 1'b0;
        end else begin
            if (counter == (DIV_FACTOR/2) - 1) begin
                clk_out <= ~clk_out;
                counter <= 32'b0;
            end else begin
                counter <= counter + 1;
            end
        end
    end

endmodule

