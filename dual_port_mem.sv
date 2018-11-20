module dual_port_mem(
		addr_a,           
		wd_a,                
		wen_a,              
		clk_a,             
		rd_a, 

		addr_b,           
		wd_b,                
		wen_b,              
		clk_b,             
		rd_b           
	);


	input [7:0] addr_a;
	input [15:0] wd_a;
	input wen_a;
	input clk_a;
	input [7:0] addr_b;
	input [15:0] wd_b;
	input wen_b;
	input clk_b;

	output [15:0] rd_a;
	output [15:0] rd_b;

	reg [15:0]  rd_1;
	reg [15:0]  rd_2;
	reg [15:0]  memory [0:255];
	reg [15:0]  wd_1;
	reg [15:0]  wd_2;
	reg [7:0]   addr_1;
	reg [7:0]   addr_2;
	reg  	    wen_1;
	reg  	    wen_2;


	always @ (posedge clk_a)
  		begin
			addr_1 <= addr_a;
			wen_1 <= wen_a;
			wd_1 <= wd_a;
  		end


	always @ (*) begin
		if (wen_1)
			begin 
				memory [addr_1] = wd_1;
			end
		end

	
	always @ (posedge clk_b)
  		begin
			addr_2 <= addr_b;
			wen_2 <= wen_b;
			wd_2 <= wd_b;
  		end


	always @ (*) begin
		if (wen_2)
			begin 
				memory [addr_2] = wd_2;
			end
		end

	assign rd_a = memory [addr_1];
	assign rd_b = memory [addr_2];


endmodule             //  dual_port_mem













