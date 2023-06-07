# Program
# Associações:
# 
# elem => $s0
# sum => $s1
# i => $s2
#

.eqv relem $s0
.eqv rsum $s1
.eqv ri $s2

.text
.globl main

main:
lui $t0, 0x1001 # t0 = Array

or ri, $0, $0 # i = 0
or rsum, $0, $0 # sum = 0
or $t1, $0, 100 # t1 = 100
loop:
	sll relem, ri, 1 # elem = 2*i
	addi relem, relem, 1 # elem = 2*i + 1
	sw relem, 0($t0) # MEM[t0] = elem
	add rsum, rsum, relem # sum += elem
	
	addi $t0, $t0, 4 # t0 += 4
	addi ri, ri, 1 # i++
	bne ri, $t1, loop # if ri != 100: goto loop

sw rsum, 0($t0) # MEM[t0] = sum

.data
.Array: .word 0