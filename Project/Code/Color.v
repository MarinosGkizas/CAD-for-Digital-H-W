module color(clk,reset,flag,scancode,rgb);
input clk,reset,flag;
input [7:0] scancode;
output [8:0] rgb;

reg [2:0] red;
reg [2:0] green;
reg [2:0] blue;

reg red_i;
reg green_i;
reg blue_i;

always@(posedge clk or posedge reset) 
begin
if(reset)
begin
	red <= 3'b0;
	green <= 3'b0;
	blue <= 3'b0;
	red_i <= 1'b1;
	green_i <= 1'b1;
	blue_i <= 1'b1;
	end
	
else if (flag)
	if (scancode=='h2D)		
		if (red_i)
			begin
			red <= red+1;
				if(red==3'b110)
					red_i<=0;
			end
		else 
			begin
			red<=red-1;			
			if(red==3'b001)
					red_i<=1;
			end
		
	else if (scancode=='h34)
		if (green_i)
			begin
			green <= green+1;
				if(green==3'b110)
					green_i<=0;
			end
		else
			begin
			green<=green-1;
			if(green==3'b001)
					green_i<=1;
			end
	
	else if (scancode=='h32)
		if (blue_i)
			begin
			blue <= blue+1;
				if(blue==3'b110)
					blue_i<=0;
				end
		else 
		begin
		blue<=blue-1;
		if(blue==3'b001)
					blue_i<=1;
		end
	end


assign rgb = {red,green,blue};
endmodule

 