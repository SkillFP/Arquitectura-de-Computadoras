.data
    ;programa que calcule la potencia "x"
    ;de un número "n" por medio de una subrutina.
    X: .word 3
    N: .word 2
    R: .word 0
.code
    ld $a0, X($zero) ;a2=2
    ld $a1, N($zero) ;a1=3
    jal potencia     ;potencia=9
    sd $v0,R($zero)
halt

    potencia:
        daddi $v0, $zero, 1
        again: beqz $a1, terminar
        dmul $v0, $v0, $a0
        daddi $a1, $a1, -1
        J again
    terminar: jr $ra
