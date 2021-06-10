class scoreboard;
   
  //creating mailbox handle
  mailbox mon2scb;
  
  //used to count the number of transactions
  int no_transactions;
  
  //array to use as local memory
  bit [3:0] mem;
  
  //constructor
  function new(mailbox mon2scb);
    //getting the mailbox handles from  environment 
    this.mon2scb = mon2scb;
	mem = 4'b0;
  endfunction
  
  //Compares the Actual result with the expected result
  task main;
    transaction trans;
    forever begin
      mon2scb.get(trans);
      
      if(trans.en)
        mem = mem + 1;   
      
      if(mem != trans.count_out)
        $error("[SCB-FAIL] En = %0h,\n \t   Data :: Expected = %0h Actual = %0h",trans.en, mem, trans.count_out);
      else 
        $display("[SCB-PASS] En = %0h,\n \t   Data :: Expected = %0h Actual = %0h", trans.en, mem, trans.count_out);
      
        no_transactions++;
    end
  endtask
  
endclass