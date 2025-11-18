# args $a0 , $a1
# return $v0 
add_func: 
add $v0 , $a0 , $a1

returnAdd:
jr $ra

main:
addi $sp , $sp , -4
sw $ra , 0($sp)

li $a0 , 20
li $a1 , 30

jal add_func

move $a0 , $v0

li $v0 , 1
syscall

returnMain:
lw $ra , 0($sp)
addi $sp , $sp , 4
jr $ra