.data
    firstPrompt: .asciiz "Enter two numbers to add: \n"
    readFirstNumPrombet: .asciiz  "   read the first num: "
    readSecondNumPrombet: .asciiz "   read the second num: "
    resultPrompt: .asciiz "   the result is: "
    newLine: .asciiz "\n"

.text
    main:
        li $v0 , 4
        la $a0 , firstPrompt
        syscall

        li $v0 , 4
        la $a0 , readFirstNumPrombet
        syscall 

        li $v0 , 5
        syscall

        move $t0 ,$v0

        li $v0 , 4
        la $a0 , readSecondNumPrombet
        syscall 

        li $v0 , 5
        syscall

        move $t1 ,$v0

        addu $t3 ,$t1 ,$t0

        li $v0 , 4
        la $a0 , resultPrompt
        syscall

        move $a0 ,$t3

        li $v0 ,1
        syscall

        li $v0 , 4
        la $a0 , newLine
        syscall
        
    exit:
        li $v0, 10
        syscall
