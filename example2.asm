.data
    f: .word 0
    g: .word 6
    h: .word 3
    i: .word 8
    jVar: .word 10

.text
.globl main
main:
    #load f~j into registers $t0~$t4. Call it jVar because j is a command and it gets upset at that.
    lw $t0, f
    lw $t1, g
    lw $t2, h
    lw $t3, i
    lw $t4, jVar

    #if (i >= j): false
        #true code
        #goto endif
    #false:
        #false code
    #endif:
    #post-branch code

    #save the difference, diff = i - j
    #if diff >= 0, then i >= j is true.
    sub $t5, $t3, $t4
    bgez $t5, false         #if(i >= j): goto false
        #f = g + h
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