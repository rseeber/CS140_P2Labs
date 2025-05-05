.data
    f: .word 0
    g: .word 6
    h: .word 3
    i: .word 11

.text
.globl main
main:
    #load f~j into registers $t0~$t4. Call it jVar because j is a command and it gets upset at that.
    lw $t0, f
    lw $t1, g
    lw $t2, h
    lw $t3, i

    #if(i >= 10): false
    sub $t5, $t3, 10
    bgez $t5, false
        #f = g + h;
        add $t0, $t1, $t2
        #goto endif
        j endif

    false:
        #f = g - h
        sub $t0, $t1, $t2
    
    endif:
    #print f
    move $a0, $t0
    li $v0, 1
    syscall

    #exit
    li $v0, 10
    syscall
