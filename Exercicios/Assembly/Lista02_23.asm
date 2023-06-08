# Program
#
# x => $s0
# y => $s1
#

.eqv rx $s0
.eqv ry $s1
.eqv ri $t0

.text
.globl main

main:

loop:
ori $v0, $0, 5 # v0 = 5
syscall # input()
or rx, $0, $v0 # x = input()
beq rx, $0, end # if x == 0: goto end

ori $v0, $0, 5 # v0 = 5
syscall # input()
or ry, $0, $v0 # y = input()

or $a0, $0, rx # a0 = x
or $a1, $0, ry # a1 = y
jal pow # pow(x, y)

or $a0, $0, $v0 # a0 = pow(x, y)
ori $v0, $0, 1 # v0 = 1
syscall # print(pow(x, y))

ori $v0, $0, 11 # v0 = 11
ori $a0, $0, 10 # a0 = '\n'
syscall # print('\n')

j loop

pow: # pow(x: int, y: int): int
or $t1, $0, $a0 # t1 = x
or ri, $0, $a1 # i = y
for:
	addi ri, ri, -1 # i--
	beq ri, $0, end_for # if i == 0: goto end_for
	mul $t1, $t1, $a0 # t1 = t1 * x
	j for
end_for:

or $v0, $0, $t1 # v0 = t1
jr $ra # return x^y

end: