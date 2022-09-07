.data
DATA: .word32 0x10008
CONTROL: .word32 0x10000
msj1: .asciiz "Ingrese un numero: "
incorrecto: .asciiz "Debe ingresar un numero"
ultimosdigitos: .word 16
CARACTER: .asciiz " \n" 
texto: .asciiz "Cantidad de valores mayores que 5: "
numerosingresado: .word 0
.text
lwu $s0,DATA($zero)
lwu $s1,CONTROL($zero)
daddi $a0,$zero,58
daddi $t1,$zero,msj1
sd $t1,0($s0)
daddi $a2,$zero,4
sd $a2,0($s1)
daddi $t2,$zero,0
daddi $t7,$zero,1
ld $s3,ultimosdigitos($zero)
lazo: 	jal ingresar_numero
		beqz $v0,lazo
		daddi $v0,$v0,-48
		sd $v0,numerosingresado($t2)
		dadd $s4,$s4,$v0
		daddi $t2,$t2,8
		slt $t6,$s4,$s3 #si la suma de los valores de la tabla< ultimos digitos t6 va a quedar en 1
		beq $t6,$t7,lazo #si t6=t7(1) tiene que seguir cargando numeros
daddi $a1,$zero,numerosingresado #a1 recibe la direccion de memoria de la tabla
daddi $t0,$zero,8
ddiv $a2,$t2,$t0 #a1 =cantidad de elementos del vector
daddi $a3,$zero,5
jal procesar_numeros
halt
ingresar_numero:    daddi $t0,$zero,49
		            daddi $t1,$zero,9
		            sd $t1,0($s1) # control recibe 9 para leer un caracter
		            lbu $v0,0($s0) #en $v0 se guarda el caracter leido
		    laxo:   dsub $t5,$v0,$t0
		            beqz $t5,numeroreal
		            daddi $t0,$t0,1
					beq $t0,$a0,nonumero
		            j laxo
numeroreal:         sb $v0,CARACTER($zero)
					daddi $a2,$zero,CARACTER
					sd $a2,0($s0)
					daddi $a2,$zero,4
					sd $a2,0($s1) #aca se imprime el caracter ingresado
					daddi $a2,$t2,numerosingresado
					sd $v0,0($a2) #v0 devuelve el ascii del numero ingresado
					j fin
	nonumero:		daddi $t4,$zero,incorrecto
					sd $t4,0($s0)
					daddi $a2,$zero,4
					sd $a2,0($s1)
					dadd $v0,$zero,$zero
	fin:			jr $ra 
procesar_numeros: 	daddi $t1,$zero,0
					daddi $t4,$zero,0
		avanzar:	ld $t0,0($a1) #en t0 se guarda el valor del vector
					slt $v1, $a3,$t0 #deja 1 en v1 si 5 es menor que el elemento
					dadd $t4,$t4,$v1 #contador de los elementos mayores a 5
					daddi $a1,$a1,8
					daddi $t1,$t1,1 #contador de los elementos
					beq $t1,$a2, termine #si el contador y la cantidad son iguales termine de recorrer el vector
					j avanzar
		termine: 	daddi $t1,$zero,texto
					sd $t1,0($s0) #data recibe el texto
					daddi $a2,$zero,4
					sd $a2,0($s1) #control imprime el texto
					sd $t4,0($s0) #paso a data el contador de elementos mayores
					daddi $a2,$zero,1
					sd $a2,0($s1) #control imprime el numero
					jr $ra