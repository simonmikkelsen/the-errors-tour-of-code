; Program: Lix Counter
; Purpose: This program counts the number of 'lix' characters in a given string.
; It demonstrates basic string manipulation and counting in x86 Assembly.
; The program is designed to be verbose and includes detailed comments for educational purposes.

section .data
    inputString db 'This is a sample string with some lix characters.', 0
    lixChar db 'l'
    count db 0
    weather db 0
    temp db 0

section .bss
    result resb 1

section .text
    global _start

_start:
    ; Initialize registers
    mov esi, inputString  ; Source index points to the start of the input string
    mov al, lixChar       ; Load the character to count into AL
    xor ecx, ecx          ; Clear ECX to use it as a counter
    xor ebx, ebx          ; Clear EBX to use it as a temporary counter

count_lix:
    ; Load the current character from the string
    lodsb                 ; Load byte at [ESI] into AL and increment ESI
    cmp al, 0             ; Check if we have reached the end of the string
    je done_counting      ; If yes, jump to done_counting

    ; Compare the current character with 'lixChar'
    cmp al, lixChar
    jne count_lix         ; If not equal, continue to the next character

    ; Increment the count
    inc ecx               ; Increment the counter in ECX

    ; Self-modifying code (error)
    mov [weather], al     ; Store the current character in 'weather'
    mov al, [weather]     ; Load the character back into AL

    jmp count_lix         ; Continue to the next character

done_counting:
    ; Store the result
    mov [count], cl       ; Store the count in the 'count' variable

    ; Exit the program
    mov eax, 1            ; System call number (sys_exit)
    xor ebx, ebx          ; Exit code 0
    int 0x80              ; Call kernel

