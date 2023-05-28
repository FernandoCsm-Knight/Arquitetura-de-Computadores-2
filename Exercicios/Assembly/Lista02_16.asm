# Program
#
# x = $s0
#
# x3 + 1 if x > 0
# x4 - 1 if x <= 0

.text
.globl main

main:
	ori $t0, $0, 0x1001 # t0 = 0x00001001
	sll $t0, $t0, 16 # t0 = 0x10010000
	lw $s0, 0($t0) # x = NUMBER
	
	mult $s0, $s0 # lo = x²
	
	slt $t1, $0, $s0 # if 0 < x: t1 = 1 else: t1 = 0
	beq $t1, $0, lessthanzero # id t1 == 0: goto lessthanzero
	
	mflo $t1 # t1 = x²
	
	mult $t1, $s0 # lo = x³
	mflo $t1 # t1 = x³
	
	addi $t1, $t1, 1 # t1 = x³ + 1
	j end

	lessthanzero:
	mflo $t1 # t1 = x²
	
	mult $t1, $t1 # lo = x⁴
	mflo $t1 # t1 = x⁴
	
	addi $t1, $t1, -1 # t1 = x⁴ - 1 
	
end:
	sw $t1, 4($t0) # MEM[t0 + 4] = t1

.data
NUMBER: .word 82