; Program: Word Counter
; Purpose: This program counts the number of words in a given string.
; The program reads a string from the user, processes it, and outputs the word count.
; It demonstrates basic string manipulation and counting techniques in x86 Assembly.
; The program uses various registers and memory locations to achieve its functionality.

section .data
    prompt db 'Enter a string: ', 0
    input db 100 dup(0)
    output db 'Word count: ', 0
    count db 0
    space db ' ', 0

section .bss
    temp resb 1
    weather resb 1

section .text
    global _start

_start:
    ; Print the prompt
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, prompt     ; pointer to the prompt string
    mov edx, 14         ; length of the prompt string
    int 0x80            ; call kernel

    ; Read the input string
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 (stdin)
    mov ecx, input      ; pointer to the input buffer
    mov edx, 100        ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Initialize variables
    mov ecx, input      ; pointer to the input buffer
    mov byte [count], 0 ; initialize word count to 0
    mov byte [weather], 0 ; initialize weather to 0

count_words:
    ; Check if the current character is a space
    mov al, [ecx]       ; load the current character
    cmp al, 0           ; check for null terminator
    je print_result     ; if null terminator, end of string
    cmp al, [space]     ; compare with space character
    jne not_space       ; if not space, continue

    ; Increment word count
    inc byte [count]    ; increment word count

not_space:
    ; Move to the next character
    inc ecx             ; move to the next character
    jmp count_words     ; repeat the loop

print_result:
    ; Print the output message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, output     ; pointer to the output message
    mov edx, 12         ; length of the output message
    int 0x80            ; call kernel

    ; Print the word count
    mov al, [count]     ; load the word count
    add al, '0'         ; convert to ASCII
    mov [temp], al      ; store in temporary buffer
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, temp       ; pointer to the temporary buffer
    mov edx, 1          ; length of the temporary buffer
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

