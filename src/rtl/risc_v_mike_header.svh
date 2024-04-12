`define DATA_MEM_DEPTH 512
`define INST_MEM_DEPTH 1024 // TEXT: INSTRUCTION MEMORY
`define MMIO_MEM_SIZE 64
`define BYTE_T 8
`define GPIO_ENABLED
//`define MEM_BUS_INSTRUCTIONS
`define MIKE_FF(q, i, clk)			\
	always_ff @(posedge clk) q <= i  \


		
`define MIKE_FF_RST(q,i,clk,rst)		\
	always_ff @(posedge clk)					\
		begin																\
          if (rst) q <= '0 ;										\
			else q <= i ;												\
		end																	
		
`define MIKE_FF_NRST(q,i,clk,rst)		\
	always_ff @(posedge clk)					\
		begin																\
          if (~rst) q <= '0 ;										\
			else q <= i ;												\
		end																	


		
`define MIKE_FF_INIT_NRST(q,i,init,clk,rst)		\
	always_ff @(posedge clk)					\
		begin																\
          if (~rst) q <= init ;										\
			else q <= i ;												\
		end																			


`define MIKE_FF_EN_NRST(q,i,en,clk,rst)		\
	always_ff @(posedge clk)					\
		begin																\
        	if (~rst) q <= '0 ;										\
			else if (en) q <= i ;									\
			else q <= q ;												\
		end																	


`define MIKE_FF_INIT_EN_NRST(q,i,init,en,clk,rst)		\
always_ff @(posedge clk)					\
	begin																\
		if (~rst) q <= init ;										\
		else if (en) q <= i ;									\
		else q <= q ;												\
	end										
