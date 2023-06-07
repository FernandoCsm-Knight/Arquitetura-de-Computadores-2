.text
.globl main

main:
lui $s2, 0x1001 # s2 = 0x10010000

addi $s3, $s2, 396 # s3 = s2 + 396
loop:
lw $s1, 0($s2) # s1 = A[s2]
addi $s1, $s1, 1 # s1++
sw $s1, 0($s2) # A[s2] = s1
nop
nop
addi $s2, $s2, 4 # s2 += 4
sub $s4, $s3, $s2 # s4 = s3 + s2
bne $s4, $zero, loop # if s4 != 0: goto loop

.data
.word 49, 92, 58, 62, 5, 6, 31, 38, 45, 80, 67, 71, 14, 6, 20, 92, 21, 98, 72, 82, 33, 52, 48, 62, 24, 49, 94, 18, 9, 12, 56, 99, 11, 1, 7, 46, 65, 20, 19, 47, 47, 86, 14, 71, 44, 30, 12, 21, 38, 81, 34, 94, 98, 48, 61, 21, 50, 46, 85, 22, 13, 18, 93, 4, 36, 35, 53, 55, 51, 24, 28, 9, 26, 15, 63, 79, 80, 58, 15, 57, 1, 69, 51, 52, 45, 43, 39, 24, 20, 99, 57, 93, 47, 52, 34, 13, 67, 53, 58, 6