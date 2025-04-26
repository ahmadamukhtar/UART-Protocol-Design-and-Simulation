`timescale 1ns / 1ps
module uart_main(
     ////////////////////////////////////////transmitter
     input logic clk_in,
     input logic  reset,
     input logic [1:0]S,
     input logic Load,
     input logic [7:0]data_board,
     output serial_out,
     /////////////////////////////////////////// receiver
     input logic serial_in,
     output logic [7:0]register
     
   );
       
transmitter_controller tc_1(clk_in,reset,S,Load,data_board,serial_out);
uart_receiver rc_1(clk_in,reset,S,serial_in,register );

endmodule
