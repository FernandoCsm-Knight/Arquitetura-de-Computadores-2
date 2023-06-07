# Program
# Associação:
# t => $t0

.eqv rt $t0

.text
.globl main

main:

ori rt, $0, 0x01 # t = 0x00000001
sll rt, rt, 16 # t = 0x00010000
ori rt, rt, 0xffff # t = 0x0001ffff
sll rt, rt, 15 # t = 0xffff8000
ori rt, rt, 0x7fff # t = 0xffffffff
