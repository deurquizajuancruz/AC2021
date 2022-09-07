.data
M: .word 5
TABLA: .word 50,3,2,17,1,96 # 3
CANT: .word 6
MAYORES: .word 0
.text
ld $a0,M($zero)
ld $a1,TABLA($zero)
ld $a2,CANT($zero)
jal subrutina
sd $v0,MAYORES($zero)
halt
subrutina: daddi $t0,$zero,0
daddi $t1,$zero,0
comparar: slt $t0,$a0,$a1 # si el elemento de la tabla($a1) es mayor a M($a0), deja 1 en $t0
beqz $t0, siguiente # si $t0=0, significa que M era mayor al elemento de la tabla, por lo que directamente paso al siguiente 
daddi $v0,$v0,1 # sino, sumo 1 a cantidad
siguiente: daddi $t1,$t1,8
ld $a1,TABLA($t1)
daddi $a2,$a2,-1
bnez $a2, comparar
jr $ra