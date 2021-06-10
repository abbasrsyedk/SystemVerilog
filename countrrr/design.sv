module counter(
  input 	   clk	,
  input 	   reset,
  input en,
  output reg [3:0] count_out
); 
  
  
  //Reset 
  always @(posedge reset) 
    count_out <= 0;
   
  // Waddition operation
  always @(posedge clk) 
    if (en)    count_out <= count_out+1;

endmodule