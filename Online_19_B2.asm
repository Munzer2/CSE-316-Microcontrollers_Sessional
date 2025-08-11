.STACK 100H
.DATA
      
VAR DW 10
N   DW 0
K   DW 0
MAX DB 0
ans dw 0
ans1 dw 0               
PROMPT DB "ENTER N AND K:$"  
NEWLINE DB 10,13,"$"

.CODE
    PROC MAIN
        MOV AX, @DATA
        MOV DS, AX
        
        
        input1: 
        mov ah,1
        int 21h
        
        cmp al,13
        je newlineprint
        mov ah,0
        mov dl,al
        sub al, 'a'
        add al,1
        mul dl
        add ans,ax
         
        jmp input1
        
        
        newlineprint:
        mov ah,9
        lea dx,newline
        int 21h
        
        
        
        
        
        input2:
        mov ah,1
        int 21h
        cmp al,13
        je end
        mov ah,0
        mov dl,al
        sub al, 'a'
        add al,1
        mul dl
        add ans1,ax
        jmp input2
        
        
        end:  
        
        mov ah,9
        lea dx,newline
        int 21h
        
        
        
        
        mov ax, ans1
        cmp ans, ax
        je PE
        jmp NE
        
        
        
        PE: 
        mov ax,0
        mov dl, 'P'
        mov ah,2
        int 21h
        
        mov dl,'E'
        mov ah,2
        int 21h 
        
        
        mov ah, 4ch
        int 21h  
        
        
        
        NE:
        mov ax,0
        mov dl, 'N'
        mov ah,2
        int 21h
        
        mov dl,'E'
        mov ah,2
        int 21h 
        
        
        mov ah, 4ch
        int 21h  
        
       
       
    MAIN ENDP