# Program

.eqv rx $s0
.eqv ry $s1
.eqv rz $s2

.text
.globl main

main:
addi rx, $0, 3 # x = 3
addi ry, $0, 4 # y = 4

addi rz, $0, 15 # z = 15
sll rz, rz, 1 # z = 2 * 15
addi rz, rz, 15 # z = 3 * 15

addi $t0, $0, 67 # t0 = 67
sll $t0, $t0, 2 # t0 = 4 * 67

add rz, rz, $t0 # z = 3 * 15 + 4 * 67
sll rz, rz, 2 # z = (3 * 15 + 4 * 67) * 4