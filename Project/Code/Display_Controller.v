module displaycontroller(clk,reset,chr,chr_a,rgb_in,datain,blink,posx,posy,hsync,vsync,rgb_out,addr);
input clk,reset,chr_a,blink;
input[1:0] chr;
input[8:0] rgb_in;
input[7:0] datain;
input [9:0]posx;
input [8:0]posy;
output[5:0] addr;
output hsync,vsync;
output[8:0] rgb_out;

wire[9:0] hor;
wire[8:0] ver;

wire pxon,onchar;

pixel px(clk,reset,hor,ver);
hsyncer hs(hor,hsync);
vsyncer vs(ver,vsync);

assign addr = {chr,(ver[3:0]-posy[3:0])};
assign pxon = datain[7-(hor[2:0]-posx[2:0])] & chr_a;
assign rgb_out = (onchar & pxon &blink)?rgb_in:0;
assign onchar = (ver>=posy && ver<posy+16) && (hor>=posx && hor<posx+8);


endmodule