`timescale 1ns / 1ps

module tb_transmitter_controller;  // Testbench module declaration

    // Inputs to the DUT (Design Under Test)
    reg clk_in;
    reg reset;
    reg [1:0] S;
    reg Load;
    reg [7:0] data_board;
 

    // Output from the DUT
    wire ser_out;

    // Instantiate the transmitter_controller module
    transmitter_controller uut (
        .clk_in(clk_in),
        .reset(reset),
        .S(S),
        .Load(Load),
        .data_board(data_board),
        .ser_out(ser_out)
  
    );

    // Generate clock signal
    initial begin
        clk_in = 0;
        forever #1 clk_in = ~clk_in;  // Clock period of 10ns (100 MHz frequency)
    end

   
    initial begin
      reset = 1;
     #6
         reset = 0;
       S = 2'b10;
         Load = 1;
     data_board = 8'b10101010;
      #200
        Load = 0;
        reset = 0;
        #50
        Load = 0;
        #100
        Load = 0;
        #500
          Load = 1;
       data_board = 8'b00111100;
          #100
         Load = 0;
    end

   
endmodule
