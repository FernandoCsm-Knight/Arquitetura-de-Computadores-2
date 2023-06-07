# Program
# Associações:
#
# x => $s0
# y => $s1
#

.eqv rx $s0
.eqv rz $s1 

.text
.globl main

main:
lui $t0, 0x1001 # t0 = 0x10010000

lw rx, 0($t0) # rx = MEM[t0]
lw rz, 4($t0) # rz = MEM[t0 + 1]

addi $t1, $0, 0x927c  # t1 = 37500
sll $t1, $t1, 3 # t1 = 300000

add $t1, $t1, rx # t1 = x + 300000
sub $t1, $t1, rz # t1 = x - z + 300000
sw $t1, 8($t0) # y = x - z + 300000

.data
x: .word 100000
z: .word 200000
y: .word 0