# Program
# Associações:
#
# x => $s0
# k => $s1
# 

.eqv rx $s0
.eqv rk $s1

.text
.globl main
main:
lui rx, 0x1001 # t0 = 0x10010000
or rx, rx, 0x0008 # t0 = 0x10010008

lw $t0, 0(rx) # t0 = MEM[x]
lw $t1, 0($t0) # t1 = MEM[MEM[x]]
lw rk, 0($t1) # k = MEM[MEM[MEM[x]]]

add rk, rk, rk # k = 2k

sw rk, 0($t1) # MEM[MEM[MEM[x]]] = 2k

.data
integer: .word 10
pointer_pointer: 0x10010000
pointer: 0x10010004