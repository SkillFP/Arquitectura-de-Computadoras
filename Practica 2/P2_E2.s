.data
    base: .double 5.85
    altura: .double 13.47
    dos: .word 2
    res: .double 0
.code
    ld r1,dos(r0)
    l.d f1,base(r0)
    l.d f2,altura(r0)

    mtc1 r1, f3
    cvt.d.l f3,f3

    mul.d f1,f1,f2
    div.d f1,f1,f3

    s.d f1,res(r0)
halt

