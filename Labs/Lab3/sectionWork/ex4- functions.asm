.data
x: .word 5
y: .word 12

.text
multFunc:
    mul $v0 ,$a0 ,$a1

returnmult:
    jr $ra

main:
# arg
    # la $s0, x
    # or
    li $s0 , 0x10010000 # start address in user data seq

    lw $a0,0 ($s0)
    lw $a1,4 ($s0)

# caller save 
    addi $sp ,$sp , -4
    sw $ra, 0($sp)

# calling func
    jal multFunc

# restore reg
    lw $ra, 0($sp)
    addi $sp, $sp ,4

    move $a0 ,$v0

    li $v0 ,1
    syscall	
    
returnMain:
    jr $ra