module pixel(clk25,reset,horizontal,vertical);
input clk25,reset;
output [8:0] vertical;
output [9:0] horizontal;

reg [8:0] vertical;
reg [9:0] horizontal;

always@(posedge clk25 or posedge reset)
if(reset)
begin
	vertical <= 9'b000000000;
	horizontal <= 10'b0000000000;
	end
else 
begin
	if (horizontal=='d799)
		begin
			horizontal <= 10'b0000000000;
			
			if(vertical == 'd448)
				vertical <= 0;
			else
			vertical <= vertical+1;
			
		end
	else horizontal<=horizontal+1;
	
end
endmodule
