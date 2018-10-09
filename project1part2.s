
#Daniel Donato
#cse 341
.globl main
.globl done
.globl sum
.globl loop
.globl multiplyloop
.globl firstnumberloop
.globl finishedfirst
.globl secondnumber
.globl finishedsecond
.globl finishedthird
.globl thirdnumber
.globl movetensplace
.globl firstneg
.globl secondneg
.globl thirdneg
.globl finish
.globl divideloop
 .globl reversenumber

.data
prompt:  .asciiz   "12345"

#valueofminus: 45 #in decimal
.text

	# 45 value of -
 # 44 value of comma
 # 43 value of +
divideloop:
 # t4running counter of divisions
 # t5number to divide by
 # t6running sum of current division
addi $t4, $t4, 1
sub $t6, $t6, $t5
slti $t7, $t6, 3 #can t6 be subtracted again
beq $t7, $0, divideloop
add $0,$0,$0 #no op

jr $ra
add $0,$0,$0 #no op

 firstneg:
 sub $t0, $0, $t0
 add $s3, $s3, $t0
  add $s4, $s4, $t0
 add $t0, $0, $0
  add $t3, $0, $0
 jr secondnumber
 add $0, $0, $0 #noop

 secondneg:
 sub $t0, $0, $t0
 add $s3, $s3, $t0
 add $s5, $s5, $t0
 add $t0, $0, $0
  add $t3, $0, $0
 jr thirdnumber
 add $0, $0, $0 #noop

 thirdneg:
 sub $t0, $0, $t0
 add $s3, $s3, $t0
  add $s6, $s6, $t0
 add $t0, $0, $0
  add $t3, $0, $0
 jr finish
 add $0, $0, $0 #noop

 movetensplace:
 addi $t5, $t5, 1
 addi $t8, $t8, 1
 add $t4, $t4, $t6 #t4 is running sum, t3 is the int extracted from string
 slti $t7,$t5, 10
 bne $t7, $0, movetensplace
 add $0, $0, $0 #noop
 add $t6, $t4, $0
 jr $ra
add $0, $0, $0 #noop

multiplyloop:
addi $t5, $t5, 1
add $t4, $t4, $t3 #t4 is running sum, t3 is the int extracted from string
 # slt $t7,$t5,$t6
bne $t5, $t6, multiplyloop
add $0, $0, $0 #noop
add $t3, $t4, $0 #
add $t4, $0, $0 #
jr $ra
add $0, $0, $0 #noop

reversenumber:
and $t7, $t1, $s7
sll $t7, $t7, 24
srl $t1, $t1, 8
add $t8, $t7, $0
and $t7, $t1, $s7
sll $t7, $t7, 16
srl $t1, $t1, 8
add $t8, $t7, $t8
and $t7, $t1, $s7
sll $t7, $t7, 8
srl $t1, $t1, 8
add $t8, $t7, $t8
and $t7, $t1, $s7
add $t8, $t7, $t8
add $t1, $t8, $0
  add $t8, $0, $0 #noop
  and $t7, $t2, $s7
  sll $t7, $t7, 24
  srl $t2, $t2, 8
  add $t8, $t7, $0
  and $t7, $t2, $s7
  sll $t7, $t7, 16
  srl $t2, $t2, 8
  add $t8, $t7, $t8
  and $t7, $t2, $s7
  sll $t7, $t7, 8
  srl $t2, $t2, 8
  add $t8, $t7, $t8
  and $t7, $t2, $s7
  add $t8, $t7, $t8
  add $t2, $t8, $0
jr $ra
add $0, $0, $0 #noop

main:
# lui $a0, 0x1000
# lw $a3, ($a0)
# add $a1, $a0, $0
# add $a2, $a0, $0
addi $s7, $0, 0xff
  addi $s0, $0, 48 #hex value
  addi $s1, $0, 45 #value of negative
  addi $s2, $0, 1 #to increment via subtraction
  add $t4, $0, $0 #t4 is for running sum
  addi $t6, $0, 1 #t6 is for which 10s place we need
  add $t5, $0, $0 #t5 counter for looped multiply
  add $t7, $0, $0 #t7 for checking if the number is done
  lw $t2, ($a0) # get first parameter and loada into t1 #t1 is where we work from
   addi $a0, $a0, 4 #off set to get the second part of the input
   lw $t1, ($a0)  # get second half of first  parameter and loada into t1
   jal reversenumber
       add $0, $0, $0 #noop
  add $t0, $0, $0 #t0 is where weconstruct the number
