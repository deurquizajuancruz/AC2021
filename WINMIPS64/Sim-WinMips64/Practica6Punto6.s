.data
DATA: .word32 0x10008
CONTROL: .word32 0x10000
coordenadaX: .byte 0
coordenadaY: .byte 0
color: .byte 0,0,0,0
.text
lwu $s0,DATA($zero)
lwu $s1,CONTROL($zero)
daddi $t0,$zero,8
sd $t0,0($s1) #control recibe 8=ingresar num
ld $t1,0($s0) # guardo en t1 la coordenada X
sd $t0,0($s1) #control recibe 8=ingresar num
ld $t2,0($s0) # guardo en t2 la coordenada Y
sd $t1,coordenadaX($zero) #guardo en la variable coordenada X la coordenada ingresada
sd $t2,coordenadaY($zero) #guardo en la variable coordenada Y la coordenada ingresada
lbu $s3,coordenadaX($zero)
lbu $s4,coordenadaY($zero)
daddi $t1,$zero,0 #registro para hacer el desplazamiento
daddi $t2,$zero,4 #registro para comparar
lazo: sd $t0,0($s1) #control recibe 8=ingresar num
      lb $t3,0($s0) #guardo en t3 el num del color
      sb $t3,color($t1) #guardo en la variable color el num ingresado
      daddi $t1,$t1,1
      bne $t1,$t2,lazo
lwu $s2,color($zero)
sb $s3,5($s0) #paso la coordenada X a data+5
sb $s4,4($s0) #paso la coordenada Y a data+4
sw $s2,0($s0)
daddi $t1,$t1,1 #t1=5
sd $t1,0($s1) #control recibe 5=imprime grafico
halt