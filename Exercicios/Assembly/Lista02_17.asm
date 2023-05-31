# Program
#
#   rang => $s0
#
#   elem => $s1
#   prev1 => $s2
#   prev2 => $s3
#   
#   for i in range(rang):
#       elem = prev1 + prev2
#       arr.append(elem)
#       prev2 = prev1
#       prev1 = elem
#

.text
.globl main

main:
	lui $t0, 0x1001 # t0 = 0x10010000
	lw $s0, 0($t0) # rang = RANGE
	
	or $s1, $0, $0 # elem = 0x00000000
	or $s2, $0, $0 # prev1 = 0x00000000
	addi $s3, $0, 1 # prev2 = 0x00000001
	
	or $t1, $0, $0 # i = 0
	add $t2, $0, $t0 # t2 = t0
	for:
		beq $t1, $s0, end_for # if i == rang: goto end_for
		
		add $s1, $s2, $s3 # elem = prev1 + prev2
		
		add $t2, $t2, 4 # t2 = t2 + 4
		sw $s1, 0($t2) # MEM[t2] = elem
		
		or $s3, $0, $s2 # prev2 = prev1
		or $s2, $0, $s1 # prev1 = elem
		
		addi $t1, $t1, 1 # i++
		j for
	end_for:

.data
RANGE: .word 46
