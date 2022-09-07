.data
TABLA: .word 2,8,6,4,12,0
CANTI: .word 0
.text
ld $a0,TABLA($zero)
ld $t3,CANTI($zero)
daddi $t1,$zero,0
seguir: jal es_impar
daddi $t2,$zero,0
slti $t2, $v0,1 # si v0<1, significa que v0=0 --> el numero es impar y pone t2 en 0
beqz $t2, nosumar
daddi $t3,$t3,1
nosumar: daddi $t1,$t1,8
ld $a0,TABLA($t1)
daddi $t4,$zero,0
slti $t4,$a0,1 # si a0<1, es porque a0=0 --> termino la tabla y pongo t4 en 1
beqz $t4, seguir
sd $t3,CANTI($zero)
halt
es_impar: andi $t0,$a0,1
bnez $t0, impar
daddi $v0,$zero,1
j fin
impar: daddi $v0,$zero,0
fin: jr $ra