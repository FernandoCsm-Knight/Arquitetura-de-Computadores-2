# Program
# 
# num => $s0
# flag => $s1
# 
# if 50 <= num <=100 or 150 <= num <= 200:
#     flag = 1;
# else
#     flag = 0;
#

.text
.globl main

main:
	ori $t0, $0, 0x1001 # t0 = 0x00001001
	sll $t0, $t0, 16 # t0 = 0x10010000
	lw $s0, 0($t0) # num = MEM[t0]
	
	slti $s1, $s0, 50 # if num < 50: flag = 1 else: flag = 0
	bne $s1, $0, set_zero # if flag != 0: goto set_zero
	
	slti $s1, $s0, 101 # if num <= 100: flag = 1 else: flag = 0
	bne $s1, $0, end # if num != 0: goto end
	
	slti $s1, $s0, 150 # if num < 150: flag = 1 else: flag = 0
	bne $s1, $0, set_zero # if num != 0: goto set_zero
	
	slti $s1, $s0, 201 # if num <= 200: flag = 1 else flag = 0
	j end
	
	set_zero:
	or $s1, $0, $0 # flag = 0
end:

.data
NUMBER: .word 100
