.data
peso: .double 81.25
estatura: .double 1.75
IMC: .double 0
estado: .word 0
infrapeso: .double 18.5
normal: .double 25
sobrepeso: .double 30
.code
l.d f1,peso(r0)
l.d f2,estatura(r0)
l.d f3,IMC(r0)
ld r1,estado(r0)
l.d f4,infrapeso(r0)
l.d f5,normal(r0)
l.d f6,sobrepeso(r0)
mul.d f2,f2,f2 # eleva al cuadrado la estatura y la deja en f2
div.d f3,f1,f2 # divide el peso por la estatura y lo deja en f3, IMC=f3
c.lt.d f3,f4   # compara el IMC con el infrapeso
bc1t infra # si IMC<18.5, es infrapeso y salta a esa direccion
c.lt.d f3,f5 # compara el IMC con el normal
bc1t norm # si IMC<25, es normal y salta a esa direccion
c.lt.d f3,f6 # compara el IMC con sobrepeso
bc1t sobre # si IMC<30, es sobrepeso y salta a esa direccion
daddi r1,r0,4 # si no es ninguna de esas, es el estado 4 (obesidad)
j mover
infra: daddi r1,r0,1
j mover
norm: daddi r1,r0,2
j mover
sobre: daddi r1,r0,3
mover: sd r1,estado(r0)
halt
