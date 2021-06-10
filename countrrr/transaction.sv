class transaction;
  
//declaring the transaction items
  rand bit en;
  bit [3:0] count_out;
  
  function void display(string name);
    $display("-------------------------");
    $display("- %s ",name);
    $display("-------------------------");
    $display("- en = %0d", en);
    $display("- count = %0d", count_out);
    $display("-------------------------");
  endfunction
endclass