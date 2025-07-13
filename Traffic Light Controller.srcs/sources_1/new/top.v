`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2025 12:52:49
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    //Inputs
    input  i_CLK               ,
    input  NS_vehicle_detect   ,
    input  EW_vehicle_detect   ,
    
    //Outputs
    output NS_red              ,
    output NS_yellow           ,
    output NS_green            ,
    output EW_red              ,
    output EW_yellow           ,
    output EW_green
    );
    
    //Internal reg
    reg [27:0] counter;
    wire        CLK   ;
    
    //Clock Divider
    always @ (posedge i_CLK)
        counter = counter + 1;
    
    assign CLK = counter[26];
    
    //Instantiations
    
    //Traffic Light Controller
    traffic_light_ctrl CORE (
        //inputs
        .i_NS_count          (i_NS_count       ),       
        .i_EW_count          (i_EW_count       ),       
        .yellow_count        (yellow_count     ),     
        .NS_vehicle_detect   (NS_vehicle_detect),
        .EW_vehicle_detect   (EW_vehicle_detect),
        
        //outputs
        .NS_red              (NS_red           ),           
        .NS_yellow           (NS_yellow        ),        
        .NS_green            (NS_green         ),         
        .EW_red              (EW_red           ),           
        .EW_yellow           (EW_yellow        ),        
        .EW_green            (EW_green         ) 
        );
        
    //NS Counter
    NS_count i_NS_count_0 (
        .clk   (CLK),                 
        .count (i_NS_count) 
        );
    
    //EW Counter    
    EW_count i_EW_count_0 (
        .clk   (CLK),                 
        .count (i_EW_count) 
        );
    
    //Yellow Counter
    
    Yellow_count i_Yellow_count_0 (
        .clk   (CLK),                 
        .count (yellow_count) 
        );  
        
endmodule
