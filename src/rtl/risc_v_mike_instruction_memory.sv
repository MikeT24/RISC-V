import risc_v_mike_pkg::*;

`include "risc_v_mike_header.svh"

module risc_v_mike_instruction_memory #(
    parameter DATA_MEM_WIDTH = 32,
    parameter DATA_MEM_DEPTH = 1024
)(
    input logic clk,
    input logic rst,
    input t_pc_addr data_mem_addr,     
    output logic [DATA_32_W - 1:0] data_mem_rd_data
);

t_pc_addr direct_addressing;
logic error_addr;

logic [DATA_MEM_DEPTH - 1:0][DATA_32_W - 1:0] data_mem;
logic [DATA_MEM_DEPTH - 1:0][DATA_32_W - 1:0] data_mem_ff;

assign direct_addressing = data_mem_addr >> 2;
assign error_addr = |(data_mem_addr % 4);

// genvar depth;
// generate
//     for (depth = 0; depth < DATA_MEM_DEPTH; depth++) begin: g_instr_mem
//         // Write to data_mem if reg_write is asserted
//         // Write just to the enabled address
//         // Actual flip flop
//         // assign data_mem[depth] = (rst)? 'h0 : data_mem_ff[depth];
//        // `MIKE_FF_RST(data_mem_ff[depth], data_mem[depth], clk, rst)
//     end
// endgenerate


// //Data read assignments
 

// assign data_mem_ff = [0] = 32'b00000000000100000100000100010011;
// assign data_mem_ff = [1] = 32'b00000000000100000100000100010011;
// assign data_mem_ff = [2] = 32'b00000000000100000100000100010011;
// assign data_mem_ff = [3] = 32'b00000000000100000100000100010011;



assign data_mem_rd_data = data_mem_ff[direct_addressing];



// 0fc10417
// 00440493
// 00f00093
// 00800113
// 002081b3
// 0014a023
// 0004ae83
// 001e8663
// 00000013
// 00000013
// 0ff08f93


assign data_mem_ff[0]   = 32'h0fc10417;
assign data_mem_ff[1]   = 32'h00440493;
assign data_mem_ff[2]   = 32'h00500293;
assign data_mem_ff[3]   = 32'h008000ef;
assign data_mem_ff[4]   = 32'h0140006f;
assign data_mem_ff[5]   = 32'h00130313;
assign data_mem_ff[6]   = 32'hfe531ee3;
assign data_mem_ff[7]   = 32'h0ff00f93;
assign data_mem_ff[8]   = 32'h000080e7;
assign data_mem_ff[9]   = 32'h0;
assign data_mem_ff[10]  = 32'h0;
assign data_mem_ff[11]  = 32'h0;
assign data_mem_ff[12]  = 32'h0;
assign data_mem_ff[13]  = 32'h0;
assign data_mem_ff[14]  = 32'h0;
assign data_mem_ff[15]  = 32'h0;
assign data_mem_ff[16]  = 32'h0;
assign data_mem_ff[17]  = 32'h0;
assign data_mem_ff[18]  = 32'h0;
assign data_mem_ff[19]  = 32'h0;
assign data_mem_ff[20]  = 32'h0;
assign data_mem_ff[21]  = 32'h0;
assign data_mem_ff[22]  = 32'h0;
assign data_mem_ff[23]  = 32'h0;
assign data_mem_ff[24]  = 32'h0;
assign data_mem_ff[25]  = 32'h0;
assign data_mem_ff[26]  = 32'h0;
assign data_mem_ff[27]  = 32'h0;
assign data_mem_ff[28]  = 32'h0;
assign data_mem_ff[29]  = 32'h0;
assign data_mem_ff[30]  = 32'h0;
assign data_mem_ff[31]  = 32'h0;
assign data_mem_ff[32]  = 32'h0;
assign data_mem_ff[33]  = 32'h0;
assign data_mem_ff[34]  = 32'h0;
assign data_mem_ff[35]  = 32'h0;
assign data_mem_ff[36]  = 32'h0;
assign data_mem_ff[37]  = 32'h0;
assign data_mem_ff[38]  = 32'h0;
assign data_mem_ff[39]  = 32'h0;
assign data_mem_ff[40]  = 32'h0;
assign data_mem_ff[41]  = 32'h0;
assign data_mem_ff[42]  = 32'h0;
assign data_mem_ff[43]  = 32'h0;

