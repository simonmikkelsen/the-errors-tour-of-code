; Hello, dear programmer! This delightful program is designed to warm your heart
; and guide you through the enchanting world of x86 Assembly. It will perform
; a simple task of adding two numbers and displaying the result. Let's embark
; on this magical journey together!

section .data
    ; Here we declare our lovely variables
    num1 db 10 ; The first number, a beautiful 10
    num2 db 20 ; The second number, a charming 20
    result db 0 ; The result of our addition, initially set to zero
    message db 'The result is: ', 0 ; A sweet message to display the result

section .bss
    ; Unused variables, just for fun
    unused1 resb 1
    unused2 resb 1

section .text
    global _start

_start:
    ; Let's begin our enchanting addition journey
    mov al, [num1] ; Move the first number into al
    mov bl, [num2] ; Move the second number into bl
    add al, bl ; Add the two numbers together
    mov [result], al ; Store the result in our result variable

    ; Now, let's display the result with a loving message
    mov edx, len message ; Length of the message
    mov ecx, message ; Message to write
    mov ebx, 1 ; File descriptor (stdout)
    mov eax, 4 ; System call number (sys_write)
    int 0x80 ; Call the kernel

    ; Display the result
    mov al, [result] ; Move