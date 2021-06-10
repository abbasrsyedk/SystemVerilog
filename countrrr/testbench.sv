//tbench_top or testbench top, this is the top most file, in which DUT(Design Under Test) and Verification environment are connected. 
//-------------------------------------------------------------------------

//including interface and testcase files
`include "interface.sv"
`include "random_test.sv"

module tbench_top;
  
  //clock and reset signal declaration
  bit clk;
  bit reset;
  
  //clock generation
  always #5 clk = ~clk;
  
  //reset Generation
  initial begin
    reset = 1;
    #5 reset =0;
  end
  
  
  //creatinng instance of interface, inorder to connect DUT and testcase
  intf i_intf(clk,reset);
  
  //Testcase instance, interface handle is passed to test as an argument
  test t1(i_intf);
  
  //DUT instance, interface signals are connected to the DUT ports
  counter DUT (
    .clk(i_intf.clk),
    .reset(i_intf.reset),
    .en(i_intf.en),
    .count_out(i_intf.count_out)
   );
  
  //enabling the wave dump
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule