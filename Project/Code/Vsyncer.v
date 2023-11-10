module vsyncer (vertical,vsync);
input[8:0] vertical;
output vsync;

assign vsync=(vertical>=447);

endmodule