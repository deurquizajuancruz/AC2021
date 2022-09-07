.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
texto: .asciiz "Ingrese el mensaje: "
mensaje: .asciiz ""
.text
lwu $s0, DATA($zero)
lwu $s1, CONTROL($zero)
daddi $t0,$zero,48 # 48 en decimal=0 en ASCII
daddi $t2,$zero,texto # t2 recibe el texto
sd $t2,0($s0) # DATA recibe el texto
daddi $t2,$zero,4 # t2 recibe 4
sd $t2,0($s1) #CONTROL recibe 4=imprime cadena
loop: daddi $t2,$zero,9 # 9= entrada de un caracter
sd $t2,0($s1) # CONTROL recibe 9 = se lee un caracter y se guarda en DATA
ld $t3,0($s0) # se lee de DATA el caracter y se guarda en t3
sd $t3,mensaje($zero) # se guarda el caracter la variable mensaje
daddi $t2,$zero,mensaje # t2= direccion caracter a mostrar
sd $t2,0($s0) # data recibe el caracter
daddi $t2,$zero,4 # t2 recibe 4
sd $t2,0($s1) # CONTROL recibe 4=imprime
daddi $t4,$zero,0
dsub $t4,$t3,$t0 #resto el codigo ascii del caracter - el codigo ascii de 0
bnez $t4, loop # si la resta no da 0, es xque el caracter no es 0, sigo imprimiendo
halt