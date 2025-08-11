.STACK 100H
.DATA
      
ANS DW 0
VAR DW 10
N   DW 0
K   DW 0             
PROMPT DB "ENTER N AND K:$"  
NEWLINE DB 10,13,"$"

.CODE
    PROC MAIN
        MOV AX, @DATA
        MOV DS, AX
        
        
        MOV BX,10 
        MOV AH,9
        LEA DX,PROMPT
        INT 21H
        
        INPUT1:
            MOV AH,1
            INT 21H
            CMP AL, ' '
            JE INPUT2
            MOV AH,0
            MOV VAR,AX
            SUB VAR,'0'
            MOV DL, 10
            MOV AX,N
            MUL DL
            MOV N,AX
            MOV BX,N
            ADD BX,VAR
            MOV N,BX
            JMP INPUT1
            
        INPUT2:
            MOV AH,1
            INT 21H
            CMP AL,13
            JE NEXT
            MOV AH,0
            MOV VAR,AX
            SUB VAR,'0'
            MOV DL,10
            MOV AX,K
            MUL DL
            MOV K,AX
            MOV BX,K
            ADD BX,VAR
            MOV K,BX
            JMP INPUT2      
        NEXT: 
            MOV AH,9
            LEA DX,NEWLINE
            INT 21H
         
            ;THIS PART IS FOR CALCULATION ONLY.
            MOV BX,N
            MOV ANS,BX
            MOV BX,K
            WHILE:
                 CMP N,BX
                 JB END;  
                 MOV AX,N
                 MOV DX,0
                 DIV K
                 MOV N,AX
                 ADD ANS,AX
                 JMP WHILE
            
            
            END:;NOW FOR SHOWING THE RESULT.  
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