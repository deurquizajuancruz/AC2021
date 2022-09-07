.data
DATA: .word32 0x10008
CONTROL: .word32 0x10000
color: .byte 255,0,255,0
coordenadaX: .byte 1
coordenadaY: .byte 2
.text
lwu $s0,DATA($zero)
lwu $s1,CONTROL($zero)
lbu $s3,coordenadaX($zero) #s3=coordenada X
lbu $s4,coordenadaY($zero) #s4=coordenada Y
lwu $s2,color($zero)
sb $s2,0($s0)
daddi $t0,$zero,5
daddi $t1,$zero,5
daddi $t2,$zero,8
daddi $t5,$zero,2
laxo:   sb $s4,4($s0)
        sb $s3,5($s0)
        sd $t0,0($s1)
noimp:  daddi $s4,$s4,1
        beq $s4,$t1,noimp
        beq $s4,$t2,seguir
        j laxo
seguir: daddi $s3,$s3,4
        daddi $s4,$zero,2
        daddi $t4,$t4,1
        beq $t4,$t5,fin
        j laxo
fin:  halt