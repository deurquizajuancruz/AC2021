.data
A: .word 5
X: .word 7
Y: .word 3
RES: .word 0
.code
ld r1,A(r0)
ld r2,X(r0)
ld r3,Y(r0)
laxo: daddi r1,r1,-1
bnez r1,laxo
dadd r2,r2,r3
sd r2,RES(r0)
halt