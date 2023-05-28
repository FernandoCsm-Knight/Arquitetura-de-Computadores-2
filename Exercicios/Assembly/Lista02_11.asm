# Program
#
# i => $s0
# j = $s1
#
# i = 10
# j = 0
# do {
#     j++;
# } while(j != i);
#

.text
.globl main

main:
or $s1, $s0, $s0 # j = 0
addi $s0, $0, 10 # i = 19

do_while:
	addi $s1, $s1, 1 # j++
	bne $s1, $s0, do_while # if j != i: goto do_while
	