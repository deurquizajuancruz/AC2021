.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
MENSAJE: .asciiz " Ingrese una clave de 4 caracteres: "
CLAVE: .asciiz "HOLA"
CORRECTO: .asciiz " Bienvenido"
INCORRECTO: .asciiz " ERROR"
INGRESADO: .asciiz ""
CHAR: .asciiz ""
.text
lwu $s0,DATA($zero)
lwu $s1,CONTROL($zero)
volver: daddi $t5,$zero,MENSAJE
sd $t5,0($s0)
daddi $t2,$zero,4
sd $t2,0($s1)
daddi $t0,$zero,4
daddi $t1,$zero,0
loop: jal char
sb $v0,INGRESADO($t1)
daddi $t1,$t1,1
daddi $t0,$t0,-1
bnez $t0, loop
ld $t0,CLAVE($zero)
ld $t1,INGRESADO($zero)
dsub $a0,$t0,$t1
jal respuesta
beqz $v0,volver
halt

char: daddi $t2,$zero,9
sd $t2,0($s1) # CONTROL recibe 9= lectura de un caracter
ld $t3,0($s0) # se guarda en t3 el caracter ingresado traido de DATA
sd $t3,CHAR($zero) # guardo en CHAR el caracter ingresado
daddi $t3,$zero,CHAR 
sd $t3,0($s0)
daddi $t2,$zero,4
sd $t2,0($s1) # CONTROL recibe 4= imprime el caracter ingresado
ld $v0,CHAR($zero)
jr $ra

respuesta: daddi $t0,$zero,4
beqz $a0, iguales
daddi $t1,$zero,INCORRECTO
sd $t1,0($s0) # Subo a DATA el mensaje de ERROR
sd $t0,0($s1) # CONTROL recibe 4=imprime el caracter ingresado
daddi $v0,$zero,0
j fin
iguales: daddi $t1,$zero,CORRECTO
sd $t1,0($s0) # Subo a DATA el mensaje de bienvenida
sd $t0,0($s1) #CONTROL recibe 4=imprime el caracter ingresado
daddi $v0,$zero,1
fin: jr $ra