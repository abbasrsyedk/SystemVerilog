class mux_driver extends uvm_driver#(mux_tx);
	`uvm_component_utils(mux_driver)
	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	virtual mux_intf vif;
	mux_tx tx;

	function void build_phase(uvm_phase phase);
		if(!(uvm_config_db#(virtual mux_intf)::get(this,"","vif",vif))) begin
			`uvm_fatal("driver","unable to get interface")
		end
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
			seq_item_port.get_next_item(tx);

        if(tx.select == 1'b00) begin
				vif.select <= tx.select;
				vif.x <= tx.a;
			end
        else if(tx.select == 1'b01) begin
				vif.select <= tx.select;
				vif.y <= tx.b;
			end
        else if(tx.select == 1'b10) begin
				vif.select <= tx.select;
				vif.z <= tx.c;
			end
        else begin
				vif.select <= tx.select;
				vif.m <= tx.d;
			end
        
			tx.print();
			seq_item_port.item_done();
		end
	endtask
endclass
