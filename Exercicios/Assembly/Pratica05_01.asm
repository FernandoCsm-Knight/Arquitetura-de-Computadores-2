# Program

.eqv ra $s0
.eqv rb $s1
.eqv rx $s2
.eqv ry $s3

.text
.globl main

main:
addi ra, $0, 2 # a = 2
addi rx, ra, 3 # x = a + 3
addi rx, rx, -4 # x = a + 3 - 4
addi rx, rx, -5 # x = a + 3 - 4 - 5
addi ry, ra, -3 # y = a - 3
add ry, ry, rx # y = a - 3 + x
sub rb, rx, ry # b = x - y