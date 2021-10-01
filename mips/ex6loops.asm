#Writes a program that prints the numbers within a range given a step
#@author Aditi Khanna
#@version May 12, 2020

.data
low: .asciiz "Please enter the low bound"
high: .asciiz "Please enter the higher bound"
step: .asciiz "Please enter the step"

.text
.globl main
main:
la $a0, low #loads low message into a0
li $v0, 4 #prints low message in a0
syscall

li $v0, 5 #reads user input, loads into v0
syscall
move $t0, $v0 #loads input from v0 to register t0

la $a0, high #loads high messagee into a0
li $v0, 4 #prints high message
syscall

li $v0, 5 #loads user input
syscall
move $t1, $v0 #loads user input from v0 to register t1

la $a0, step #loads step message
li $v0, 4 #prints message
syscall

li $v0, 5 #loads user input
syscall
move $t2, $v0 #loads user input from v0 to register t2
#move $v0, $t0 #lodas low into v0 to print
#li $v0, 1 #prints low
#syscall

rangeLoop:
li $v0, 1 #set up to print contents of a0
bgt $t0, $t1, endloop #if low is greater than or equal to high, jump to the label endloop
move $a0, $t0 #increments low value by step 
syscall
addu $a0, $t0, $t2 #changes the value of low to incorperate step and loads value to register a0
syscall
j rangeLoop #jumps back to beginning of loop label 

endloop:
li $v0, 10 #terminates program
syscall

