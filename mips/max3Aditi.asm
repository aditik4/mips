.data
message: .asciiz "please enter in a number"
 .text
 .global main
main:
   la $a0, message
   li $v0, 4
   syscall
   li $v0, 5
   syscall    
   move $a1, $v0
   li $v0, 4
   syscall
   li $v0, 5
   syscall
   move $a2, $v0
   li $v0, 4
   syscall
   li $v0, 5
   syscall
   move $a3, $v0
   jal max3
   move $a0, $v0
   li $v0, 1
   syscall
   
   li $v0, 10 #terminate
   syscall
   
   max3:
    subu $sp, $sp, 4
    sw $ra, (0($sp))
    jal max2  # jump to max 2
    move $a1, $v0
    move $a2, $t2
    jal max2
    addu $sp, $sp,4
    jr $ra
    
    max2:   #determines max between two nums
     bgt $t0, $t1, greater
     move $v0, $t1
     jr $ra
     
     greater:
     move $v0, $t0
     jr $ra
   