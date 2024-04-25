.data
A: .word 0,1,2,3,4,5,6,7,8,-9
.text
li $s1, -1
la $s2, A
li $s3, 10
li $s4,1
li $s6, 0 #max
loop: add $s1,$s1,$s4 #i=i+step
add $t1,$s1,$s1 #t1=2*s1
add $t1,$t1,$t1 #t1=4*s1
add $t1,$t1,$s2 #t1 store the address of A[i]
lw $t0,0($t1) #load value of A[i] in $t0
slt $t2, $t0, $zero
beq $t2, $zero, abs_done
sub $t0, $zero, $t0

abs_done:
slt $t3, $t6, $t0
beq $t3, $zero,done
add $s6, $t0, $zero
done:
bne $s1, $s3, loop