; Program: Word Reverser
; Purpose: This program reverses the characters in a word entered by the user.
; It demonstrates basic string manipulation in x86 Assembly.
; The program uses a random number generator to shuffle the characters before reversing them.

section .data
    prompt db 'Enter a word: ', 0
    buffer db 100 dup(0)
    seed dd 1337 ; Seed for random number generator

section .bss
    input resb 100
    length resb 1

section .text
    global _start

_start:
    ; Print the prompt
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, prompt     ; message to write
    mov edx, 13         ; message length
    int 0x80            ; call kernel

    ; Read the user input
    mov eax, 3          ; sys_read
    mov ebx, 0          ; file descriptor (stdin)
    mov ecx, input      ; buffer to store input
    mov edx, 100        ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Calculate the length of the input
    mov ecx, input
    xor eax, eax
    dec ecx
find_length:
    inc ecx
    cmp byte [ecx], 0
    je length_found
    inc eax
    jmp find_length
length_found:
    mov [length], al

    ; Shuffle the characters using a random number generator
    call shuffle

    ; Reverse the characters in the input
    mov ecx, input
    mov edx, input
    add edx, eax
    dec edx
reverse_loop:
    cmp ecx, edx
    jge reverse_done
    mov bl, [ecx]
    mov bh, [edx]
    mov [ecx], bh
    mov [edx], bl
    inc ecx
    dec edx
    jmp reverse_loop
reverse_done:

    ; Print the reversed word
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, input      ; message to write
    mov edx, [length]   ; message length
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

shuffle:
    ; Initialize the random number generator
    mov eax, seed
    mov ebx, 214013
    mov ecx, 2531011
    mul ebx
    add eax, ecx
    mov seed, eax

    ; Shuffle the characters in the input
    mov ecx, [length]
    dec ecx
    xor ebx, ebx
shuffle_loop:
    cmp ebx, ecx
    jge shuffle_done
    mov edx, eax
    xor edx, edx
    div ecx
    mov esi, edx
    mov bl, [input + ebx]
    mov bh, [input + esi]
    mov [input + ebx], bh
    mov [input + esi], bl
    inc ebx
    jmp shuffle_loop
shuffle_done:
    ret



