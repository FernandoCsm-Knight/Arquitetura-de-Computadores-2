# Program
#
# Array => $s0
# rang => $a1
# i => $s1
#

.text
.globl main

main:
lui $s0, 0x1001 # Array = 0x10010000
or $a0, $0, $s0 # a0 = Array
addi $a1, $0, 10 # rang = 10
jal func # func(Array, rang)
j end

func:
or $v0, $0, $0 # v0 = 0
or $s1, $0, $0 # i = 0

	for:
	beq $s1, $a1, end_for # if i == rang: goto end_for
	or $t0, $0, $s1 # t0 = i
	
	andi $t1, $s1, 0x0001 # t1 = bit menos significativo de i
	bne $t1, $0, odd # if i % 2 != 0: goto odd 
	
	add $t0, $t0, $t0 # t0 = 2i
	addi $t0, $t0, -1 # t0 = 2i - 1
	
	odd:
	sw $t0, 0($a0) # Array[i] = t0
	add $v0, $v0, $t0 # v0 += t0
	
	addi $a0, $a0, 4 # a0 += 4
	addi $s1, $s1, 1 # i++
	j for # continue
	end_for:	

jr $ra # return v0

end:

.data
Array: .word 