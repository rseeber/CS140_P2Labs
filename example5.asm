.data
    arr:    .word 1, 2, 7, 9, 12, 18
    i:      .word 0
    k:      .word 12


.text
.globl main
main:
    la $t0, arr
    lw $t1, i
    lw $t3, k

    #while (arr[i] <= k)
    loop:
    # (arr[i] > k) ? goto endloop : [nothing]
    # $t2 = &arr + i    (gets a pointer to arr[i])
    add $t2, $t0, $t1
    # $t4 = *(&arr + i)
    lw $t4, ($t2)

    # we're reusing $t4 for a different purpose here
    # $t4 = (k < $t4) ? 1 : 0;
    slt $t4, $t3, $t4

    # ($t4 != 0) ? goto endloop : [nothing]
    bne $t4, $zero, endloop

        #loop code
        # i = i + 1;
        add $t1, $t1, 4

        j loop

    endloop:
    #post-loop

    #print i
    move $a0, $t1
    li $v0, 1
    syscall

    #exit
    li $v0, 10
    syscall