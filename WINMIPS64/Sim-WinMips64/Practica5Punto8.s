.data
CAD1: .asciiz "ABCDe"
CAD2: .asciiz "ABCD"
POS: .word 0
.text
lbu $a0,CAD1($zero)
lbu $a1,CAD2($zero)
jal subrutina
sd $v0,POS($zero)
halt
subrutina: daddi $t0,$zero,0 # resta
daddi $t1,$zero,1 # posicion
daddi $t2,$zero,0 # desplazamiento
daddi $t4,$zero,0
comparar: dsubu $t0,$a0,$a1
bnez $t0, termino
daddi $v0,$zero,-1
slti $t4,$a0,1 # pregunta si la primer cadena termino: si a0<1 entonces deja 1 en t4
bnez $t4, fin # si t4<>0 es porque vale 1, por lo que la cadena ya llego a 0
slti $t4,$a1,1 # pregunta si la segunda cadena termino
bnez $t4, fin
daddi $t2,$t2,1
lbu $a0,CAD1($t2)
lbu $a1,CAD2($t2)
daddi $t1,$t1,1
j comparar
termino: daddi $v0, $t1,0 # si las cadenas son diferentes, le paso a v0 la posicion en la q difieren
fin: jr $ra