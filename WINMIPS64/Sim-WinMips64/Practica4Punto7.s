.data
TABLA: .word 19,4,9,25,14,73,6,11,8,2 # 1001110100
x: .word 10
cant: .word 0
RES: .word 0
.text
ld r1, TABLA(r0) #le paso a r1 el primer elemento de la tabla
ld r2,x(r0) # le paso a r2 x
ld r3,cant(r0) # le paso a r3 el contabilizador de numeros mayores a x
daddi r6,r6,10 # cantidad de elementos que tiene la tabla
daddi r7,r0,0 # le paso 0 a r7 para ir desplazandome sobre la tabla
preguntar: slt r5,r2,r1 # si r1(elemento de la tabla)>r2(x), r5=1
beqz r5, tablamenor # si r5=0, significa que el elemento de la tabla<x
daddi r3,r3,1 # si r5<>0, sumo uno a cantidad 
tablamenor: sd r5,RES(r7) # subo el 1/0 a RES desplazado con r7
daddi r7,r7,8 # sumo 8 para desplazarme a la proxima direccion de memoria
daddi r6,r6,-1 # le resto 1 a r6 que cuenta los elementos
ld r1,TABLA(r7)
bnez r6,preguntar #si r6<>0, vuelvo a preguntar
halt # si r6=0, termina el programa