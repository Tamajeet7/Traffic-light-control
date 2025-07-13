`timescale 1ns / 1ps

module traffic_tb;
    
    //wires/reg
    wire [4:0] i_NS_count        ;
    wire [3:0] i_EW_count        ;
    wire [1:0] yellow_count      ;
    reg        CLK               ;
    
    //Input reg
    reg  NS_vehicle_detect       ;
    reg  EW_vehicle_detect       ;
    
    //Output wires
    wire NS_red                  ;
    wire NS_yellow               ;
    wire NS_green                ;
    wire EW_red                  ;
    wire EW_yellow               ;
    wire EW_green                ;
    
    //Initial Block
    initial begin
        
        CLK               = 1'b0 ;
        NS_vehicle_detect = 1'b1 ;
        EW_vehicle_detect = 1'b0 ;
        
        $display("    NS    |    EW    ");
        $display(" R  Y  G     R  Y  G ");
        $display(" %h  %h  %h     %h  %h  %h ", NS_red, NS_yellow, NS_green, EW_red, EW_yellow, EW_green);
        
        #1000 $finish;
        
    end
    
    //Clock Generator
    always #5 CLK = ~CLK         ;
    
//    //Test case 2
//    always @ (CLK) begin
//        if ($time % 26 == 0) begin
        
//            NS_vehicle_detect = ~NS_vehicle_detect;
//            EW_vehicle_detect = ~EW_vehicle_detect;
            
//        end
//    end
//    //end of test 2
    
    
    //Test case 3
    always @ (CLK) begin
        if ($time % 15 == 0)
            NS_vehicle_detect = ~NS_vehicle_detect;
            
        if ($time % 6 == 0)
            EW_vehicle_detect = ~EW_vehicle_detect;
    end
    //end of test 3
    
    
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
