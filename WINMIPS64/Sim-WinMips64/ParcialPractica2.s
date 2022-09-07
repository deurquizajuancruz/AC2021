.data
tabla1: .double 0,0,0,0,0,0,0,0,0,0,0,0
tabla2: .double 0,0,0,0,0,0,0,0,0,0,0,0
DATA: .word32 0x10008
CONTROL: .word 0x10000
.text
lwu $s0,DATA($zero)
lwu $s1,CONTROL($zero)
daddi $a0,$zero,8 #8 para que reciba CONTROL
daddi $a1,$zero,0 #desplazamiento
daddi $a2,$zero,96 #para comparar
jal ingreso
daddi $a3,$zero,tabla1
daddi $a1,$zero,tabla2
jal potencia
halt
ingreso: sd $a0,0($s1) # pasamos 8 a control=leer numero
         l.d f1,0($s0) # se almacena en f1 el numero leido
         s.d f1,tabla1($a1)
         daddi $a1,$a1,8
         bne $a1,$a2, ingreso
         jr $ra
potencia:   l.d f1,0($a3) #cargamos en f1 el elemento de la tabla 1
            mul.d f1,f1,f1
            s.d f1,0($a1)
            daddi $a3,$a3,8
            daddi $a1,$a1,8
            bne $a3,$a2,potencia
            jr $ra