#Determines whether num is odd or even
#@author aditi khanna
#@version may 12, 2020
.data 
num: .asciiz "please enter a positive number"
evenMess: .asciiz "your number is even"
oddMess: .asciiz "your number is odd"

.text
.globl main
main:

la $a0, num  #loads message into a0
li $v0, 4   #prints message held in a0 
syscall

li $v0, 5  #reads user input
syscall

move $t0, $v0  #moves user input into a0

li $t1, 2  #moves value of 2 into t1
div $t0, $t1  #divides user input by 2
mfhi $t0  #saves remainder into t0
bne $t0, 0, oddNum #if the remainder is not 0, the number is odd
j evenNum #jumps to even label since number is even

evenNum:
la $a0, evenMess #loads the even message into a0
li $v0, 4  #prints even message held in a0
syscall
li $v0, 10 #terminates
syscall

oddNum:
la $a0, oddMess #loads the odd message into a0
li $v0, 4  #prints even message held in a0
syscall
li $v0, 10 #terminates
syscall
