module stopwatch(clk,stop,real_time,out_time);
input clk,stop;
input [3:0] real_time; // pragmatikos xronos
output [3:0] out_time; //xronos sthn e3odo
reg[3:0] out_time;
reg[3:0] now_time; // xronos twrinos

always@(posedge clk)
begin
if(stop==0)
	begin
	now_time=real_time;// apo8hkeuse thn twrinh timh ths eisodou ston kataxwrhth
	out_time=real_time; //e3odos= pragmatikos xronos
	end	
	else if (stop==1)
	out_time=now_time;// h timh tou kataxwrhth pernaei sthn e3odo
end 
endmodule