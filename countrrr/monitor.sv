//Samples the interface signals, captures into transaction packet and send the packet to scoreboard.

class monitor;
  
  //creating virtual interface handle
  virtual intf vif;
  
  //creating mailbox handle
  mailbox mon2scb;
  
  //constructor
  function new(virtual intf vif,mailbox mon2scb);
    //getting the interface
    this.vif = vif;
    //getting the mailbox handles from  environment 
    this.mon2scb = mon2scb;
  endfunction
  
  //Samples the interface signal and send the sample packet to scoreboard
  task main;
//     #5;
//     wait(vif.reset);
    wait(vif.en);
    forever begin
      transaction trans;
      trans = new();
      @(posedge vif.clk);
      trans.en   = vif.en;
      #1 trans.count_out = vif.count_out;
      #2 mon2scb.put(trans);
      trans.display("[ Monitor ]");
    end
  endtask
  
endclass