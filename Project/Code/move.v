module move(clk,reset,flag,scancode,posx,posy);
input clk,reset,flag;
input [7:0] scancode;
output [9:0] posx;
output [8:0] posy;
reg [9:0] posx;
reg [8:0] posy;

always@(posedge clk or posedge reset) 
begin
if(reset)
begin
	posx<='d364;
	posy<='d227;
	end
	
else if (flag)
if (scancode=='h72)
	begin
		posy<=posy+1;
		if(posy>='d418)
			posy<='d227;
	end
	else if (scancode=='h75)
	begin
		posy<=posy-1;
		if(posy<='d35)
			posy<='d227;
	end
	
	else if (scancode=='h6b)
	begin
		posx<=posx-1;
		if(posx<='d48)
			posx<='d364;
	end
	else if (scancode=='h74)
	begin
		posx<=posx+1;
		if(posx>='d639)
			posx<='d364;
	end
		
	end



endmodule

 