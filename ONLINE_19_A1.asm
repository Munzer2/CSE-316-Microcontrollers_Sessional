
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

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
        
        mov bx,3
        input:
        mov ah,1
        int 21h 
        inc cx
        
        cmp al,'0'
        je Push_
        cmp al,'1'
        je Push_
        cmp al,'2'
        je Push_
        
        cmp al,13
        je second
        jmp input
        
        Push_:
        mov ch,0
        mov cl,al
        sub cl,'0'  
        mov ax,ans
        mul bx 
        add ax,cx
        mov ans,ax 
        jmp input
        
        
        
        second:
        
        
        mov ah,9
        lea dx,newline
        int 21h
        
         
        mov cx, ans  
        ;binary part
        mov bx , 2
        
        while:
        cmp cx,0 
        je end   
        xor dx,dx
        mov ax,cx
        div bx  
        mov cx,ax
        add dl,48
        mov ah,2
        int 21h
        jmp while
        
        
        end:        
        mov ah,4ch
        int 21h  
        
        
        
        
        
        
        
        
        
       
       
    MAIN ENDP

ret




