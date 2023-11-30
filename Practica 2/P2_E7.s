.data
    M: .word 15
    ARRAY: .word 1,32,44,53,12,87,45,65,2,42,98
    CANT: .word 11
.code
    daddi $a0,$zero,CANT ;$a0=dirCANT
    daddi $a1,$zero,ARRAY ;$a1=dirARRAY
    jal contar
    nop
halt

contar:
    ld $t2,M($zero) ;$t2=M(15)
    daddi $v0,$zero,0 ;$v0=cantidad>M=0
    dadd $t0,$zero,$zero
    again: ld $t1,0($a1)
    beqz $a0,FIN
    dsub $t3,$t2,$t1
    daddi $a1,$a1,8 ;muevo al sig
    daddi $a0,$a0,-1
    slti $t4,$t3,0
    beqz $t4,again
    daddi $v0,$v0,1
    J again
FIN: jr $ra



