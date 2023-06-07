# Program

.eqv rx $s0
.eqv ry $s1

.text
.globl main

main:
addi rx, $0, 1 # x = 1
addi ry, $0, 5 # y = 5*x
addi ry, ry, 15 # y = 5*x + 15
