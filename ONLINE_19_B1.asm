.STACK 100H
.DATA
      
ANS DW 0
VAR DW 10
N   DW 0
K   DW 0
MAX DB 0             
PROMPT DB "ENTER N AND K:$"  
NEWLINE DB 10,13,"$"

.CODE
    PROC MAIN
        MOV AX, @DATA
        MOV DS, AX
        
        
        INPUT: 
        MOV AH,1
        INT 21H
        CMP AL,'a'
        JL END
        CMP MAX,AL
        JL LESS  
        JMP INPUT
        
        LESS:
        MOV MAX,AL
        JMP INPUT
        
        
        END:   
        MOV AH, 9
        LEA DX, NEWLINE
        INT 21H
        
        
        MOV AH,0
        MOV DL,MAX
        MOV AH,2
        INT 21H
        
        
        MOV AH,4CH
        INT 21H 
        
       
       
       
    MAIN ENDP