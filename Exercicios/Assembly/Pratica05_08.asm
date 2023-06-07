# Program
# Associação:
# t => $t0

.eqv rt $t0

.text
.globl main

main:
lui rt, 0x1234 # t = 0x12340000
ori rt, rt, 0x5678 # t = 0x12345678

srl $9, rt, 24 # $9 = 0x12

sll $10, rt, 8 # $10 = 0x34567800
srl $10, $10, 24 # $10 = 0x34

andi $11, rt, 0xff00 # $11 = 0x5600
srl $11, $11, 8 # $11 = 0x56
 
andi $12, rt, 0x00ff # $12 = 0x78
