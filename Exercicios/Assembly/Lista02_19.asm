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
lui $t0, 0x1001 # t0 = 0x10010000
lw $s0, 0($t0) # mediana = A
lw $t1, 4($t0) # t1 = B
lw $t2, 8($t0) # t2 = C
	
	if:
	slt $t3, $s0, $t1 # if mediana < B: t3 = 1 else: t3 = 0
	slt $t4, $s0, $t2 # if mediana < C: t4 = 1 else: t4 = 0
	
	beq $t3, $0, else # if t3 == 0: goto else
	beq $t4, $0, else # if t4 == 0: goto else
	
	j other_if
		
	else:
	bne $t3, $0, end # if t3 != 0: goto end
	bne $t4, $0, end # if t4 != 0: goto end
	
	other_if:
	or $s0, $0, $t1 # mediana = B
	slt $t3, $t2, $s0 # if C < B: t3 = 1 else: t3 = 0
	bne $t3, $0, end # if t3 == 0: goto end
	
	or $s0, $0, $t2 # mediana = C
	
end:
sw $s0, 12($t0) # MEM[t0 + 12] = mediana

.data 
A: .word 23
B: .word 98
C: .word 17
