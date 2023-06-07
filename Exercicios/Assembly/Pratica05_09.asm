# Program
# Associação:
# x => $s0
# i => $s1

.eqv rx $s0
.eqv ri $s1

.text
.globl main

main:
or rx, $0, $0 # x = 0
ori ri, $0, 4 # i = 4
lui $t0, 0x1001 # t0 = 0x10010000

loop:
lw $t1, 0($t0) # t1 = MEM[t0]
add rx, rx, $t1 # x += t1
addi $t0, $t0, 4 # t0 += 4
addi ri, ri, -1 # i--
bne ri, $0, loop # if i != 0: goto loop

sw rx, 0($t0) # MEM[t0] = x

.data
x1: .word 15
x2: .word 25
x3: .word 13
x4: .word 17
soma: .word -1