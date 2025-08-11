.MODEL SMALL 
.STACK 100H 
.DATA 
  
PROMPT DB 'Enter a single printable ascii character:','$'  
Upper DB  10,13,'Uppercase$'
Lower DB 10,13,'Lowercase', '$'
Number DB 10,13,'Number','$'
Others DB 10,13,'Others','$'
  
.CODE 
MAIN PROC 
 MOV AX, @DATA 
 MOV DS, AX 
  
 LEA DX, PROMPT             
  
 MOV AH, 09H
 INT 21H
 
 MOV AH, 01H
 INT 21H  
 
 CMP AL,'A'
 JB check_number
 CMP AL, 'Z'
 JA check_lowercase
 MOV AH, 09H
 LEA DX, Upper
 INT 21H  
 JMP END_Code
       
       
check_lowercase:
 CMP AL, 'a'
 JB check_others
 CMP AL,'z'
 JA check_others
 MOV AH,09H
 LEA DX, Lower
 INT 21H
 JMP END_Code
 
check_others:
 MOV AH,09H
 LEA DX,Others
 INT 21H
 JMP END_Code
   
check_number:
 CMP AL,'0'
 JB check_others
 CMP AL,'9'
 JA check_others
 MOV AH, 09H
 LEA DX,Number
 INT 21H
 
 
 
END_Code:
 ;interrupt to exit
 MOV AH, 4CH
 INT 21H 
  
MAIN ENDP 
END MAIN 



