# $s0 => x
# $s1 => y
.text
.globl main
main: 
addi $s0, $0, -1 # x = -1
sll $t0, $s0, 31
srl $t0, $t0, 31
srl $s1, $t0, 5 # y = x / 32
