.data
    cadena: .asciiz "adbdcdedfdgdhdid"
    car: .ascii "d" ;0x64
    cant: .word 0 ;son 16, debería ser 8
.code
    dadd r4,r0,r0 ;indice
    dadd r3,r0,r0 ;cantidad
    lbu r2,car(r0) ;caracter a comparar

    sigo: lbu r1,cadena(r4) ;cargo el valor encontrado

    beqz r1,FIN ;si es 0 me voy a fin
    daddi r4,r4,1
    bne r1,r2,NO_SUMO ;pregunto si no son iguales
    nop
    daddi r3,r3,1 ;sumo

    NO_SUMO: J sigo ;entro en el loop

    FIN: sd r3,cant(r0)
halt
