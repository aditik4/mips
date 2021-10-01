.data
enter:  .asciiz "please enter a number"

.text
.globl main

main:
	la $a0, enter
	li $v0, 4
	syscall
	li $v0, 5
	move $a1, $v0
	li $v0, 4
	syscall
	move $a2, $v0
	jal max2
	move $a0, $v0
	li $v0, 10
	syscall
max2:
       bgt $a1, $a2, greater
       move $v0, $a2
       jr $ra
greater:
       move $v0, $a1
       jr $ra
