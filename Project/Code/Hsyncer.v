module hsyncer (horizontal,hsync);
input[9:0] horizontal;
output hsync;

assign hsync=(horizontal<'d704);

endmodule
