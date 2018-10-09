
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
.globl convertnumbers
 .globl reversenumber
 .globl convert1
 .globl convert2
 .globl convert3
 .globl convert4
 .globl convert5
.globl switch12
.globl switch23
.globl switch34
.globl switch45
.globl setmemoryspotssort


.data
prompt:  .asciiz   "111111112222"

#valueofminus: 45 #in decimal
.text

switch12:
add $s0, $t2,$0
add $t2, $t1, $0
add $t1, $s0, $0

add $t0, $s2,$0
add $s2, $s1, $0
add $s1, $t0, $0
jr sort
add $0, $0, $0

switch23:
add $s0, $t3,$0
add $t3, $t2, $0
add $t2, $s0, $0

add $t0, $s3,$0
add $t3, $s2, $0
add $s2, $t0, $0
jr sort
add $0, $0, $0

switch34:
add $s0, $t4,$0
add $t4, $t3, $0
add $t3, $s0, $0

add $t0, $s4,$0
add $s4, $s3, $0
add $s3, $t0, $0
jr sort
add $0, $0, $0

switch45:
add $s0, $t5,$0
add $t5, $t4, $0
add $t4, $s0, $0

add $t0, $s5,$0
add $s5, $s4, $0
add $s4, $t0, $0
jr sort
add $0, $0, $0


 firstneg:
 sub $t0, $0, $t0
 add $s3, $s3, $t0
  add $s4, $s4, $t0
 add $t0, $0, $0
  add $t3, $0, $0
 jr convertnumbers
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
lui $a0, 0x1000
lui $a1, 0x1000

add $s3, $0, $0
# add $a1, $a0, $0
# add $a2, $a0, $0
addi $s7, $0, 0xff
  addi $a2, $0, 48 #hex value
  addi $a3, $0, 45 #value of negative
  # addi $s2, $0, 1 #to increment via subtraction
  add $s0, $a0, 32
  add $s1, $a0, 64
  add $s2, $a0, 72
  add $s4, $0, $0
convertnextstring:
  slti $s7, $s3, 1
  bne $s7, $0, convert1
  add $0, $0, $0 #noop
  slti $s7, $s3, 2
  bne $s7, $0, convert2
  add $0, $0, $0 #noop
  slti $s7, $s3, 3
  bne $s7, $0, convert3
  add $0, $0, $0 #noop
  slti $s7, $s3, 4
  bne $s7, $0, convert4
  add $0, $0, $0 #noop
  slti $s7, $s3, 5
  bne $s7, $0, convert5
  add $0, $0, $0 #noop


convert1:
add $a1, $s1, $0 # setting the location to pull the string to convert to int

jr convertnumbers
  add $0, $0, $0 #noop
convert2:
add $a1, $s2, $0# setting the location to pull the string to convert to int
jr convertnumbers
  add $0, $0, $0 #noop
convert3:
add $a1, $s3, $0# setting the location to pull the string to convert to int
jr convertnumbers
  add $0, $0, $0 #noop
convert4:
add $a1, $a0, 64# setting the location to pull the string to convert to int
jr convertnumbers
  add $0, $0, $0 #noop
convert5:
add $a1, $a0, 40 # setting the location to pull the string to convert to int
jr convertnumbers
  add $0, $0, $0 #noop



convertnumbers:

slti $s7, $s3, 4
beq $s7, $0, setmemoryspotssort
addi $s3, $s3, 1
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
  sb $t0, ($a1)
  slti $s7, $s3, 5
  bne $s7, $0, convertnextstring
  add $0, $0, $0 #noop
setmemoryspotssort:
add $s1, $a0, $0 # set memory location to move the strings rather than covert back
addi $s2, $a0, 8# set memory location to move the strings rather than covert back
addi $s3, $a0, 16# set memory location to move the strings rather than covert back
addi $s4, $a0, 24# set memory location to move the strings rather than covert back
addi $s5, $a0, 32# set memory location to move the strings rather than covert back
sort:


  slti $s7, $t1, $t2 # is 2 less than 1
  beq $s7, $0, switch12
add $0, $0, $0
    slti $s7, $t2, $t3# is 3 less than 2
    bne $s7, $0,switch23
add $0, $0, $0
      slti $s7, $t3, $t4# is 3 less than 2
      bne $s7, $0,switch34
add $0, $0, $0
      slti $s7, $t4, $t5# is 4 less than 3
      bne $s7, $0,switch45
add $0, $0, $0
      slti $s7, $t1, $t2# is 5 less than 4
      bne $s7, $0,
add $0, $0, $0


  add $0, $0, $0 #noop



finish:
# add $t4, $0, $0 # running counter of divisions
# addi $t5, $0, 3 # number to divide by
# add $t6, $s3, $0 # running sum of current division
# add $t7, $0, $0
# #t4 will be the number of times it can be divided
# jal divideloop
#  add $0, $0, $0 #noop
add $v0, $t4, $0 # the result of dividing == the average of the three ints
done:	add $0, $0, $0         # End
