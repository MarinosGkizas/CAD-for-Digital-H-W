module character(clk25,scancode,reset,char,active);
input clk25,reset;
input [7:0]scancode;
output [1:0] char;
output active;
reg [1:0] char;
reg active;


always@(posedge clk25 or posedge reset)
if(reset)
begin
	char <= 2'b00; active <= 0;
	end
	else if (scancode=='h16)
	begin
	char <= 0;
	active <= 1;
	end
	else if (scancode=='h1e)
	begin
	char <= 1;
	active <= 1;
	end
	else if (scancode=='h26)
	begin
	char <= 2;
	active <= 1;
	end
	else if (scancode=='h25)
	begin
	char <= 3;
	active <= 1;
	end
	
endmodule