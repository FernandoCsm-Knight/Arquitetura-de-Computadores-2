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

addi rx, $0, 0x30d4 # x = 12500
sll rx, rx, 3 # x = 100000
addi ry, $0, 0x61A8 # y = 25000
sll ry, ry, 3 # y = 200000
add rz, rx, ry # z = x + y
