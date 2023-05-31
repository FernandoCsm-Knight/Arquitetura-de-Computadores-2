# Programa
# i => $s0 
# j => $s1
# n => $s3
# A => $s4
#
#   int i, j;
#   for (i = 0; i < n - 1; i++)
#
#       for (j = 0; j < n - i - 1; j++)
#           if (A[j] > A[j + 1])
#               swap(&A[j], &A[j + 1]);

.text
.globl main

main:
ori $s4, $0, 0x1001 # A = 0x00001001
sll $s4, $s4, 16 # A = 0x10010000
lw $s3, 0($s4) # n = LEN

or $s0, $0, $0 # i = 0
addi $t0, $s3, -1 # t0 = n - 1
for_1:
	beq $s0, $t0, end_for_1 # if i == n-1: goto end_for_1
	
	or $s1, $0, $0 # j = 0
	sub $t1, $s3, $s0 # t1 = n - i
	addi $t1, $t1, -1 # t1 = n - i - 1
	for_2:
		beq $s1, $t1, end_for_2 # if j == n - i - 1: goto end_for_2
		
		sll $t2, $s1, 2 # t2 = 4 * j
		add $t2, $t2, $s4 # t2 = 4 * j + A
		lw $t3, 4($t2) # t3 = A[j]
		lw $t4, 8($t2) # t4 = A[j + 1]
		
		if: 
			slt $t5, $t4, $t3 # if A[j + 1] < A[j]: t5 = 1 else: t5 = 0
			beq $t5, $0, end_if # if t5 == 0: goto end_if
			
			sw $t3, 8($t2) # A[j + 1] = A[j]
			sw $t4, 4($t2) # A[j] = $t4
		end_if:
	
		addi $s1, $s1, 1 # j++
		j for_2 # continue
	end_for_2:
	
	addi $s0, $s0, 1 # i++
	j for_1 # continue
end_for_1:

.data
LEN: .word 100
A: .word 93, 3, 75, 98, 25, 15, 22, 56, 31, 6, 2, 44, 100, 24, 92, 28, 64, 18, 41, 85, 38, 69, 20, 21, 25, 17, 47, 7, 71, 98, 99, 0, 93, 25, 66, 48, 51, 33, 47, 51, 62, 82, 95, 4, 9, 71, 11, 0, 61, 76, 80, 69, 46, 79, 67, 66, 24, 36, 79, 30, 45, 6, 79, 82, 57, 35, 78, 46, 50, 36, 2, 73, 14, 98, 53, 92, 28, 78, 37, 84, 68, 99, 55, 28, 54, 43, 0, 76, 5, 90, 57, 60, 76, 49, 65, 42, 4, 17, 70, 10
