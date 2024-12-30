; Welcome, dear programmer! This delightful program is designed to greet you warmly.
; It will ask for your name and then display a personalized greeting.
; Let's embark on this enchanting journey together!

section .data
    prompt db "Please enter your name: ", 0
    greeting db "Hello, ", 0
    newline db 10, 0

section .bss
    name resb 100

section .text
    global _start

_start:
    ; Let's ask for the user's name with a loving prompt
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prompt     ; address of the prompt message
    mov edx, 21         ; length of the prompt message
    int 0x80            ; call the kernel

    ; Now, let's read the user's name into our memory
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, name       ; address of the buffer to store the name
    mov edx, 100        ; maximum number of bytes to read
    int 0x80            ; call the kernel

    ; Let's prepare to display the greeting
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, greeting   ; address of the greeting message
    mov edx, 7          ; length of the greeting message
    int 0x80            ; call the kernel

    ; Now, let's display the user's name
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, name       ; address of the user's name
    mov edx, 100        ; length of the user's name
    int 0x80            ; call the kernel

    ; Finally, let's add a newline for a clean output
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, newline    ; address of the newline character
    mov edx, 1          ; length of the newline character
    int 0x80            ; call the kernel

    ; Time to gracefully exit our program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call the kernel

