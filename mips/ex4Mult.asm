#multiplies two nums
#@author aditi khanna

.data
num1: .asciiz "Please enter a number"
num2: .asciiz "Pleease enter another number"

.text
.globl main
main:

la $a0, num1  #loads message into a0
li $v0, 4   #prints message held in a0 
syscall

li $v0, 5  #reads user input
syscall

move $t0, $v0  #moves contents of v0 into t0

la $a0, num2  #loads message into a0
li $v0, 4     #prints message held in a0
syscall

li $v0, 5   #reads user input
syscall 

move $t1, $v0   #moves contents of v0 into t1

mult $t0, $t1  #multiplies contents of t0 and t1
mflo $a0   #moves the product into a0
li $v0, 1 #prints contents of a0
syscall
