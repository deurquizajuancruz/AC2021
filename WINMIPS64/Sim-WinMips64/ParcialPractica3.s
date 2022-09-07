.data
tabla1: .double 12.5,3.5,7.78,3.4,12.9,9.3,36.7,2.99,1.2,10.01,2.5,34.1
tabla2: .double 0,0,0,0,0,0,0,0,0,0,0 #8,5.64,5.59,8.15,11.1,23,19.845,2.095,5.605,6.255,18.3
DATA: .word32 0x10008
CONTROL: .word32 0x10000
.text
lwu $s0,DATA($zero)
lwu $s1,CONTROL($zero)
daddi $a0,$zero,tabla1 #a0= direccion de inicio tabla 1
daddi $t0,$zero,2
mtc1 $t0,f3
cvt.d.l f3,f3 #a f3 le paso 2 para hacer la division
daddi $t1,$zero,88 #11x8=88
daddi $t2,$zero,0 #desplazamiento sobre la tabla 2
daddi $t3,$zero,3
daddi $t4,$zero,184 #(96 primer tabla y 88 segunda tabla)
seguir: jal promedio
        s.d f4,tabla2($t2)
        daddi $t2,$t2,8
        bne $a0,$t1,seguir
daddi $a0,$zero,tabla2 #a0= direccion de inicio tabla 2
jal imprimir
halt
promedio:   l.d f1,0($a0)
            daddi $a0,$a0,8
            l.d f2,0($a0)
            add.d f1,f1,f2 #en f1 deja el resultado de la suma entre f1 y f2
            div.d f4,f1,f3 #divide f1 por 2(f3) y deja el resultado f4
            jr $ra
imprimir:   l.d f1,0($a0)
            s.d f1,0($s0)
            sd $t3,0($s1)
            daddi $a0,$a0,8
            bne $a0,$t4,imprimir
            jr $ra