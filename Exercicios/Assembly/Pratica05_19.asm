# Program
#
# x => $s0
# y => $s1
# i => $s2

.eqv rx $s0
.eqv ry $s1
.eqv ri $s4

.text
.globl main

main:
lui $t0, 0x1001 # t0 = 0x10010000
lw rx, 0($t0) # x = MEM[t0]
lw ry, 4($t0) # y = MEM[t0 + 1]

or $a0, $0, rx # a0 = x
jal range # range(x)
or $t0, $0, $v0 # t0 = range(x)

or $a0, $0, ry # a0 = y
jal range # range(y)
or $t1, $0, $v0 # t1 = range(y)

mult $t0, $t1

add $t2, $t0, $t1 # t2 = t0 + t1

if:
	slti $t2, $t2, 32 # if t2 < 32: t2 = 1 else: t2 = 0
	bne $t2, $0, else # if t2 != 0: goto else
	mflo $s2 # s2 = lo
	mfhi $s3 # s3 = hi
	j end_if
else:
	mflo $s2 # s2 = lo
end_if:

j end

range:
	or ri, $0, $0 # i = 0
	loop:
		beq $a0, $0, end_loop # if a0 == 0: goto end_loop
		addi ri, ri, 1 # i++
		srl $a0, $a0, 1 # a0 = a0 >> 1
		j loop
	end_loop:
	or $v0, $0, ri # v0 = i
	jr $ra # return i

end:
.data
x: 30
y: 125
