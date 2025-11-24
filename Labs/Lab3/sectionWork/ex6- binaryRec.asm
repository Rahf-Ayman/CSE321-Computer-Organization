bin:
    li $t0 ,2
    addi $sp, $sp , -4
    sw $ra ,0 ($sp)

    div $a0 ,$t0
    mflo $a0
    mfhi $t1

    addi $sp , $sp , -4
    sw $t1 ,0 ($sp)

    beqz $a0 , retrurnBin

    jal bin

retrurnBin:
    lw $t1, 0 ($sp)
    addi $sp ,$sp ,4

    move $a0 ,$t1
    li $v0 ,1
    syscall

    lw $ra ,0 ($sp)
    addi $sp ,$sp ,4
    jr $ra

main:
    li $a0 , 12

    addi $sp, $sp , -4
    sw $ra ,0 ($sp)

    jal bin

    lw $ra ,0 ($sp)
    addi $sp ,$sp ,4

returnMain:
    jr $ra