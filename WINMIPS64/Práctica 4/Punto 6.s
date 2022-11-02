; con desplazamieento
.data
A: .word 1
B: .word 1
C: .word 1
D: .word 0
desplazamiento: .word 8
.code
ld r5, desplazamiento(r0)
ld r1,A(r0)
ld r2,A(r5)
ld r3,B(r5)
ld r4,C(r5)
bne r1,r2, diferentes
daddi r4,r0,2
bne r1,r3, resultado
daddi r4,r4,1
j resultado
diferentes: beq r1,r3, sumar2
bne r2,r3, resultado
sumar2: daddi r4,r0,2
resultado: sd r4,C(r5)
halt
; sin desplazamiento
.data
A: .word 1
B: .word 4
C: .word 6
D: .word 0
.code
ld r1,A(r0)
ld r2,B(r0)
ld r3,C(r0)
ld r4,D(r0)
bne r1,r2, diferentes
daddi r4,r0,2
bne r1,r3, resultado
daddi r4,r4,1
j resultado
diferentes: beq r1,r3, sumar2
bne r2,r3, resultado
sumar2: daddi r4,r0,2
resultado: sd r4,D(r0)
halt