`include "dual_port_mem.sv"
module testbench ();
	reg [7:0] address_1;
	reg [7:0] address_2;		
	reg [15:0] wdata_1;
	reg [15:0] wdata_2;
	reg wenable_1;
	reg wenable_2;
	reg clock_1;
	reg clock_2;

	wire [15:0] rdata_1;
	wire [15:0] rdata_2;

	dual_port_mem memD(
		.addr_a(address_1),
		.wd_a(wdata_1),
		.wen_a(wenable_1),
		.clk_a(clock_1),
		.rd_a(rdata_1),

		.addr_b(address_2),
		.wd_b(wdata_2),
		.wen_b(wenable_2),
		.clk_b(clock_2),
		.rd_b(rdata_2)
		  );

	initial
		begin
			clock_1 <=0;
			clock_2 <=0;
			wenable_1 <=0;
			wenable_2 <=0;
		end
	initial 
		begin
		#20 begin
	  	wenable_1 <= 1;
	  	wdata_1 <= 16'h10;
 		address_1 <= 8'h11;
		end 
		#20 begin
	  	wenable_2 <= 1;
	  	wdata_2 <= 16'h19;
 		address_2 <= 8'h20;
		end 
		#15 begin
		wenable_1 <= 0;
		wdata_1 <= 16'h12;
		end
		#15 begin
		wenable_2 <= 0;
		wdata_2 <= 16'h21;
		end
   		#20 begin
		wenable_1 <= 1;
		wdata_1 <= 16'h13;
		address_1 <= 8'h14;
		end
		#20 begin
		wenable_2 <= 1;
		wdata_2 <= 16'h22;
		address_2 <= 8'h23;
		end
		#20 begin
		wenable_1 <= 0;
		wdata_1 <= 16'h15;
		end
		#20 begin
		wenable_2 <= 0;
		wdata_2 <= 16'h24;
		end
		#30 begin
		wenable_1 <= 1;
		wdata_1 <= 16'h16;
		address_1 <= 8'h17;
		end
		#30 begin
		wenable_1 <= 1;
		wdata_1 <= 16'h25;
		address_1 <= 8'h26;
		end
		#25 begin
		wenable_1 <= 0;
		wdata_1 <= 16'h18;
		end
		#25 begin
		wenable_1 <= 0;
		wdata_1 <= 16'h27;
		end


		$finish;
		end // initial begin

		
	initial 
		begin
			forever #6 clock_1 <= ~clock_1;
		end

	initial 
		begin
			forever #4 clock_2 <= ~clock_2;
		end

endmodule