# and $t3, $t1, $s7

 # and $t3, $t2, $s7


# srl $t3, $t3, 24
#
firstnumberloop:

and $t3, $t1, $s7
 # srl $t3, $t3, 24
 srl $t1, $t1, 8
  slti $t7, $t3, 43 #is the remaining number less than the value of a +
  bne $t7, $0, finishedfirst  # is NOT greater than comma
  add $0, $0, $0 #noop

  add $0, $0, $0 #noop
  # slti $t7, $t3, 45 #is the remaining number a positive sign or comma
   beq $t3, $s1, firstneg #  a negative sign
  add $0, $0, $0 #noop
  sub $t3, $t3, $s0 # subtract ascii offset 0x30
  add $0, $0, $0 #noop
add $t7, $0, $0
  add $t5, $0, $0
  add $t4, $0, $0
  jal multiplyloop
  add $0, $0, $0 #noop
    add $t4, $0, $0 #noop
  addi $t5, $0, 0
  add $t0, $t3, $t0
add $t7, $0, $0
  add $0, $0, $0 #noop
  jal movetensplace
  add $0, $0, $0 #noop
    add $t5, $0, $0
    add $t7, $0, $0
      add $t4, $0, $0 #noop
  # slti $t7, $t3, 45 #is the remaining number a positive sign or comma
   jr firstnumberloop # not a negative sign
   # sub $s3, $0, $t0

  add $0, $0, $0 #noop
  add $0, $0, $0 #noop
  # sub $t0, $0, $t0
finishedfirst:
slti $t7, $t1, 43 #is the remaining number less than the value of a +
beq $t7, $0, firstnumberloop
  add $0, $0, $0 #noop
  add $t1, $t2, $0
  add $t2, $0, $0
  slti $t7, $t1, 43 #no ints left?
  beq $t7, $0, firstnumberloop
  add $0, $0, $0 #noop

  add $t4, $0, $0 #t4 is for running sum
  addi $t6, $0, 1 #t6 is for which 10s place we need
  add $t5, $0, $0 #t5 counter for looped multiply
  add $t7, $0, $0 #t7 for checking if the number is done
  add $t1, $0, $0
  add $t2, $0, $0
  lw $t2, ($a1) # get second parameter and loada into t1
  addi $a1, $a1, 4 #off set to get the second part of the input
  lw $t1, ($a1)  # get second half of second  parameter and loada into t1
  jal reversenumber
  add $0, $0, $0 #noop
 beq $t3, $s1, firstneg
 add $0, $0, $0 #noop
 add $s3, $s3, $t0
  add $s4, $s4, $t0
 add $t0, $0, $0
  add $t3, $0, $0



#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#   #set the number to be negative
secondnumber:

and $t3, $t1, $s7
 # srl $t3, $t3, 24
 srl $t1, $t1, 8
  slti $t7, $t3, 43 #is the remaining number less than the value of a +
  bne $t7, $0, finishedsecond  # is NOT greater than comma
  add $0, $0, $0 #noop

  add $0, $0, $0 #noop
  # slti $t7, $t3, 45 #is the remaining number a positive sign or comma
   beq $t3, $s1, secondneg #  a negative sign
  add $0, $0, $0 #noop
  sub $t3, $t3, $s0 # subtract ascii offset 0x30
  add $0, $0, $0 #noop
add $t7, $0, $0
  add $t5, $0, $0
  add $t4, $0, $0
  jal multiplyloop
  add $0, $0, $0 #noop
    add $t4, $0, $0 #noop
  addi $t5, $0, 0
  add $t0, $t3, $t0
