.data
    prompt: .asciiz "Enter a num: "
    nega: .asciiz "Negative\n"
    pos:    .asciiz "Positive\n"
    zero: .asciiz "Zero\n"

.text
    main:
        li $v0 ,4
        la $a0 , prompt
        syscall

        li $v0 ,5
        syscall
        move $t0 ,$v0

        if:
            blez $t0 ,elseif

            li $v0 ,4
            la $a0 , pos
            syscall
            
            j endif
        elseif:
            bgez $t0 ,else

            li $v0 ,4
            la $a0 , nega
            syscall

            j endif
        else:
            li $v0 ,4
            la $a0 , zero
            syscall

            j endif
        endif:
    exit:
        li $v0, 10
        syscall