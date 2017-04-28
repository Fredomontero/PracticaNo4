dosseg

.model tiny
.code
public _pokeb
public _peekb
public _printAddress
public _putchar

_peekb proc
  push bp
  mov bp,sp

  mov ax,[bp+4]
  mov ds,ax
  mov bx,[bp+6]
  mov ah,00
  mov byte ptr ax,[bx]

  pop bp
  ret
_peekb endp

_pokeb proc
  push bp
  mov bp,sp

  mov ax,[bp+4]
  mov ds,ax
  mov bx,[bp+6]
  mov ah,00
  mov byte ptr al,[bp+8]

  mov byte ptr[bx],al

  pop bp
  ret
_pokeb endp

_printAddress proc
  push bp
  mov bp,sp

  mov ax,[bp+4]
  mov bx,16
  call imprimeBase
  mov dl,58
  mov ah,02
  int 21h
  mov ax,[bp+6]
  mov bx,16
  call imprimeBase
  mov dl,10
  mov ah,02
  int 21h
  mov dl,13
  mov ah,02
  int 21h

  pop bp
  ret
_printAddress endp

imprimeBase proc
  push ax
  push bx
  push cx
  push dx

    mov cx,0
  divide:
    mov dx,0
    div bx
    inc cx
    push dx
    cmp ax,0
    je imprime
    jmp divide
  imprime:
    pop dx
    cmp dx,10
    jl numero
    add dx,7
  numero:
    add dx,48
    mov ah,02
    int 21h
    loop imprime

  pop ax
  pop bx
  pop cx
  pop dx
  ret
imprimeBase endp

_putchar proc
  push bp
  mov bp,sp

  mov dl,[bp+4]
  mov ah,2
  int 21h

  pop bp
  ret
_putchar endp
end
