# Program
# Associações:
# x => $s0
# y => $s1
# z => $s2

.eqv rx $s0
.eqv ry $s1
.eqv rz $s2

.text
.globl main

main:
lui rx, 0x7fff # x = 0x7fff0000
ori rx, rx, 0xffff # x = 0x7fffffff

addi ry, $0, 0x927C # y = 37500
sll ry, ry, 3 # y = 300000

sll $t0, ry, 2 # t0 = 4y
sub rz, rx, $t0 # z = x - 4y 

