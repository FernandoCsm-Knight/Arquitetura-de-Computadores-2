# Program
#  
# x => $s0
# z => $s2
#

.eqv rx $s0
.eqv rz $s1

.text
.globl main
main:
lui $t0, 0x1001 # t0 = 0x10010000
lw rx, 0($t0) # x = MEM[t0]
lw rz, 4($t0) # y = MEM[t0 + 1]

sll $t1, rx, 7 # t1 = 128x
sub $t1, $t1, rx # t1 = 127x

sll $t2, rz, 6 # t2 = 64z
add $t2, $t2, rz # t2 = 65z

sub $t3, $t1, $t2 # t3 = 127x - 65z
add $t3, $t3, 1 # t3 = 127x - 65z + 1
sw $t3, 8($t0) # MEM[t0 + 2] = t3

.data
x: .word 5
z: .word 7
y: .word 0