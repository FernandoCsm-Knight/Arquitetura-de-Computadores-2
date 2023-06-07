# Program
#
# x => $s0
#

.text
.globl main

main:
lui $t0, 0x1001 # t0 = 10010000
lw $s0, 0($t0) # x = MEM[t0]

slt $t1, $s0, $0 # if x < 0: t1 = 1 else: t1 = 0
beq $t1, $0, end # if t1 == 0: goto end
sub $s0, $0, $s0 # else x = 0 - x

end:
sw $s0, 0($t0) # MEM[t0] = x

.data
A: .word -83