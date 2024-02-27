# conversion.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
    li $s0, 0 #represents z
    li $t0, 0 #represents i

loop:
    bge $t0, 8, end
    sll $t2, $a0, 3
    sub $t3, $s0, $t2
    add $s0, $t3, $a1
    blt $a0, 2, increment
    addi $a1, $a1, -1
increment:
    addi $a0, $a0, 1
    addi $t0, $t0, 1
    j loop
end:
    move $v0, $s0
    jr $ra 
	
main:  # DO NOT MODIFY THE MAIN SECTION
    li $a0, 5
    li $a1, 7

    jal conv

    move $a0, $v0
    li $v0, 1
    syscall

exit:
   li $v0, 10
   syscall
	# TODO: Write code to properly exit a SPIM simulation
