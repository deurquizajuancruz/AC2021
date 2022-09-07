.data
CARAC: .ascii "u"
RES: .word 0
.text
ld $a0,CARAC($zero)
jal ES_VOCAL
sd $v0,RES($zero)
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