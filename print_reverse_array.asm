# print_array.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
	array: .word 1 2 3 4 5 6 7 8 9 10
	cout: .asciiz "The contents of the array in reverse order are:\n"

.text
printA:
    # TODO: Write your function code here
	move $s0, $a0
	sll $t3, $a1, 2 # 4*length to get address of last element
	addi $t3, $t3, -4
	add $t2, $s0, $t3
	addi $t0, $a1, -1 # represents iterator i
loop:
	blt $t0, $zero, end
	lw $a0, 0($t2)
	li $v0, 1
	syscall #prints element
	addi $t0, $t0, -1
	addi $t2, $t2, -4
	j loop
end:
	jr $ra
main:  # DO NOT MODIFY THE MAIN SECTION
	li $v0, 4
	la $a0, cout
	syscall

	la $a0, array
	li $a1, 10

	jal printA

exit:
	li $v0, 10
	syscall	# TODO: Write code to properly exit a SPIM simulation
