# $s0 => x
# $s1 => y
.text
.globl main

main:
addi $s0, $0, 3 # x = 3
srl $s1, $s0, 2 # y = x / 4
