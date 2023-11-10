module pixel_clk(clk,reset,clk25);
input clk, reset;
output clk25;
reg [1:0] counter4;
assign clk25=&counter4;
always@(posedge clk or posedge reset)
begin
    if (reset) counter4<=2'd0;
    else 
    begin
        if (counter4==2'd3) counter4<=2'd0;   
        else        counter4<=counter4+1;
    end
end
endmodule