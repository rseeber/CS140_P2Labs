.data
    arr:    .word 1, 2, 3, 4, 5
    N:      .word 20
    sum:    .word 0
    i:      .word 0
    step:   .word 4

.text
.globl main
main:
    la, $t0, arr
    lw $t1, sum
    lw $t2, N
    lw $t3, i
    lw $t4, step

    # $t7 = $t0
    move $t7, $t0

    loop:
        #take the pointer to arr[i], convert to a value in a reg
        # $t8 = *$t7
        lw $t8, ($t7)
        #sum = sum + *(arr + i)
        add $t1, $t1, $t8
        # i = i + step
        add $t3, $t3, $t4
        # $t7 = &arr + i
        add $t7, $t0, $t3
        # while(i != N): goto loop
        bne $t3, $t2, loop
    
    #print sum
    move $a0, $t1
    li $v0, 1
    syscall

    #exit
    li $v0, 10
    syscall
