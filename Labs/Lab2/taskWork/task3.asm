.data
    firstPrompt: .asciiz "Enter a number: "
    prompt1: .asciiz "The num is one"
    prompt2: .asciiz "The num is two"
    prompt3: .asciiz "The num is three"
    prompt4: .asciiz "Others"
    newLine: .asciiz "\n"
.text
    main:
        li $v0 ,4
        la $a0 , firstPrompt
        syscall

        li $v0 ,5
        syscall
        move $t0 ,$v0

        li $t1 ,1
        li $t2 ,2
        li $t3 ,3
        switch:
            beq $t0 , $t1, case1
            beq $t0 , $t2 ,case2
            beq $t0 , $t3 ,case3
            j default
            case1:
                li $v0 ,4
                la $a0 , prompt1
                syscall
                j endSwitch
            case2:
                li $v0 ,4
                la $a0 , prompt2
                syscall
                j endSwitch
            case3:
                li $v0 ,4
                la $a0 , prompt3
                syscall
                j endSwitch
            default:
                li $v0 ,4
                la $a0 , prompt4
                syscall            
        endSwitch:
            li $v0 ,4
            la $a0 , newLine
            syscall
    exit:
        li $v0 ,10
        syscall