.data
Name: .asciiz "Name: Rahf Ayman\n"
ID: .asciiz "ID: 123456\n"
Course: .asciiz "Course: CSE321-Computer-Organization\n"

.text
main: 
    li $v0, 4   # syscall for print name      
    la $a0, Name      
    syscall  

    li $v0, 4   # syscall for print ID 
    la $a0, ID
    syscall   

    li $v0, 4   # syscall for print Course
    la $a0, Course
    syscall 

    li $v0, 10      # syscall for exit
    syscall            