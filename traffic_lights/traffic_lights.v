`timescale 1ns / 1ps



module traffic_lights(
    input clk,
    output reg blue,
    output reg green,
    output reg red
    );
 
reg [3:0] state; // traffic light state
reg [31:0] counter; // counter for timing
 
// traffic light states
parameter RED = 4'd1;
parameter BLUE = 4'd2;
parameter GREEN = 4'd3;
 
always @(posedge clk) begin
    case(state)
        RED: begin
            counter <= 100_000_000; // 10 seconds
            red <= 1;
            blue <= 0;
            green <= 0;
            state <= BLUE;
        end
        BLUE: begin
            counter <= 20_000_000; // 2 seconds
            red <= 0;
            blue <= 1;
            green <= 0;
            state <= GREEN;
        end
        GREEN: begin
            counter <= 50_000_000; // 5 seconds
            red <= 0;
            blue <= 0;
            green <= 1;
            state <= RED;
        end
    endcase
 
    // decrement counter
    if (counter > 0) begin
        counter <= counter - 1;
    end else begin
        counter <= 0;
    end
end    
endmodule
