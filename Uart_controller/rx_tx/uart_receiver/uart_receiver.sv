module uart_receiver(
    input logic clk_in,           
    input logic reset,            
    input logic [1:0] S,         
    output logic a=1'b0,               
    input logic serial_in,       
    output logic [7:0] register  
);

logic clk_out;                   
logic previous_serial_in;         
logic [3:0] state;                
logic valid_bit;                
logic [3:0] count;               


baud_rate_selector s_1(clk_in,reset,S,clk_out);




always_ff @(posedge clk_out) begin
    a <= ~a;
end


always_ff @(posedge clk_out) begin
    previous_serial_in <= serial_in;
    valid_bit <= previous_serial_in & ~serial_in; 
end


always_ff @(posedge clk_out or posedge reset) begin
    if (reset) begin
        state <= 4'b0000;
        count <= 4'b0000;
        register <= 8'b00000000;
    end else begin
        case (state)     
            4'b0000: begin 
                if (valid_bit) begin 
                    state <= 4'b0001;
                    count <= 4'b0111;
                end
            end
            4'b0001: begin 
                if (count == 4'b1111) begin
                    state <= 4'b0010;
                    count <= 4'b0000; 
                end else begin
                    count <= count + 1;
                end
            end
            4'b0010: begin 
                if (count == 4'b1111) begin
                    register[0] <= serial_in;
                    state <= 4'b0011; 
                    count <= 4'b0000;
                end else begin
                    count <= count + 1;
                end
            end
           
            4'b0011: begin 
                if (count == 4'b1111) begin
                    register[1] <= serial_in; 
                    state <= 4'b0100; 
                    count <= 4'b0000;
                end else begin
                    count <= count + 1;
                end
            end
            4'b0100: begin 
                if (count == 4'b1111) begin
                    register[2] <= serial_in;
                    state <= 4'b0101; 
                    count <= 4'b0000;
                end else begin
                    count <= count + 1;
                end
            end
            4'b0101: begin
                if (count == 4'b1111) begin
                    register[3] <= serial_in;
                    state <= 4'b0110; 
                    count <= 4'b0000;
                end else begin
                    count <= count + 1;
                end
            end
            4'b0110: begin 
                if (count == 4'b1111) begin
                    register[4] <= serial_in; 
                    state <= 4'b0111; 
                    count <= 4'b0000;
                end else begin
                    count <= count + 1;
                end
            end
            4'b0111: begin 
                if (count == 4'b1111) begin
                    register[5] <= serial_in; 
                    state <= 4'b1000; 
                    count <= 4'b0000;
                end else begin
                    count <= count + 1;
                end
            end
            4'b1000: begin 
                if (count == 4'b1111) begin
                    register[6] <= serial_in; 
                    state <= 4'b1001; 
                    count <= 4'b0000;
                end else begin
                    count <= count + 1;
                end
            end
            4'b1001: begin 
                if (count == 4'b1111) begin
                    register[7] <= serial_in; 
                    state <= 4'b1010; 
                    count <= 4'b0000;
                end else begin
                    count <= count + 1;
                end
            end
            4'b1010: begin 
                if (count == 4'b1111) begin
                    if (serial_in == 1'b1) begin 
                        state <= 4'b0000; 
                    end
                    count <= 4'b0000; 
                end else begin
                    count <= count + 1;
                end
            end
            default: begin
                state <= 4'b0000; 
            end
        endcase
    end
end

endmodule
