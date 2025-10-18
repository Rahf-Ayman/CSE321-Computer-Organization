.data
    firstPrompt: .asciiz "Enter numbers to get sum and 0 to end\n"
    newNum: .asciiz "   read a num: "
    res: .asciiz "  the sum: "
    newLine: .asciiz "\n"

.text
    main:
        move $t0 ,$zero

        li $v0 ,4
        la $a0 ,firstPrompt
        syscall
        do:
            li $v0 ,4
            la $a0 ,newNum
            syscall

            li $v0 ,5
            syscall
            addu $t0 ,$t0 ,$v0
            beqz $v0 , while
            j do
        while:
            li $v0 ,4
            la $a0 ,res
            syscall

            move $a0 ,$t0
            li $v0 ,1
            syscall

            li $v0 ,4
            la $a0 ,newLine
            syscall
    exit:
        li $v0, 10
        syscall