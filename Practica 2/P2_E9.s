.data
    letra: .ascii "R"
    vocales: .asciiz "AEIOUaeiou"
    result: .word 0
.code
    lbu $a0,letra($0)
    jal evaluar
    sd $v0,result($0)
halt

evaluar:
    lbu $t1,0($a0)
    beqz fin

fin: jr $ra
