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
                
        
        
        end: ;Ax is out ans.
        mov bx,10       
        print:
        cmp ax,0
        je print1  
        xor dx,dx
        div bx
        mov bp,dx
        push bp
        jmp print
        
        
        print1:
        pop bp
        mov ax,bp
        mov ah,2
        int 21h
        jmp print1
        
        
        mov ah,4ch
        int 21h
        
        
        
         
       
       
       
    MAIN ENDP