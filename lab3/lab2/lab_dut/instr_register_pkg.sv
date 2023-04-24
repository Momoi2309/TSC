/***********************************************************************
 * A SystemVerilog RTL model of an instruction regisgter:
 * User-defined type definitions
 **********************************************************************/
package instr_register_pkg;
  timeunit 1ns/1ns;

  typedef enum logic [3:0] {
  	ZERO,
    PASSA,
    PASSB,
    ADD,
    SUB,
    MULT,
    DIV,
    MOD
  } opcode_t;

  typedef logic signed [31:0] operand_t;
  
  typedef logic [4:0] address_t;
  
  
  typedef struct {
    opcode_t  opc;
    operand_t op_a;
    operand_t op_b;
	operand_t result; //added a field for storing the operation result
  } instruction_t;

function automatic void execute_operation(input instruction_t instr);
case(instr.opc)
	ZERO: instr.result = 0;
	PASSA: instr.result = instr.op_a;
	PASSB: instr.result = instr.op_b;
	ADD: instr.result = instr.op_a + instr.op_b;
	SUB: instr.result = instr.op_a - instr.op_b;
	MULT: instr.result = instr.op_a * instr.op_b;
	DIV: instr.result = instr.op_a / instr.op_b;
	MOD: instr.result = instr.op_a % instr.op_b;
	default: instr.result = 0;
 endcase
endfunction

endpackage: instr_register_pkg
