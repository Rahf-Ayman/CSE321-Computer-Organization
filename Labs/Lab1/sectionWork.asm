.data
hello: .asciiz "Hello, World!"

.text
main:
    li $v0, 4          # syscall for print hello label
    la $a0, hello      
    syscall            

    li $v0, 10         # syscall for exit
    syscall            