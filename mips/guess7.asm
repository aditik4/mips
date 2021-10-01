#a program where the user tries to guess a number
#@author Aditi Khanna
#@version May 12, 2020

.data
correct: .asciiz "Congratulations! you have guessed correctly."
userGuess: .asciiz "Please enter in a guess between 0-100."
high : .asciiz "your guess is too high! Try something lower."
low: .asciiz "your guess is too low! Try something higher."

.text
.globl main

main:
li $a1, 100
li $v0, 42  #generates a random number, stores in a0.
syscall 
move $t0, $a0 #moves random number to t0

la $a0, userGuess #moves guess message to a0
li $v0, 4 #prints guess message
syscall
li $v0, 5 #loads user input
syscall
move $t1, $v0  #moves input into t1

gameLoop:
bgt $t1, $t0, lower #if user input is greater than num
blt $t1 ,$t0, higher  #if user input is less than num
beq $t1, $t0, endGame #if user input is equal to num

higher:
la $a0,high #loads high messaage into a0
li $v0, 4 #prints high message
syscall
li $v0, 5 #loads user input
syscall
move $t1, $v0 #loads new user input into same register
j gameLoop #go back to the main loop

lower:
la $a0, low #loads low into a0
li $v0, 4 #prints low message
syscall
move $t1, $v0 #loads new user input into same register
j gameLoop #go back to the main loop

endGame:
la $a0, correct #loads correct message into a0
li $v0, 4 #prints correct message
syscall

li $v0, 10 #terminates game
syscall







