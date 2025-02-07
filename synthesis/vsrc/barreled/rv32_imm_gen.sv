// `include "rv32_defines.svh"
// `include "rv32_types.svh"

`timescale 1 ps / 1 ps

module rv32_imm_gen (
    // input  logic    rv_instr,    // riscv 32 instruction
    input logic [`XPR_LEN-1 : 0 ] rv_instr, // input instruction
    input  rv32_type_enum_t rv32_imm_type, // riscv 32 imm type
    output rv32_imm_t         rv_imm       // riscv 32 decoded immediate
);


    always_comb begin
        case (rv32_imm_type)
             RV32_TYPE_I : rv_imm = { {20{rv_instr[31]}}, rv_instr[31:20]};
             RV32_TYPE_S : rv_imm = { {20{rv_instr[31]}}, rv_instr[31:25], rv_instr[11:7]};
             RV32_TYPE_B : rv_imm = { {20{rv_instr[31]}}, rv_instr[31], rv_instr[7], rv_instr[30:25], rv_instr[11:8]};
             RV32_TYPE_U : rv_imm = rv_instr[31:12] <<< 12;
             RV32_TYPE_J : rv_imm = { {12{rv_instr[31]}}, rv_instr[31], rv_instr[19:12], rv_instr[20], rv_instr[30:21]};
             default     : rv_imm = { {20{rv_instr[31]}}, rv_instr[31:20]};
        endcase
    end
endmodule