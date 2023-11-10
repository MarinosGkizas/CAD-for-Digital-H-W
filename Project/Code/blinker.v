module blinker(clk,scancode,flag,reset,hzclk,blink);
input clk,reset,hzclk,flag;
input [7:0]scancode;
output blink;

reg blinkact;





always@(posedge clk or posedge reset)
if(reset)

	blinkact<=0;

else if (flag && scancode=='h2b)	
	blinkact<=~blinkact;
	
assign blink = blinkact?hzclk:1;

	
	
endmodule