# $s0 => x
.text
.globl main

main:
addi $t0, $0, 0x1234
sll $t0, $t0, 16
ori $s0, $t0, 0x5678 # x = 0x12345678
