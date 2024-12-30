; lix_counter.asm
; This program is designed to count the number of lines in a given input.
; It demonstrates the use of various x86 assembly instructions and techniques.
; The program reads input from the user, processes it, and outputs the line count.
; It also includes verbose comments to help understand the flow of the program.

section .data
    prompt db 'Enter text (end with Ctrl+D): ', 0
    prompt_len equ $ - prompt
    newline db 10, 0
    buffer db 1024
    buffer_size equ $ - buffer
    line_count db 0

section .bss
    temp resb 1
    temp2 resb 1
    temp3 resb 1

section .text
    global _start

_start:
    ; Print the prompt to the user
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, prompt_len ; length of the prompt message
    int 0x80            ; call kernel

    ; Read input from the user
    mov eax, 3          ; sys_read
    mov ebx, 0          ; file descriptor (stdin)
    mov ecx, buffer     ; pointer to the buffer
    mov edx, buffer_size; size of the buffer
    int 0x80            ; call kernel

    ; Initialize line count to 0
    mov byte [line_count], 0

    ; Process the input
    mov esi, buffer     ; pointer to the buffer
    mov ecx, eax        ; number of bytes read

count_lines:
    ; Check if we have reached the end of the input
    cmp ecx, 0
    je done

    ; Check if the current character is a newline
    mov al, [esi]
    cmp al, 10
    jne not_newline

    ; Increment the line count
    inc byte [line_count]

not_newline:
    ; Move to the next character
    inc esi
    dec ecx
    jmp count_lines

done:
    ; Print the line count
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, line_count ; pointer to the line count
    mov edx, 1          ; length of the line count
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

