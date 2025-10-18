.data
    firstPrompt: .asciiz "Enter a number to get sum from 1 to it: "
    res: .asciiz "  the sum: "
    newLine: .asciiz "\n"

.text
    main:
        li $v0 ,4
        la $a0 ,firstPrompt
        syscall

        li $v0 ,5
        syscall

        li $t0 ,1
        move $t1 ,$v0
        move $t3 , $zero

        for:
            bgt $t0 ,$t1 , endFor

            addu $t3, $t3, $t0
            addiu $t0,$t0 , 1

            j for
        endFor:
            li $v0 ,4
            la $a0 ,res
            syscall

            move $a0 ,$t3
            li $v0 ,1
            syscall

            li $v0 ,4
            la $a0 ,newLine
            syscall
    exit:
        li $v0, 10
        syscall