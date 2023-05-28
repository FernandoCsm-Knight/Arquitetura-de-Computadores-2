# Program
# x => $s0
# parses: if x >= 30 and x <= 50: FLAG = 1 else FLAG = 0

.text
.globl main

main:
ori $t0, $0, 0x1001 # t0 = 0x00001001
sll $t0, $t0, 16 # t0 = 0x10010000
lw $s0, 0($t0) # x = TEMP

slti $t1, $s0, 30 # if x < 30: t1 = 1 else t1 = 0
bne $t1, $0, store0 # if t1 != 0: goto fim

slti $t1, $s0, 51 # if x <= 50: t1 = 1 else: t1 = 0 
j storet1

store0:
ori $t1, $0, 0x0000

storet1:
sw $t1, 4($t0) # if x >= 30 and x <= 50: FLAG = 1 else FLAG = 0

.data
TEMP: .word 50