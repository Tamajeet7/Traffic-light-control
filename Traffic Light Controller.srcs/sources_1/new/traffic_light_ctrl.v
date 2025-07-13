module traffic_light_ctrl(
    input wire [4:0] i_NS_count,
    input wire [3:0] i_EW_count,
    input wire [1:0] yellow_count,
    input wire       NS_vehicle_detect,
    input wire       EW_vehicle_detect,

    output reg       NS_red,
    output reg       NS_yellow,
    output reg       NS_green,
    output reg       EW_red,
    output reg       EW_yellow,
    output reg       EW_green 
    );

    initial begin
        
        NS_red     <= 1'b0;
        NS_yellow  <= 1'b0;
        NS_green   <= 1'b1;
        EW_red     <= 1'b1;
        EW_yellow  <= 1'b0;
        EW_green   <= 1'b0;

    end

    always @ (i_NS_count, i_EW_count, yellow_count) begin

        if (i_NS_count == 31 & EW_vehicle_detect & NS_green) begin
            NS_red     <= 1'b0;
            NS_yellow  <= 1'b1;
            NS_green   <= 1'b0;
            EW_red     <= 1'b1;
            EW_yellow  <= 1'b0;
            EW_green   <= 1'b0;
        end

        if (i_EW_count == 15 & NS_vehicle_detect & EW_green) begin
            NS_red     <= 1'b1;
            NS_yellow  <= 1'b0;
            NS_green   <= 1'b0;
            EW_red     <= 1'b0;
            EW_yellow  <= 1'b1;
            EW_green   <= 1'b0;
        end

        if (yellow_count == 3 & NS_yellow) begin
            NS_red     <= 1'b1;
            NS_yellow  <= 1'b0;
            NS_green   <= 1'b0;
            EW_red     <= 1'b0;
            EW_yellow  <= 1'b0;
            EW_green   <= 1'b1;
        end
        
        if (yellow_count == 3 & EW_yellow) begin
            NS_red     <= 1'b0;
            NS_yellow  <= 1'b0;
            NS_green   <= 1'b1;
            EW_red     <= 1'b1;
            EW_yellow  <= 1'b0;
            EW_green   <= 1'b0;
        end
    
    end

endmodule

module NS_count (
    input  wire       clk,
    output reg  [4:0] count
);

    initial count = 0;

    always @ (negedge clk)
        count[0] <= ~count[0];

    always @ (negedge count[0])
        count[1] <= ~count[1];
    
    always @ (negedge count[1])
        count[2] <= ~count[2];
    
    always @ (negedge count[2])
        count[3] <= ~count[3];
    
    always @ (negedge count[3])
        count[4] <= ~count[4];

endmodule 

module EW_count (
    input  wire       clk,
    output reg  [3:0] count
);

    initial count = 0;

    always @ (negedge clk)
        count[0] <= ~count[0];

    always @ (negedge count[0])
        count[1] <= ~count[1];
    
    always @ (negedge count[1])
        count[2] <= ~count[2];
    
    always @ (negedge count[2])
        count[3] <= ~count[3];

endmodule 

module Yellow_count (
    input  wire       clk,
    output reg  [1:0] count
);

    initial count = 0;

    always @ (negedge clk)
        count[0] <= ~count[0];

    always @ (negedge count[0])
        count[1] <= ~count[1];

endmodule 