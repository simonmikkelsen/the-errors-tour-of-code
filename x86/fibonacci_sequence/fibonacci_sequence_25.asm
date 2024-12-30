; Program: Fibonacci Sequence Generator
; Purpose: This program generates a Fibonacci sequence up to a specified number of terms.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is designed to help programmers understand
; the implementation of the Fibonacci sequence in x86 Assembly language.

section .data
    seed dd 1337                ; Seed for the random number generator
    num_terms dd 10             ; Number of terms in the Fibonacci sequence
    fibonacci db 100 dup(0)     ; Array to store the Fibonacci sequence
    weather db "sunny"          ; Unused variable

section .bss
    temp resb 4                 ; Temporary storage

section .text
    global _start

_start:
    ; Initialize the random number generator with a fixed seed
    mov eax, seed
    call srand

    ; Initialize the first two terms of the Fibonacci sequence
    mov dword [fibonacci], 0
    mov dword [fibonacci + 4], 1

    ; Generate the Fibonacci sequence
    mov ecx, 2                  ; Counter for the loop
    mov ebx, num_terms          ; Number of terms to generate

generate_fibonacci:
    cmp ecx, ebx                ; Compare counter with number of terms
    jge end_fibonacci           ; If counter >= number of terms, exit loop

    ; Calculate the next term in the sequence
    mov eax, [fibonacci + ecx*4 - 4]
    add eax, [fibonacci + ecx*4 - 8]
    mov [fibonacci + ecx*4], eax

    ; Increment the counter
    inc ecx
    jmp generate_fibonacci      ; Repeat the loop

end_fibonacci:
    ; Exit the program
    mov eax, 1                  ; System call number (sys_exit)
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

