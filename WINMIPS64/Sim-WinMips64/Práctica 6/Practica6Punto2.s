.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
NUMEROS: .asciiz " CERO"
         .asciiz " UNO"
         .asciiz " DOS"
         .asciiz " TRES"
         .asciiz " CUATRO"
         .asciiz " CINCO"
         .asciiz " SEIS"
         .asciiz " SIETE"
         .asciiz " OCHO"
         .asciiz " NUEVE"
MENSAJE: .asciiz "Ingrese un numero de un digito: "
NUM: .word 0

.text
lwu $s0,DATA($zero)
lwu $s1,CONTROL($zero)
jal ingreso
jal muestra

halt

ingreso: daddi $t0,$zero,MENSAJE #t0 recibe el mensaje
sd $t0,0($s0) # DATA recibe el mensaje
daddi $t0,$zero,4
sd $t0,0($s1) #CONTROL recibe 4= imprimir cadena de DATA
daddi $t0,$zero,9
sd $t0,0($s1) # CONTROL recibe 9= lectura de un caracter
ld $t1,0($s0) # se guarda en t1 el caracter ingresado traido de DATA
sd $t1,NUM($zero) # guardo en NUM el caracter ingresado
daddi $t1,$zero,NUM 
sd $t1,0($s0)
daddi $t0,$zero,4
sd $t0,0($s1) # CONTROL recibe 4= imprime el caracter ingresado
daddi $t0,$zero,48 # en t0 pongo el codigo ASCII de 0
daddi $t4,$zero,58 #codigo ASCII del siguiente al 9
ld $t1,NUM($zero) # en t1 esta el numero ingresado
loop: dsub $t3,$t1,$t0 #t3= t1-t0 
beqz $t3,fin #si esa resta da 0 = el numero ingresado es valido
daddi $t0,$t0,1 # sino, paso al siguiente caracter
beq $t0,$t4, novalido
j loop
fin: dadd $v0,$zero,$t1
novalido: jr $ra

muestra: daddi $t0,$zero,48 # codigo ASCII de 0
dsub $t1,$v0,$t0 # me quedo con el numero solo, no con el ASCII
daddi $t2,$zero,8
dmul $t3,$t1,$t2 # 8 x numero = cantidad de deplazamientos
daddi $t0,$t3,NUMEROS #t0 = t1(cantidad de desplazamientos) + la cadena de NUMEROS
sd $t0,0($s0) # cargo el mensaje a imprimir en DATA
daddi $t2,$zero,4
sd $t2,0($s1)
jr $ra