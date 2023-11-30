.data
valor: .word 4
result: .word 0

.text
daddi $sp, $zero, 0x400
ld $a0, valor($zero)
jal factorial
sd $v0, result($zero)
halt

factorial: daddi $sp,$sp,-16
           sd $ra,0($sp)
           sd $s0,8($sp)
           beqz $a0,stop
           dadd $s0,$0,$a0
           daddi $a0,$a0,-1
           JAL factorial
           dmul $v0,$v0,$s0
           J fin
           stop: daddi $v0,$0,1
           fin: ld $s0,8($sp)
                ld $ra,0($sp)
                daddi $sp,$sp,16
jr $ra
