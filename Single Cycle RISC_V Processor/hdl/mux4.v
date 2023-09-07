//4x1_mux
module mux4 #(parameter WIDTH = 32)
             (input   [WIDTH-1:0] d0, d1, d2,d3,
              input   [1:0] s, 
              output  [WIDTH-1:0] y);
wire [WIDTH-1:0] y1,y2;

mux2  m1 (d0, d1, s[0], y1);
mux2  m2 (d2, d3, s[0], y2);
mux2  m3 (y1, y2, s[1], y);

endmodule 