.data

failMsg:    .asciiz "Test case failed!!\n\n"
passMsg:    .asciiz "Test case passed!!\n\n"

excpected:  .asciiz "\tExcepected =\t"
result:     .asciiz "\tResult =\t\t"

newLine:    .asciiz "\n"

test1:   .asciiz "Test fib(0)\n"
test2:   .asciiz "Test fib(1)\n"
test3:   .asciiz "Test fib(2)\n"
test4:   .asciiz "Test fib(3)\n"
test5:   .asciiz "Test fib(4)\n"
test6:   .asciiz "Test fib(5)\n"
test7:   .asciiz "Test fib(6)\n"

.text

#=====================================================
# Fibonacci Function
#   Parameters: $a0 -> n
#   Return:     $v0 -> fib(n)
#=====================================================
fib:
    # TODO: Your implementation
    # $t0 arr len (byte)
    # $t3 base address arr
    # $t1 counter
    li $t0 , 2
    blt $a0 , $t0 ,fib0or1

    li $t0, 4
    addi $a0 , $a0 , 1 # a0 = n + 1
    mult $a0 , $t0
    mflo $t0 
    sub $sp ,$sp ,$t0
    move $t3 , $sp

    li $t1 ,0
    sw $t1 , 0($t3) # arr[0] = 0
    li $t1 ,1
    sw $t1 , 4($t3) # arr[1] = 1
    
    li $t1 ,2
    li $t4 , 4
    for:
        bge $t1 , $a0 , endFib
        addi $t2 , $t1 , -1
        mult $t2 , $t4
        mflo $t2
        add $t2 ,$t2 , $t3
        lw $t2 , 0($t2) # arr[i - 1]

        addi $t5, $t1 , -2
        mult $t5 , $t4
        mflo $t5
        add $t5 ,$t5 , $t3
        lw $t5 , 0($t5) # arr[i - 2]

        add $t5 , $t5 , $t2 # arr[i] = arr[i - 1] + arr[i - 2]
        
        mult $t1 , $t4
        mflo $t6
        add $t6 ,$t6 , $t3
        sw $t5 , 0($t6)

        addi $t1 , $t1 ,1
        j for

    fib0or1:
    add $v0 , $a0,$zero
    jr $ra

endFib:
    move $v0 , $t5
    add $sp , $sp ,$t0
    jr $ra

main:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    # ========= test fib(0) =========
    li $a0, 0
    jal fib

    li $a0, 0
    move $a1, $v0
    la $a2, test1
    jal assertNotEqual


    # ========= test fib(1) =========
    li $a0, 1
    jal fib

    li $a0, 1
    move $a1, $v0
    la $a2, test2
    jal assertNotEqual

    # ========= test fib(2) =========
    li $a0, 2
    jal fib

    li $a0, 1
    move $a1, $v0
    la $a2, test3
    jal assertNotEqual

    # ========= test fib(3) =========
    li $a0, 3
    jal fib

    li $a0, 2
    move $a1, $v0
    la $a2, test4
    jal assertNotEqual

    # ========= test fib(4) =========
    li $a0, 4
    jal fib

    li $a0, 3
    move $a1, $v0
    la $a2, test5
    jal assertNotEqual

    # ========= test fib(5) =========
    li $a0, 5
    jal fib

    li $a0, 5
    move $a1, $v0
    la $a2, test6
    jal assertNotEqual

    # ========= test fib(6) =========
    li $a0, 6
    jal fib

    li $a0, 8
    move $a1, $v0
    la $a2, test7
    jal assertNotEqual


    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra


#================================================================================
# assertNotEqual
#   Parameters: $a0 -> expected, $a1 -> result, $a2 -> testNumberMsg
#   Return:     ----
#================================================================================
assertNotEqual:

    move $t0, $a0
    
    li $v0, 4
    move $a0, $a2
    syscall

    la $a0, excpected
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, newLine
    syscall

    la $a0, result
    syscall

    li $v0, 1
    move $a0, $a1
    syscall

    li $v0, 4
    la $a0, newLine
    syscall

    bne $t0, $a1, printFail

    la $a0, passMsg
    syscall

    j return

printFail:
    la $a0, failMsg
    syscall

return:
    jr $ra