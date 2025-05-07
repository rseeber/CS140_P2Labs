.data

    arr:    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    sum:    .word 0
    i:      .word 0

.text
.globl main
main:
    la $t0, arr
    lw $t1, i
    li $t2, 10
    lw $t3, sum

    # $t5 = *(arr + 0)
    lw $t5, ($t0)

    #for(; i < 10; ++i)
    #or just
    #while(i < 10){
        #loop code
        # ++i;
    #}

    loop:
    # (!cond) ? goto endloop : [nothing];
    # NOT (i < 10) means (i >= 10)
    
    # $t4 = (i < 10);
    slt $t4, $t1, $t2

    # if($t4 == 0): goto endloop
    beq $t4, $zero, endloop

        #loop body
        #$t5 = *(arr + 4*i)
        mul $t6, $t1, 4    # $t6 = 4*i
        add $t5, $t0, $t6   # $t5 is a pointer to arr[i]
        lw $t5, ($t5)       # $t5 = *(arr + i)
        add $t3, $t3, $t5   # sum = sum + *(arr + i)
        
    #wrap up the loop
    # ++i;
    addi $t1, $t1, 1
    #goto loop
    j loop

    endloop:

    #print sum
    move $a0, $t3
    li $v0, 1
    syscall

    #exit
    li $v0, 10
    syscall

