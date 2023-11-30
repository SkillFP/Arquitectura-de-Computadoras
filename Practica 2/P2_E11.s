.data
    tabla: .word 7,2,3,8,10,12,33,1,5,0
    RES: .word 0
.code
    DADDI $sp,$0,0x400
    DADDI $a0,$0,tabla
    JAL contarImpares
    SD $v0, RES($0)
HALT

contarImpares:
    DADD $v0,$0,$0 ;resultado
    DADDI $sp,$sp,-16
    SD $ra,0($sp)
    SD $v0,8($sp)
LOOP: LD $t0,0($a0) ;$t0=elemento en $a0
      DADDI $a0,$a0,8
      BEQZ $t0, FIN

      JAL esImpar

      BEQZ $v0, NO_SUMO
      DADDI $s0,$s0,1
NO_SUMO: J LOOP

FIN: LD $ra,0($sp)
     LD $v0,8($sp)
     DADDI $sp,$sp,16
     DADDI $v0,$s0,0
jr $ra


esImpar:
    ANDI $v0,$t0,1
jr $ra
