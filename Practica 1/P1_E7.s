.data
    TABLA: .word 33,5,93,46,55,35,51,56,39,69
    X: .word 52
    CANT: .word 0
    RES: .word 0,0,0,0,0,0,0,0,0,0
.code
    ld r2,X(r0) ;VALOR X EN r2.
    ld r6,RES(r0)
    daddi r3,r0,10 ;r3=contador
    dadd r5,r0,r0
    dadd r4,r0,r0

    loop: ld r1,TABLA(r5)
    dsub r7,r2,r1
    slti r7,r7,0 ;si da -1 o -, es mayor.
    beqz r7,NO_SUMAR
    daddi r3,r3,-1
    daddi r4,r4,1
    NO_SUMAR: sd r7,RES(r5)

    bnez r3,loop
    daddi r5,r5,8 ;
    sd r4,CANT(r0)
    halt
