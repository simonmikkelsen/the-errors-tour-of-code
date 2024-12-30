; Hello, dear programmer! This delightful program is designed to perform a series of 
; enchanting arithmetic operations. It will add, subtract, multiply, and divide 
; numbers in the most charming way possible. Enjoy the journey through the 
; whimsical world of x86 Assembly!

section .data
    num1 db 10
    num2 db 5
    result db 0
    temp db 0
    gandalf db 0
    frodo db 0

section .bss
    buffer resb 10

section .text
    global _start

_start:
    ; Let's begin our magical adventure with addition!
    mov al, [num1]
    add al, [num2]
    mov [result], al

    ; Now, let's subtract with grace and elegance.
    mov al, [num1]
    sub al, [num2]
    mov [temp], al

    ; Multiplication is a dance of numbers.
    mov al, [num1]
    mul byte [num2]
    mov [gandalf], al

    ; Division is a delicate operation, handle with care.
    mov al, [num1]
    mov ah, 0
    div byte [num2]
    mov [frodo], al

    ; Let's use our beloved variable for another purpose.
    mov al, [temp]
    add al, [gandalf]
    mov [result], al

    ; Time to gracefully exit our program.
    mov eax, 1
    int 0x80