// assign data_mem_ff[0]  = 32'h0;
// assign data_mem_ff[1]  = 32'h0;
// assign data_mem_ff[2]     = 32'h00100093;
// assign data_mem_ff[3]     = 32'h04800113;
// assign data_mem_ff[4]     = 32'h06f00193;
// assign data_mem_ff[5]     = 32'h06c00213;
// assign data_mem_ff[6]     = 32'h06100293;
// assign data_mem_ff[7]     = 32'h02000313;
// assign data_mem_ff[8]     = 32'h04d00393;
// assign data_mem_ff[9]     = 32'h07500413;
// assign data_mem_ff[10]    = 32'h06e00493;
// assign data_mem_ff[11]    = 32'h06400513;
// assign data_mem_ff[12]    = 32'h06f00593;
// assign data_mem_ff[13]    = 32'h00200a93;
// assign data_mem_ff[14]    = 32'h00c00b13;
// assign data_mem_ff[15]    = 32'h00202123;
// assign data_mem_ff[16]    = 32'h003021a3;
// assign data_mem_ff[17]    = 32'h00402223;
// assign data_mem_ff[18]    = 32'h005022a3;
// assign data_mem_ff[19]    = 32'h00602323;
// assign data_mem_ff[20]    = 32'h007023a3;
// assign data_mem_ff[21]    = 32'h00802423;
// assign data_mem_ff[22]    = 32'h009024a3;
// assign data_mem_ff[23]    = 32'h00a02523;
// assign data_mem_ff[24]    = 32'h00b02523;
// assign data_mem_ff[25]    = 32'h00900813;
// assign data_mem_ff[26]    = 32'h03c00613;
// assign data_mem_ff[27]    = 32'h00400693;
// assign data_mem_ff[28]    = 32'h00200a13;
// assign data_mem_ff[29]    = 32'h000aa103;
// assign data_mem_ff[30]    = 32'h02202e23;
// assign data_mem_ff[31]    = 32'h02102ea3;
// assign data_mem_ff[32]    = 32'h00000013;
// assign data_mem_ff[33]    = 32'h03f02783;
// assign data_mem_ff[34]    = 32'hfefa1ce3;
// assign data_mem_ff[35]    = 32'h02d02ea3;
// assign data_mem_ff[36]    = 32'h02002ea3;
// assign data_mem_ff[37]    = 32'h001a8a93;
// assign data_mem_ff[38]    = 32'h016a8463;
// assign data_mem_ff[39]    = 32'hfd9fff6f;
// assign data_mem_ff[40]    = 32'h002b0b13;
// assign data_mem_ff[41]    = 32'h002b0b13;
// assign data_mem_ff[42]    = 32'h002b0b13;
// assign data_mem_ff[43]    = 32'hff5fff6f;
// assign data_mem_ff[44]  = 32'h0;
// assign data_mem_ff[45]  = 32'h0;
// assign data_mem_ff[46]  = 32'h0;
// assign data_mem_ff[47]  = 32'h0;
// assign data_mem_ff[48]  = 32'h0;
// assign data_mem_ff[49]  = 32'h0;
// assign data_mem_ff[50]  = 32'h0;
// assign data_mem_ff[51]  = 32'h0;
// assign data_mem_ff[52]  = 32'h0;
// assign data_mem_ff[53]  = 32'h0;
// assign data_mem_ff[54]  = 32'h0;
// assign data_mem_ff[55]  = 32'h0;
// assign data_mem_ff[56]  = 32'h0;
// assign data_mem_ff[57]  = 32'h0;
// assign data_mem_ff[58]  = 32'h0;
// assign data_mem_ff[59]  = 32'h0;
// assign data_mem_ff[60]  = 32'h0;
// assign data_mem_ff[61]  = 32'h0;
// assign data_mem_ff[62]  = 32'h0;
// assign data_mem_ff[63]  = 32'h0;
// assign data_mem_ff[64]  = 32'h0;
// assign data_mem_ff[65]  = 32'h0;
// assign data_mem_ff[66]  = 32'h0;
// assign data_mem_ff[67]  = 32'h0;
// assign data_mem_ff[68]  = 32'h0;
// assign data_mem_ff[69]  = 32'h0;
// assign data_mem_ff[70]  = 32'h0;
// assign data_mem_ff[71]  = 32'h0;
// assign data_mem_ff[72]  = 32'h0;
// assign data_mem_ff[73]  = 32'h0;
// assign data_mem_ff[74]  = 32'h0;
// assign data_mem_ff[75]  = 32'h0;
// assign data_mem_ff[76]  = 32'h0;
// assign data_mem_ff[77]  = 32'h0;
// assign data_mem_ff[78]  = 32'h0;
// assign data_mem_ff[79]  = 32'h0;
// assign data_mem_ff[80]  = 32'h0;
// assign data_mem_ff[81]  = 32'h0;
// assign data_mem_ff[82]  = 32'h0;
// assign data_mem_ff[83]  = 32'h0;
// assign data_mem_ff[84]  = 32'h0;
// assign data_mem_ff[85]  = 32'h0;
// assign data_mem_ff[86]  = 32'h0;
// assign data_mem_ff[87]  = 32'h0;
// assign data_mem_ff[88]  = 32'h0;
// assign data_mem_ff[89]  = 32'h0;
// assign data_mem_ff[90]  = 32'h0;
// assign data_mem_ff[91]  = 32'h0;
// assign data_mem_ff[92]  = 32'h0;
// assign data_mem_ff[93]  = 32'h0;
// assign data_mem_ff[94]  = 32'h0;
// assign data_mem_ff[95]  = 32'h0;



//TODO: Asserts to prevent undesired addresses



endmodule


















