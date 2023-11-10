module cnt128(reset,clk,enable,clkdiv128);
input reset,clk,enable;
output clkdiv128;
reg[6:0]cnt;

assign clkdiv128= (cnt==7'd127);
always@(posedge reset or posedge clk)
if (reset) cnt <= 0;
   else if (enable) cnt<= cnt+1; 
endmodule

module cnt5(reset,clk,enable,clkdiv5);
input reset,clk,enable;
output clkdiv5;
reg[2:0]cnt;

assign clkdiv5= (cnt==3'd4);
always@(posedge reset or posedge clk)
if (reset) cnt <= 0;
   else if (enable) cnt <= cnt + 1;
endmodule
  

module TenHertz(reset,clk,en_nxt);
input clk, reset;
output en_nxt;
wire clk10Hz;
wire first, second, third, fourth;

cnt5 c0 (reset,clk,1'b1,first);
cnt128 c1 (reset,clk,first,second);
cnt25 c2 (reset,clk,first & second, third);
cnt25 c3 (reset,clk,first & second & third, fourth);
cnt25 c4 (reset,clk,first & second & third & fourth,clk10Hz);

assign en_nxt=first & second & third & fourth & clk10Hz;
endmodule
