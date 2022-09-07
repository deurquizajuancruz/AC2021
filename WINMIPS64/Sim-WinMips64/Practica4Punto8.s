.data
A: .word 2
B: .word 10
C: .word 0
.code
ld r1,A(r0)
ld r2,B(r0)
ld r3,C(r0)
sumar: dadd r3,r3,r1
daddi r2,r2,-1
bnez r2, sumar
nop
sd r3,C(r0)
halt