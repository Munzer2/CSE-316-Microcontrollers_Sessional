.MODEL SMALL
.STACK 100h

.DATA
    Prompt DB 'Enter three lowercase letters: $'
    output DB 'Second highest letter is: $'  
    Equal  DB 10,13,'All letters are equal.$'
    letters DB 3 DUP(?)     ; Array to store input letters 
    NewLine DB 10,13,'$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS,AX

    ; Display prompt for input
    MOV AH, 09H
    LEA DX,Prompt 
    INT 21H

    ; Read input
    MOV SI, 0
    MOV CX, 3
    MOV AH, 01H
readInput:
    INT 21h
    MOV letters[SI], AL
    INC SI
    LOOP readInput 
    
    MOV SI,0   
    MOV BL,letters[SI]
    INC SI
    CMP BL, letters[SI]
    JG SecondComp1 
    JE SecondComp2
    JL SecondComp3
    
SecondComp3: ; here 2nd > 1st
    MOV BL,letters[SI]
    INC SI
    CMP BL, letters[SI]
    JE firstPrint
    JG FourthComp  
    JL SecondPrint    

    
SecondComp2:  ; 2nd el == 1st el
    INC SI
    CMP BL,letters[SI]
    JE AllequalPrint
    JG PrintLast
    JL firstPrint    
    
    
SecondComp1: ; 2nd < 1st
    INC SI
    CMP BL,letters[SI]
    JE SecondPrint
    JG ThirdComp
    JL firstPrint
    
ThirdComp: ; 1st el highest
    MOV SI,0
    INC SI
    MOV BL,letters[SI]
    INC SI
    CMP BL,letters[SI]
    JGE SecondPrint
    JL  Printlast
    
FourthComp: ; 2nd el higest
    MOV SI,0
    MOV BL,letters[SI]
    INC SI
    INC SI
    CMP BL,letters[SI]
    JGE firstPrint
    JL  printlast
    
    
firstPrint:
    MOV AH,9 
    LEA DX, Newline 
    INT 21H 
    MOV AH,9
    LEA DX, output
    INT 21H
    MOV SI,0
    MOV DL,letters[SI]
    MOV AH,2
    INT 21H
    JMP ENDCASE

SecondPrint: 
    MOV AH,9 
    LEA DX, Newline 
    INT 21H 
    MOV AH,9
    LEA DX, output
    INT 21H
    MOV SI,0
    INC SI
    MOV DL,letters[SI]
    MOV AH,2
    INT 21H
    JMP ENDCASE


Printlast:
    MOV AH,9 
    LEA DX, Newline 
    INT 21H
    MOV AH,9
    LEA DX, output
    INT 21H
    MOV SI,0
    INC SI
    INC SI
    MOV DL,letters[SI]
    MOV AH,2
    INT 21H
    JMP ENDCASE

AllequalPrint:
    MOV AH,09H
    LEA DX,Equal
    INT 21H 
    JMP ENDCASE

ENDCASE:
    MOV AH,4CH
    INT 21H 

    
MAIN ENDP
END MAIN 
