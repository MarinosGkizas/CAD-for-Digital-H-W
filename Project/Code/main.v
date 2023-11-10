module main(
    input clk_in,
    input reset,
	 input ps2clk,
	 input ps2data,
    output hsync,
    output vsync,
    output [8:0] rgb_out
    );
	 
wire [1:0]chr;
wire chr_a;
wire [8:0]rgb_in;
wire [7:0]datain;
wire [5:0]addr;
wire [7:0]scancode;
wire [9:0]posx;
wire [8:0]posy;


OneHertz oh(reset, clk_in, blink_clk);
blinker bl(clk,scancode,flag,reset,blink_clk,blink);
move mv(clk,reset,flag,scancode,posx,posy);
Keyboard_Controller kc(clk,ps2clk,ps2data,reset,scancode,flag);
character c1(clk,scancode,reset,chr,chr_a);
color clr(clk,reset,flag,scancode,rgb_in);
pixel_clk pxc(clk_in,reset,clk);
displaycontroller dc(clk,reset,chr,chr_a,rgb_in,datain,blink,posx,posy,hsync,vsync,rgb_out,addr);
char_rom chro(addr,datain);




endmodule
