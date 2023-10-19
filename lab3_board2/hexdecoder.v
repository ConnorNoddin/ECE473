 // file hexdecoder.v
module hexdecoder ( in, out );
 input wire [3:0] in;
 output reg [6:0] out;
 always @* begin
 if (in == 4'h0) begin
 out = ~7'b0111111;
 end
  if (in == 4'h1) begin
 out = ~7'b0000110;
 end
  if (in == 4'h2) begin
 out = ~7'b1011011;
 end
  if (in == 4'h3) begin
 out = ~7'b1001111;
 end
  if (in == 4'h4) begin
 out = ~7'b1100110;
 end
  if (in == 4'h5) begin
 out = ~7'b1101101;
 end
  if (in == 4'h6) begin
 out = ~7'b1111101;
 end
  if (in == 4'h7) begin
 out = ~7'b0000111;
 end
  if (in == 4'h8) begin
 out = ~7'b1111111;
 end
  if (in == 4'h9) begin
 out = ~7'b1100111;
 end
 if (in == 4'ha) begin
 out = ~7'b1110111;
 end
 if (in == 4'hb) begin
 out = ~7'b1111100;
 end
 if (in == 4'hc) begin
 out = ~7'b0111001;
 end
 if (in == 4'hd) begin
 out = ~7'b1011110;
 end
 if (in == 4'he) begin
 out = ~7'b1111001;
 end
 if (in == 4'hf) begin
 out = ~7'b1110001;
 end
 end
endmodule