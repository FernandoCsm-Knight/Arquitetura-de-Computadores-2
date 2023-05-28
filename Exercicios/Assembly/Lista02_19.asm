# Program
# 
# mediana = $s0
#
# mediana = A
# if mediana < B and mediana < C:
#     mediana = B
#     if C < B:
#         mediana = C
#
# else if mediana >= C and mediana >= B:
#     meidana = B
#     if C < B:
#         mediana  = C
#

.text
.globl main

main:
ori $t0, $0, 0x1001 # t0 = 0x00001001
sll $t0, $t0, 16 # t0 = 0x10010000
lw $s0, 0($t0) # mediana = A
lw $t1, 4($t0) # t1 = B
lw $t2, 8($t0) # t2 = C
	
	if:
	slt $t3, $s0, $t1 # if mediana < B: t3 = 1 else: t3 = 0
	beq $t3, $0, else # if t3 == 0: goto else
	
	slt $t3, $s0, $t2 # if mediana < C: t3 = 1 else: t3 = 0
	beq $t3, $0, else # if t3 == 0: goto else
	
	j other_if
		
	else:
	slt $t3, $s0, $t1 # if mediana < B: t3 = 1 else: t3 = 0
	bne $t3, $0, end # if t3 != 0: goto end
	
	slt $t3, $s0, $t2 # if mediana < C: t3 = 1 else: t3 = 0
	bne $t3, $0, end # if t3 != 0: goto end
	
	other_if:
	or $s0, $0, $t1 # mediana = B
	slt $t3, $t2, $s0 # if C < B: t3 = 1 else: t3 = 0
	beq $t3, $0, end # if t3 == 0: goto end
	
	or $s0, $0, $t2 # mediana = C
	
end:
sw $s0, 12($t0)

.data 
A: .word 54
B: .word 76
C: .word 80
