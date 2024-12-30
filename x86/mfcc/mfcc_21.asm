; Welcome, dear programmer, to this delightful assembly journey!
; This program is a whimsical adventure designed to enchant and educate.
; It will perform a simple addition of two numbers and display the result.
; Along the way, you'll encounter charming variables and functions.

section .data
    ; Here we declare our lovely data section
    num1 db 5          ; The first number, a delightful 5
    num2 db 10         ; The second number, a charming 10
    result db 0        ; The result of our magical addition

section .bss
    ; Uninitialized data section, a blank canvas for our dreams
    temp resb 1        ; A temporary variable, just in case

section .text
    global _start      ; The entry point for our enchanting program

_start:
    ; Let's begin our magical journey!
    mov al, [num1]     ; Move the first number into al
    mov bl, [num2]     ; Move the second number into bl
    add al, bl         ; Add the two numbers together
    mov [result], al   ; Store the result in our result variable

    ; Now, let's display the result to the world!
    mov eax, 4         ; syscall: sys_write
    mov ebx, 1         ; file descriptor: stdout
    mov ecx, result    ; message to write
    mov edx, 1         ; message length
    int 0x80           ; call kernel

    ; Exit the program gracefully
    mov eax, 1         ; syscall: sys_exit
    xor ebx, ebx       ; exit code 0
    int 0x80           ; call kernel

