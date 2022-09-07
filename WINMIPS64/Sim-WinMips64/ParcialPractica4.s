.data
DATA: .word32 0x10008
CONTROL: .word32 0x10000
color: .byte 0,255,0,0
base: .byte 0
altura: .byte 0
msj1: .asciiz "Base: "
msj2: .asciiz "Altura: "
.text
lwu $s0,DATA($zero)
lwu $s1,CONTROL($zero)
daddi $s3,$zero,msj1
sd $s3,0($s0)
daddi $t5,$zero,4
sd $t5,0($s1)
daddi $a0,$zero,8
jal ingreso
sd $v0,base($zero)
daddi $s3,$zero,msj2
sd $s3,0($s0)
sd $t5,0($s1)
jal ingreso
sd $v0,altura($zero)
daddi $a0,$zero,5 #coordenada X
daddi $a1,$zero,5 #para control
daddi $a2,$zero,5 #coordenada Y
lwu $a3,color($zero) #color
ld $t0,altura($zero) #le paso a t0 la altura
daddi $t3,$zero,0 #contador de lados
daddi $t4,$zero,2
lado:   jal imprimir
        daddi $t0,$t0,-1
        beqz $t0,seguir #si la altura=0, termino ese lado
        daddi $a0,$a0,1
        j lado
seguir: daddi $t3,$t3,1 #sumo un lado
daddi $a0,$zero,5
ld $t1,base($zero)
dadd $a2,$a2,$t1
daddi $a2,$a2,-1
ld $t0,altura($zero) #le paso a t0 la altura
beq $t4,$t3, saltar
j lado
saltar: daddi $t3,$zero,0 #reseteo contador de lados
ld $t0,base($zero)
daddi $a0,$zero,5 #coordenada X
daddi $a2,$zero,5 #coordenada Y
lab:    jal imprimir
        daddi $t0,$t0,-1
        beqz $t0,otro #si la base=0, termino ese lado
        daddi $a2,$a2,1
        j lab
otro: daddi $t3,$t3,1
daddi $a2,$zero,5
ld $t1,altura($zero)
dadd $a0,$a0,$t1
daddi $a0,$a0,-1
ld $t0,base($zero)
beq $t4,$t3,fin
j lab
fin: halt
ingreso:    sd $a0,0($s1) #le paso 8 a control=leer numero
            ld $v0,0($s0) #guardo en t1 el numero leido
            jr $ra
imprimir:   sb $a0,4($s0) #paso la coordenada X
            sb $a2,5($s0) #paso la coordenada Y
            sw $a3,0($s0) #paso el color
            sd $a1,0($s1) #le paso a control 5 para imprimir
            jr $ra