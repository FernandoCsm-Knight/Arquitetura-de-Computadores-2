# Program
#
# x => $s0
#

.text
.globl main

main:
lui $t0, 0x1001 # t0 = 10010000
lw $s0, 0($t0) # x = MEM[t0]

andi $t1, $s0, 0x01 # t1 = bit menos significativo de x
sw $t1, 4($t0) # MEM[t0 + 1] = t1

.data
.word 97