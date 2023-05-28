# $s0 => x
# $s1 => y
.text
.globl main

main:
addi $s0, $0, 3 # x = 3
sll $t0, $s0, 10 # $t0 = x * 1024
add $s1, $s0, $t0 # y = x * 1025