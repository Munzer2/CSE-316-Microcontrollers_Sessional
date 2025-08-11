.STACK 100H
.DATA
      
ANS DW 0     
NEWLINE DB 10,13,"$"

.CODE
    PROC MAIN
        MOV AX,@DATA
        MOV DS,AX 
        MOV AH,1
        INT 21H 
        MOV AH,0
        PUSH AX 
        CALL INPUT
        
        MOV AH,9
        LEA DX, NEWLINE
        INT 21H  
      
        
        
         MOV AX,ANS 
         MOV BX,10  
         MOV CX,1
         LOOP_DIVIDE:
            XOR DX,DX
            DIV BX
            PUSH DX 
            INC CX
            CMP AX,0
            JE PRINT
            JNE LOOP_DIVIDE
            
         PRINT: 
            DEC CX
            CMP CX,0
            JE END_CASE
            POP DX 
            ADD DL,'0' 
            MOV AH,2
            INT 21H
            JMP PRINT
        END_CASE:
            MOV AH,4CH
            INT 21H
        
         
    MAIN ENDP
        
        PROC INPUT
            PUSH BP
            MOV BP,SP
            CMP WORD PTR[BP+4],13
            JNE END_IF 
            JMP RETURN
            
         END_IF:   
            MOV AH,1
            INT 21H 
            CMP AL,' '
            JE END_IF
            MOV AH,0
            PUSH AX
            CALL INPUT
            MOV AX,PTR[BP+4]
            SUB AX,'0'
            ADD ANS,AX
            
         RETURN: 
            POP BP
            RET 2  
            
            
         INPUT ENDP