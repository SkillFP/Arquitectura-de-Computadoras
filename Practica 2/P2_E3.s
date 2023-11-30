.data
    IMC: .double 0
    peso: .double 86.7
    altura: .double 1.73
    estado: .word 0

    anorexico: .double 18.5
    normal: .double 25.0
    teton: .double 30.0
.code
    l.d f1,peso(r0)
    l.d f2,altura(r0)
    mul.d f2,f2,f2 ;f2=altura^2

    l.d f3,anorexico(r0)
    l.d f4,normal(r0)
    l.d f5,teton(r0)

    div.d f1,f1,f2 ;f1=IMC

    c.lt.d f1,f3 ;anorexico?
    bc1f NO_anorexico
    daddi r1,r0,1
    j FIN

    NO_anorexico:
    c.le.d f1,f4 ;normal?
    bc1f NO_normal
    daddi r1,r1,2
    j FIN

    NO_normal:
    c.lt.d f1,f5
    bc1f NO_teton
    daddi r1,r1,3
    j FIN

    NO_teton: daddi r1,r1,4 ;TREMENDO GORDOLOL JAJAJAJAJ
    FIN: sd r1, estado(r0)
    s.d f1,IMC(r0)
halt
