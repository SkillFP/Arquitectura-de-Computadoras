.data
    n1: .double 3.99999
    n2: .double 0.0
.code
    l.d f1,n1(r0)
    cvt.l.d f2,f1
    s.d f2,n2(r0)
halt

