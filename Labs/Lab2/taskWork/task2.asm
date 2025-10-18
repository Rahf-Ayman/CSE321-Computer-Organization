.data
    firstPrompt: .asciiz "Enter n numbers to get average\n"
    firstNumPrompt: .asciiz "   read n: "
    NumPrompt: .asciiz "   read num: "
    resultPrompt: .asciiz "   the result is: "
    quotientPrompt: .asciiz "      quotient: "
    remainderPrompt: .asciiz "      remainder: "
    newLine: .asciiz "\n" 
.text
    main:
        li $v0, 4
        la $a0, firstPrompt
        syscall

        li $v0, 4
        la $a0, firstNumPrompt
        syscall

        li $v0, 5
        syscall
        move $t0 ,$v0

        li $t1 ,1

        move $t2 , $zero
        for:
            bgt $t1 ,$t0, endFor

            li $v0, 4
            la $a0, NumPrompt
            syscall

            li $v0, 5
            syscall

            addu $t2, $t2, $v0
            addiu $t1, $t1 ,1
            j for
        endFor:
            divu $t2 ,$t0
            mflo $s0
            mfhi $s1

            li $v0, 4
            la $a0, resultPrompt
            syscall

            li $v0, 4
            la $a0, newLine
            syscall

            li $v0, 4
            la $a0, quotientPrompt
            syscall
            move $a0 ,$s0
            li $v0,1
            syscall

            li $v0, 4
            la $a0, remainderPrompt
            syscall
            move $a0 ,$s1
            li $v0,1
            syscall

            li $v0, 4
            la $a0, newLine
            syscall
    exit:
        li $v0 ,10
        syscall