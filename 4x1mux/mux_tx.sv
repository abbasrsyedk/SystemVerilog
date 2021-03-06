class mux_tx extends uvm_sequence_item;
	rand bit a;
	rand bit b;
    rand bit c;
    rand bit d;
    rand bit [0:1]select;

	`uvm_object_utils_begin(mux_tx)
		`uvm_field_int(a,UVM_ALL_ON)
		`uvm_field_int(b,UVM_ALL_ON)
        `uvm_field_int(c,UVM_ALL_ON)
        `uvm_field_int(d,UVM_ALL_ON)
		`uvm_field_int(select,UVM_ALL_ON)
	`uvm_object_utils_end

	function new(string name ="");
		super.new(name);
	endfunction
endclass
