.data
cadena: .asciiz "adbdcdedfdgdhdid" # cadena a analizar
car: .asciiz "d" # caracter buscado
cant: .word 0 # cantidad de veces que se repite el caracter car en cadena
.code
lbu r1,cadena(r0) # r1 recibe el primer caracter de la cadena	
ld r2,car(r0) # r2 recibe el ascii del caracter buscado
ld r3,cant(r0) # contador del caracter
daddi r4,r0,1
daddi r5,r0,0
comparar: dsub r5,r1,r2
bnez r5, diferentes # si no da 0, son diferentes
daddi r3,r3,1
diferentes: lbu r1, cadena(r4) #avanzo en la cadena al siguiente caracter
daddi r4,r4,1
daddi r5,r0,0
bne r1,r0, comparar
sd r3,cant(r0)
halt