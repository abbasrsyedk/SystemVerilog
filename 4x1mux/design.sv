// Code your design here
// Code your design here
module mux(out,sel,a,b,c,d);
input a,b,c,d;
input [1:0]sel;
output reg out;

always@(*) begin
    if(sel == 1'b00)
		out = a;
    else if(sel == 1'b01) 
		out = b;
    else if(sel == 1'b10)
        out = c;
    else
        out = d;   
end
endmodule
