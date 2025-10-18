.data
    firstPrompt: .asciiz "Enter four numbers to get average:\n"
    firstNumPrompt: .asciiz "   read the 1st num: "
    secondNumPrompt: .asciiz "   read the 2nd num: "
    thirdNumPrompt: .asciiz "   read the 3rd num: "
    fourthNumPrompt: .asciiz "   read the 4th num: "
    resultPrompt: .asciiz "   the result is: "
    quotientPrompt: .asciiz "      quotient: "
    remainderPrompt: .asciiz "      remainder: "
    newLine: .asciiz "\n"
.text
    main:
        li $v0 ,4  # print prompt
        la $a0 ,firstPrompt
        syscall

        li $v0 ,4  # print prompt & read a num
        la $a0 ,firstNumPrompt
        syscall
        li $v0 ,5
        syscall
        move $t0 ,$v0

        li $v0 ,4  # print prompt & read a num
        la $a0 ,secondNumPrompt
        syscall
        li $v0 ,5
        syscall
        move $t1 ,$v0

        li $v0 ,4  # print prompt & read a num
        la $a0 ,thirdNumPrompt
        syscall
        li $v0 ,5
        syscall
        move $t2 ,$v0

        li $v0 ,4  # print prompt & read a num
        la $a0 ,fourthNumPrompt
        syscall
        li $v0 ,5
        syscall
        move $t3 ,$v0

        addu $t4 ,$t0 ,$t1  # calculate the avg and store remainder and quotient
        addu $t5 ,$t2 ,$t3
        addu $t6 ,$t4 ,$t5
        li $t7 ,4
        divu $t6 ,$t7
        mflo $s0
        mfhi $s1

        li $v0 ,4  # print prompt
        la $a0 ,resultPrompt
        syscall

        li $v0 ,4  # print prompt & qoutient res
        la $a0 ,quotientPrompt
        syscall
        move $a0 ,$s0
        li $v0, 1
        syscall

        li $v0 ,4  # print prompt & remainder res
        la $a0 ,remainderPrompt
        syscall
        move $a0 ,$s1
        li $v0, 1
        syscall

        li $v0 ,4  # print new line
        la $a0 ,newLine
        syscall

    exit:
        li $v0 ,10
        syscall