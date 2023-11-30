.data
    cadena1: .asciiz "HOLA"
    cadena2: .asciiz "HoLA"
    result: .word 0
.code
    daddi $a0,$zero,cadena1
    daddi $a1,$zero,cadena2
    jal COMP
    sd $v0,result($zero)
halt

COMP:
    dadd $v0,$zero,$zero
    again: lbu $t0,0($a0)
           lbu $t1,0($a1)
           beqz $t0,FIN_C1
           beqz $t1,FIN
           bne $t1,$t0, FIN
           daddi $v0,$v0,1
           daddi $a0,$a0,1
           daddi $a1,$a1,1
           J again
    FIN_C1: bnez $t1, FIN ;si t1=t0, -1, si no, 0
                 daddi $v0,$zero,-1
FIN: jr $ra

