`timescale 1ns / 1ps
module baud_rate_selector_receiver(
    input logic clk_in,
    input logic reset,
    input logic [1:0] S,
    output logic clk_out
);

    logic clk_out_0, clk_out_1, clk_out_2, clk_out_3;

    // clock_divider m_5(.clk_in(clk_in), .reset(reset), .clk_out(clk_out_0), .DIV_FACTOR(000_000_010));  //only for simulation
   clock_divider_receiver a_1(.clk_in(clk_in), .reset(reset), .clk_out(clk_out_0), .DIV_FACTOR(000_001_302));  //4800
  clock_divider_receiver a_2(.clk_in(clk_in), .reset(reset), .clk_out(clk_out_1), .DIV_FACTOR(000_000_651));  //9600
  clock_divider_receiver a_3(.clk_in(clk_in), .reset(reset), .clk_out(clk_out_2), .DIV_FACTOR(000_100_054));  //115200
  clock_divider_receiver a_4(.clk_in(clk_in), .reset(reset), .clk_out(clk_out_3), .DIV_FACTOR(100_110_000));

//    always_comb begin
//        case (S)
//            2'b00: clk_out = clk_out_0;
//            2'b01: clk_out = clk_out_1;
//            2'b10: clk_out = clk_out_2;
//            2'b11: clk_out = clk_out_3;
//            default: clk_out = clk_out_3; 
//        endcase
//    end
 always_ff @(posedge clk_in)
 begin
        case (S)
            2'b00: clk_out = clk_out_0;
            2'b01: clk_out = clk_out_1;
            2'b10: clk_out = clk_out_2;
            2'b11: clk_out = clk_out_3;
            default: clk_out = clk_out_3; 
        endcase
    end
endmodule
