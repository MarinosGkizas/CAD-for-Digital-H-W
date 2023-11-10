module tops(reset,clk,stop,left,right,led);
input reset,clk,stop;
output [6:0]left;
output [6:0] right;
output [9:0] led;
wire [2:0]ts;
wire [3:0] ss,ts_out,ss_out,msec;
wire micro;

OneHertz i0(reset,clk,en_nxt);
TenHertz t1 (reset,clk,en1_nxt);
secondcounter i2(reset,clk,en_nxt,ts,ss);
singleseconds i3(reset,clk,en1_nxt,msec,micro);

stopwatch s1(clk,stop,{1'b0,ts},ts_out);
stopwatch s2(clk,stop,ss,ss_out);

bin_2_7 lt (ts_out, left);
bin_2_7 rt (ss_out, right);
leds l1(msec,led);

endmodule