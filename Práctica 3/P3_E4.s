.data
    COD_FALSE: .asciiz "ERROR"
    COD_TRUE: .asciiz "Bienvenido!"
    DATA: .word 0x10008
    CONTROL: .word 0x10000
    long: .word 4
    clave: .asciiz "tuki"
    escrita: .asciiz "...."
.code
    ld $s7,DATA($0)
    ld $s6,CONTROL($0)
    dadd $a0,$0,$0
leer: JAL Char
    daddi $a0,$a0,1
    slti $s2,$a0,4
    BNEZ $s2,leer
    JAL Comparar
    JAL Respuesta
halt

Char:
    daddi $t1,$0,9
    sd $t1,0($s6)

    lbu $t2,0($s7)
    sb $t2,escrita($a0)
jr $ra

Comparar: dadd $v0,$0,$0

     dadd $t0,$0,$0
sig: lbu $t1,escrita($t0) ;CARGO
     lbu $t2,clave($t0)

    daddi $t0,$t0,1 ;sumo despl
    BEQZ $t1, TRUE
    BNE $t1,$t2,FALSE ; si son diff me voy
    J sig
TRUE: daddi $v0,$0,1
FALSE: jr $ra


Respuesta:
    BEQZ $v0, PRT_FALSE
    daddi $t1,$0,COD_TRUE
    sd $t1,0($s7)
    daddi $t2,$0,4
    sd $t2,0($s6)
    J VOLVER
PRT_FALSE: daddi $t1,$0,COD_FALSE
           sd $t1,0($s7)
           daddi $t2,$0,4
           sd $t2,0($s6)
VOLVER: jr $ra


