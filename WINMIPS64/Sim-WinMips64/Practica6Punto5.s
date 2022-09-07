.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
BASE: .double 0
EXPONENTE: .word 0
MSJ1: .asciiz "Ingrese la base en punto flotante: "
MSJ2: .asciiz "Ingrese la base en punto fijo: "
.text
lwu $s0,DATA($zero)
lwu $s1,CONTROL($zero)
daddi $t0,$zero,MSJ1
sd $t0,0($s0) # Le paso el MSJ1 a DATA
daddi $t1,$zero,4
sd $t1,0($s1) # Le paso 4 a CONTROL = Imprime
daddi $t2,$zero,8
sd $t2,0($s1) # Le paso 8 a CONTROL = ingreso de N° en punto fijo / flotante
l.d f1,0($s0) # Le paso a f1 el n° leido desde DATA
mfc1 $a1,f1
daddi $t0,$zero,MSJ2
sd $t0,0($s0) # Le paso el MSJ2 a DATA
sd $t1,0($s1) # Le paso 4 a CONTROL = Imprime
sd $t2,0($s1) # Le paso 8 a CONTROL = ingreso de N° en punto fijo / flotante
ld $a0,0($s0) # Le paso a a0 el n° leido desde DATA
jal a_la_potencia

halt

a_la_potencia: beqz $a0,uno
mtc1 $a1,f3
daddi $t3,$zero,1
mtc1 $t3,f2
cvt.d.l f2,f2
loop: mul.d f2,f2,f3
daddi $a0,$a0,-1
bnez $a0,loop
j fin
uno: daddi $t3,$zero,1
mtc1 $t3,f2
cvt.d.l f2,f2
fin: jr $ra