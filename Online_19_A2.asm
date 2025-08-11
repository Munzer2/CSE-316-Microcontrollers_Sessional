.STACK 100H
.DATA
      
ans DW 0
ans1 dw 0
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
        
        mov bx,10
        input1:
        
        mov ah,1
        int 21h
        
        
        cmp al,' '
        je input2
        
        sub al,'0'
        
        xor cx,cx
        mov cl,al
        mov ax,ans
        mul bx 
        add ax,cx
        mov ans,ax
        jmp input1
        
        
        input2:
        mov ah,1
        int 21h
        
        
        cmp al,13
        je gcd
        
        sub al,'0'
        
        xor cx,cx
        mov cl,al
        mov ax,ans1
        mul bx 
        add ax,cx
        mov ans1,ax
        jmp input2
         
         
        gcd:
        mov ax, ans
        mov bx, ans1  
            while:
            cmp ax,bx
            ja above
            je end 
            jb below
            
            
            above:
                sub ax,bx
                jmp while
                
            below:
                sub bx,ax
                jmp while
                
        
        
        end: ;Ax is our ans.  
        mov bx,ax
        
        mov ah,9
        lea dx, newline
        int 21h
        mov ax,bx
        mov bx,10
        mov cx,1       
        print:
        cmp ax,0
        je print1
        inc cx  
        xor dx,dx
        div bx
        mov bp,dx
        push bp
        jmp print
        
        
        print1:
        dec cx
        cmp cx,0
        je end1
        pop bp
        mov dx,bp
        add dl,48
        mov ah,2
        int 21h
        jmp print1
        
        end1: 
        mov ah,4ch
        int 21h
        
        
        
         
       
       
       
    MAIN ENDP