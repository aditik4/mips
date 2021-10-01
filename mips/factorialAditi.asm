#prints out the factorial of a number
#@author Aditi Khanna
#@version may 15, 2020

.data
mess: .asciiz "enter a number"
     .text
     .globl main
main:
    la $a0, mess
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    jal factorial
    move $a0, $v0
    li $v0, 1
    syscall
    li $v0, 10
    syscall
factorial:
    subi $sp, $sp, 8
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    beq $t0, 0, end
    li $v0, 1
    mul $v0, $t0, $v0 
    subu $t0, $t0, 1
    jal factorial
end:
    lw $ra, ($sp)
    addu $sp, $sp, 4
    jr $ra