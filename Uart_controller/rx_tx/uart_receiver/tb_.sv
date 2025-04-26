module tb_uart_receiver;


    logic clk_in;
    logic reset;

 
    logic serial_in;
    logic [1:0] S; 
    logic [7:0] register;
    logic a;

   
    uart_receiver uut (
        .clk_in(clk_in),
        .reset(reset),
        .S(S),
        .a(a),
        .serial_in(serial_in),
        .register(register)
    );


    initial begin
        clk_in = 0;
        forever #5 clk_in = ~clk_in;  
    end


    initial begin
  
        reset = 1;
        serial_in = 1; 
        S = 2'b01;  
        
      
        #100;
        

        reset = 0;
        
    
        #100;

     
        send_uart_byte(8'b01010000); 
        
      
        #100000;  
        
       
    end

    
    task send_uart_byte(input [7:0] data);
        integer i;
        begin
         #10000

            serial_in = 0;
           // #104167;  
            #100000;
       
            for (i = 0; i < 8; i = i + 1) begin
                serial_in = data[i];
              //  #104167; 
              #110000;
            end
            
        
            serial_in = 1;
         //  #104167; 
         #900000;
        end
    endtask

endmodule
