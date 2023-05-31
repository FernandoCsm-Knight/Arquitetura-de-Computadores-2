# Program
#
# x => $s0
# NUMBER => $s1
#
# x⁴ + x³ -2x² if x for even
# x⁵ – x³ + 1 if x for odd

.text
.globl main

main:
	ori $s1, $0, 0x1001 # NUMBER = 0x00001001
	sll $s1, $s1, 16 # NUMBER = 0x10010000
	lw $s0, 0($s1) # x = MEM[NUMBER]
	
	mult $s0, $s0 # lo = x²
	mflo $t0 # t0 = x²
	
	mult $t0, $t0 # lo = x⁴
	mflo $t1 # t1 = x⁴
	
	mult $t0, $s0 # lo = x³
	mflo $t2 # t2 = x³
	
	ori $t3, $0, 0x0001 # t3 = 1
	and $t3, $s0, $t3 # t3 = bit menos significativo de x
	bne $t3, $0, odd # if t3 % 2 != 0: goto odd
	
	add $t1, $t1, $t2 # t1 = x⁴ + x³
	sub $t1, $t1, $t0 # t1 = x⁴ + x³ - x²
	sub $t1, $t1, $t0 # t1 = x⁴ + x³ - 2x²
	
	j end
	odd:
		mult $t1, $s0 # lo = x⁵
		mflo $t1 # t1 = x⁵
		
		sub $t1, $t1, $t2 # t1 = x⁵ - x³
		addi $t1, $t1, 1 # t1 = x⁵ - x³ + 1

end:
	sw $t1, 4($s1)

.data 
NUMBER: .word 27
