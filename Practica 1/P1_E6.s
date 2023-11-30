.data
 A: .word 2
 B: .word 3
 C: .word 2
 D: .word 0
.code
ld r1, A(r0)
ld r2, B(r0)
ld r3, C(r0) ;cargo datos

bne r1,r2,NO ;si r1=/=r2 no sumo 1 en r4
daddi r4,r0,1 ;sumo

NO: bne r1,r3,NO2 ;si r1=/=r3 no sumo 1 en r4
daddi r4,r4,1 ;sumo

NO2: slti r5,r4,1 ; pregunto si r4<1
bnez r5, fin
daddi r4,r4,1
fin: sd r4,D(r0)
halt
