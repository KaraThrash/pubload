
#Daniel Donato
#cse 341

.globl main
.globl done
.globl loop
.globl loopnumber
.globl signcheck
.globl signcheckneg
.globl firstjump
.data 0x10020000
prompt:  .asciiz   "Enter a Number: "
#valueofminus: 45 #in decimal
.text


loopnumber:
# beq $t6, $t7, loop
add $0, $0, $0#nooop
sb  $t6, ($t0)
addi $t0, $t0, 1 # move the target location of the next byte to be stored
slt $t1, $t7, $t3 # is the remaining value less than the smallest ascii character
bne $t1, $0, loop # the entered number shifted past it's value
add $0, $0, $0#nooop
jr $ra                # Return
add $0, $0, $0#nooop
signcheckneg:
      sb  $t6, ($t0)
      addi $t0, $t0, 1 # offset the store location
      add $0, $0, $0#nooop
signcheck:
     srl $t3, $t3, 8
    add $0, $0, $0#nooop
loop:
	addi $t6, $0, 0
	andi $t6, $t3, 0xff # the first 2 bytes of the entered number
  beq $t5, $t6, signcheckneg # ascii -
  add $0, $0, $0
  beq $t4, $t6, signcheck  # ascii +
  add $0, $0, $0
	 srl $t3, $t3, 8 # shift off the first ascii value
	bne $t6, $t7, loopnumber # if not comma save
	add $0, $0, $0 #nooop
	slt $t1, $t7, $t3 # is the remaining value less than the smallest ascii character
 	bne $t1, $0, loop
  add $0, $0, $0
	jr $ra
	add $0, $0, $0

main:
    addi $t7, $0, 44 #value of comma
    addi $t5, $0, 45 #value of -
    addi $t4, $0, 43 #value of +
    add $t6, $0, $0 #value of +
    addi $v0, $0, 4
    lui $a0, 0x1002        # Address of prompt
    syscall
    # add $a0, $0, $0
    # lui $a0, 0x1001        # Address to save input
    addi $a0, $a0, 32
    addi $v0, $0, 8
    syscall     # Get first input

    lw $t3, ($a0)  #t3 is the first half of the entered number
    addi $a0, $a0, 4 # possible 5 digits, sign and comma means the character can extended past the one register
    lw $t2, ($a0) #t2 is the first half of the entered number
    lui $t0, 0x1000

    andi $t6, $t3, 0xff

    jal loop
		add $0, $0, $0
		add $t3, $t2, $0

		add $0, $0, $0
		jal loop
		add $0, $0, $0#nooop
    addi $t6, $0, 0
    addi $t3, $0, 0
    addi $t2, $0, 0
    addi $t1, $0, 0

    addi $v0, $0, 4
    addi $a0, $a0, -36 #backto prompt
    syscall

    addi $a0, $a0, 40 #moving where the input is stored to not get holdover from previous numbers
    addi $v0, $0, 8
    syscall      # Get first input
     lw $t3, ($a0)  #t3 is the first half of the entered number
     addi $a0, $a0, 4 # possible 5 digits, sign and comma means the character can extended past the one register
     lw $t2, ($a0) #t2 is the first half of the entered number
    lui $t1, 0x1000
    addi $t0, $t1, 0
    addi $t0, $t0, 0x8 #store the second input at 8
    addi $t1, $0, 0
     andi $t6, $t3, 0xff

    jal loop
    add $0, $0, $0
    add $t3, $t2, $0

    add $0, $0, $0
    jal loop
    add $0, $0, $0#nooop
    addi $t6, $0, 0
    addi $t3, $0, 0
    addi $t2, $0, 0
    addi $t1, $0, 0
    addi $v0, $0, 4
    addi $a0, $a0, -44 #backto prompt
    syscall

    addi $a0, $a0, 48 #moving where the input is stored to not get holdover from previous numbers
    addi $v0, $0, 8
    syscall      # Get first input
     lw $t3, ($a0)  #t3 is the first half of the entered number
     addi $a0, $a0, 4 # possible 5 digits, sign and comma means the character can extended past the one register
     lw $t2, ($a0) #t2 is the first half of the entered number
    lui $t1, 0x1000
    addi $t0, $t1, 0
    addi $t0, $t0, 0x10 #store the second input at hex 10
    addi $t1, $0, 0
     andi $t6, $t3, 0xff

    jal loop
    add $0, $0, $0
    add $t3, $t2, $0

    add $0, $0, $0
    jal loop
    add $0, $0, $0#nooop
    addi $t6, $0, 0
    addi $t3, $0, 0
    addi $t2, $0, 0
    addi $t1, $0, 0
    addi $v0, $0, 4
    addi $a0, $a0, -52 #backto prompt
    syscall

    addi $a0, $a0, 56 #moving where the input is stored to not get holdover from previous numbers
    addi $v0, $0, 8
    syscall      # Get first input
     lw $t3, ($a0)  #t3 is the first half of the entered number
     addi $a0, $a0, 4 # possible 5 digits, sign and comma means the character can extended past the one register
     lw $t2, ($a0) #t2 is the first half of the entered number
    lui $t1, 0x1000
    addi $t0, $t1, 0
    addi $t0, $t0, 0x18 #store the second input at hex 18
    addi $t1, $0, 0
     andi $t6, $t3, 0xff

    jal loop
    add $0, $0, $0
    add $t3, $t2, $0

    add $0, $0, $0
    jal loop
    add $0, $0, $0#nooop
    addi $t6, $0, 0
    addi $t3, $0, 0
    addi $t2, $0, 0
    addi $t1, $0, 0
    addi $v0, $0, 4
    addi $a0, $a0, -60 #backto prompt
    syscall

    addi $a0, $a0, 64 #moving where the input is stored to not get holdover from previous numbers
    addi $v0, $0, 8
    syscall      # Get first input
     lw $t3, ($a0)  #t3 is the first half of the entered number
     addi $a0, $a0, 4 # possible 5 digits, sign and comma means the character can extended past the one register
     lw $t2, ($a0) #t2 is the first half of the entered number
    lui $t1, 0x1000
    addi $t0, $t1, 0
    addi $t0, $t0, 0x20 #store the second input at hex 20
    addi $t1, $0, 0
     andi $t6, $t3, 0xff

    jal loop
    add $0, $0, $0
    add $t3, $t2, $0

    add $0, $0, $0
    jal loop
    add $0, $0, $0#nooop
    addi $t6, $0, 0
    addi $t3, $0, 0
    addi $t2, $0, 0
    addi $t1, $0, 0


    add $0, $0, $0#nooop




done:	add $0, $0, $0         # End of Program.  Set breakpoint here to analyze results.
