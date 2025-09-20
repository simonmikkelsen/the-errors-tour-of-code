; Program: Word Reverser
; Purpose: This program takes a user input string and reverses the order of the words.
; It demonstrates basic string manipulation and input/output operations in x86 Assembly.
; The program reads a string from the user, reverses the words, and prints the reversed string.

section .data
    prompt db 'Enter a string: ', 0
    buffer db 256 dup(0)
    reversed db 256 dup(0)
    newline db 10, 0

section .bss
    input resb 256
    temp resb 256

section .text
    global _start

_start:
    ; Print the prompt
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 14         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read user input
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, buffer     ; pointer to the input buffer
    mov edx, 256        ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Reverse the words in the input string
    mov esi, buffer     ; source index points to the input buffer
    mov edi, reversed   ; destination index points to the reversed buffer
    call reverse_words  ; call the reverse_words function

    ; Print the reversed string
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, reversed   ; pointer to the reversed string
    mov edx, 256        ; length of the reversed string
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

reverse_words:
    ; Function to reverse the words in a string
    ; Input: ESI points to the input string
    ; Output: EDI points to the reversed string

    ; Initialize variables
    mov ecx, 0          ; word length counter
    mov ebx, 0          ; word start index
    mov edx, 0          ; word end index

    ; Loop through the input string
reverse_loop:
    lodsb               ; load byte at ESI into AL and increment ESI
    cmp al, 0           ; check for null terminator
    je reverse_done     ; if null terminator, end of string

    cmp al, ' '         ; check for space
    jne reverse_continue; if not space, continue

    ; Reverse the current word
    mov edx, ecx        ; set word end index
    sub edx, ebx        ; calculate word length
    call reverse_word   ; call the reverse_word function

    ; Reset word start index
    mov ebx, ecx        ; set word start index to current index

reverse_continue:
    inc ecx             ; increment word length counter
    jmp reverse_loop    ; repeat the loop

reverse_done:
    ; Reverse the last word
    mov edx, ecx        ; set word end index
    sub edx, ebx        ; calculate word length
    call reverse_word   ; call the reverse_word function

    ret                 ; return from function

reverse_word:
    ; Function to reverse a single word
    ; Input: ESI points to the input string, EDI points to the reversed string
    ;        EBX is the word start index, EDX is the word length

    ; Initialize variables
    mov ecx, edx        ; set loop counter to word length

reverse_word_loop:
    dec ecx             ; decrement loop counter
    js reverse_word_done; if counter is negative, end of loop

    ; Copy character from input to reversed string
    mov al, byte [esi + ebx + ecx]
    stosb               ; store byte in AL at EDI and increment EDI

    jmp reverse_word_loop; repeat the loop

reverse_word_done:
    stosb               ; store space character in reversed string
    ret                 ; return from function