add $t7, $0, $0
  add $0, $0, $0 #noop
  jal movetensplace
  add $0, $0, $0 #noop
    add $t5, $0, $0
    add $t7, $0, $0
      add $t4, $0, $0 #noop
  # slti $t7, $t3, 45 #is the remaining number a positive sign or comma
   jr secondnumber # not a negative sign
   # sub $s3, $0, $t0

  add $0, $0, $0 #noop
  add $0, $0, $0 #noop


finishedsecond:
slti $t7, $t1, 43 #is the remaining number less than the value of a +
beq $t7, $0, secondnumber
  add $0, $0, $0 #noop
  add $t1, $t2, $0
  add $t2, $0, $0
  slti $t7, $t1, 43 #no ints left?
  beq $t7, $0, secondnumber
  add $0, $0, $0 #noop

  add $t4, $0, $0 #t4 is for running sum
  addi $t6, $0, 1 #t6 is for which 10s place we need
  add $t5, $0, $0 #t5 counter for looped multiply
  add $t7, $0, $0 #t7 for checking if the number is done
  add $t1, $0, $0
  add $t2, $0, $0
  lw $t2, ($a2) # get second parameter and loada into t1
  addi $a2, $a2, 4 #off set to get the second part of the input
  lw $t1, ($a2)  # get second half of second  parameter and loada into t1
  jal reversenumber
  add $0, $0, $0 #noop
 beq $t3, $s1, secondneg
 add $0, $0, $0 #noop
 add $s3, $s3, $t0
  add $s5, $s5, $t0
 add $t0, $0, $0
  add $t3, $0, $0

thirdnumber:

and $t3, $t1, $s7
 # srl $t3, $t3, 24
 srl $t1, $t1, 8
  slti $t7, $t3, 43 #is the remaining number less than the value of a +
  bne $t7, $0, finishedthird  # is NOT greater than comma
  add $0, $0, $0 #noop

  add $0, $0, $0 #noop
  # slti $t7, $t3, 45 #is the remaining number a positive sign or comma
   beq $t3, $s1, thirdneg #  a negative sign

  sub $t3, $t3, $s0 # subtract ascii offset 0x30
  add $0, $0, $0 #noop
add $t7, $0, $0
  add $t5, $0, $0
  add $t4, $0, $0
  jal multiplyloop
  add $0, $0, $0 #noop
    add $t4, $0, $0 #noop
  addi $t5, $0, 0
  add $t0, $t3, $t0
add $t7, $0, $0
  add $0, $0, $0 #noop
  jal movetensplace
  add $0, $0, $0 #noop
    add $t5, $0, $0
    add $t7, $0, $0
      add $t4, $0, $0 #noop
  # slti $t7, $t3, 45 #is the remaining number a positive sign or comma
   jr thirdnumber # not a negative sign
   # sub $s3, $0, $t0

  add $0, $0, $0 #noop
  add $0, $0, $0 #noop

finishedthird:
slti $t7, $t1, 43 #is the remaining number less than the value of a +
beq $t7, $0, thirdnumber
  add $0, $0, $0 #noop
  add $t1, $t2, $0
  add $t2, $0, $0
  slti $t7, $t1, 43 #no ints left?
  beq $t7, $0, thirdnumber
  add $0, $0, $0 #noop
 #   # bne $t3, $t6, secondnumber #is negative sign?
 #  # bne $t1, $t6, secondnumber
 #  add $0, $0, $0 #noop
  add $t4, $0, $0 #t4 is for running sum

 beq $t3, $s1, thirdneg
 add $0, $0, $0 #noop
 add $0, $0, $0 #noop
 add $s3, $s3, $t0
 add $s6, $s6, $t0
 #add $t0, $0, $0


finish:
add $t4, $0, $0 # running counter of divisions
addi $t5, $0, 3 # number to divide by
add $t6, $s3, $0 # running sum of current division
add $t7, $0, $0
#t4 will be the number of times it can be divided
jal divideloop
 add $0, $0, $0 #noop
add $v0, $t4, $0 # the result of dividing == the average of the three ints
done:	add $0, $0, $0         # End
