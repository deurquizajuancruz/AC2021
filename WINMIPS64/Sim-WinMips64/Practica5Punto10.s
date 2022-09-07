.data
CAD: .asciiz "hnjs"
CANT: .word 0
.text
lbu $a0,CAD($zero)
daddi $t3,$zero,0 # desplazamiento
daddi $t4,$zero,1 #comparador
daddi $t6,$zero,0 # contador de vocales
seguir: jal ES_VOCAL
daddi $t3,$t3,1
daddi $t5,$zero,0
dsub $t5,$v0,$t4 
bnez $t5, siguiente
daddi $t6,$t6,1
siguiente: lbu $a0,CAD($t3)
slti $t7,$a0,1 
beqz $t7, seguir
sd $t6,CANT($zero) 
halt
ES_VOCAL: daddi $t0,$zero,65 # a
dsub $t1,$a0, $t0
beqz $t1, vocal
daddi $t0,$t0,4 # e
daddi $t1,$zero,0
dsub $t1,$a0, $t0
beqz $t1, vocal
daddi $t0,$t0,4 # i
daddi $t1,$zero,0
dsub $t1,$a0, $t0
beqz $t1, vocal
daddi $t0,$t0,6 # o
daddi $t1,$zero,0
dsub $t1,$a0, $t0
beqz $t1, vocal
daddi $t0,$t0,6 # u 
daddi $t1,$zero,0
dsub $t1,$a0, $t0
beqz $t1, vocal
daddi $t0,$t0,12 # A
daddi $t1,$zero,0
dsub $t1,$a0, $t0
beqz $t1, vocal
daddi $t0,$t0,4 # E
daddi $t1,$zero,0
dsub $t1,$a0, $t0
beqz $t1, vocal
daddi $t0,$t0,4 # I
daddi $t1,$zero,0
dsub $t1,$a0, $t0
beqz $t1, vocal
daddi $t0,$t0,6 # O
daddi $t1,$zero,0
dsub $t1,$a0, $t0
beqz $t1, vocal
daddi $t0,$t0,6 # U 
daddi $t1,$zero,0
dsub $t1,$a0, $t0
beqz $t1, vocal
daddi $v0,$zero,0
j fin
vocal: daddi $v0,$zero,1
fin: jr $ra