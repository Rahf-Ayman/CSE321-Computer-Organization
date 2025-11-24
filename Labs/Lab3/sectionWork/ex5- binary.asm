bin:
    li $t0 ,1
    li $t1 ,8 # print num in 8 bits
    move $t3 ,$a0
    li $v0 ,1
    for:
        beqz $t1 , retrurnBin

        addi $t1 ,$t1 ,-1

        sllv $t2 ,$t0 , $t1 # mask in $t2

        and $a0 , $t3, $t2 # $a0 hold $t2_th bit
        
        if:
            beqz $a0 , else

            li $a0 , 1
            syscall

            j endIf
        else:
            syscall

        endIf:

        j for

retrurnBin:
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