.data.data
    cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
    car: .asciiz "d" ; caracter buscado
    cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena.

.code
    dadd r3,r0,r0 ;contador de cant
    dadd r1,r0,r0 ;registro donde se cargara la cadena
    lbu r2,car(r0) ;registro donde estara la variable a comparar
    dadd r4,r0,r0 ; registro auxiliar para recorrer la cadena
loop: lbu r1,cadena(r4)
      nop
      nop
      bne r1,r2,noIgual
      nop
      daddi r3,r3,1
      noIgual: bnez r1,loop
      daddi r4,r4,1
      sd r3,cant(r0)
halt
