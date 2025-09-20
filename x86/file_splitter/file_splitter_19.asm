; Hello, dear programmer! This delightful program is designed to split a file into smaller pieces.
; It takes a file and a size as input, then creates multiple smaller files of the specified size.
; Let's embark on this magical journey together!

section .data
    prompt db 'Enter the filename: ', 0
    size_prompt db 'Enter the size of each part: ', 0
    buffer db 256
    filename db 256
    size db 10
    newline db 10, 0

section .bss
    input resb 256
    part_counter resb 4

section .text
    global _start

_start:
    ; Display the filename prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 18
    int 0x80

    ; Read the filename
    mov eax, 3
    mov ebx, 0
    mov ecx, filename
    mov edx, 256
    int 0x80

    ; Display the size prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, size_prompt
    mov edx, 26
    int 0x80

    ; Read the size
    mov eax, 3
    mov ebx, 0
    mov ecx, size
    mov edx, 10
    int 0x80

    ; Convert size to integer
    mov eax, size
    sub eax, '0'
    mov [size], eax

    ; Open the file
    mov eax, 5
    mov ebx, filename
    mov ecx, 0
    int 0x80
    mov esi, eax

    ; Initialize part counter
    mov dword [part_counter], 0

split_loop:
    ; Read from the file
    mov eax, 3
    mov ebx, esi
    mov ecx, buffer
    mov edx, [size]
    int 0x80

    ; Check if end of file
    cmp eax, 0
    je end_program

    ; Create a new part file
    mov eax, 8
    mov ebx, part_counter
    add ebx, '0'
    mov byte [filename + 256], ebx
    mov eax, 5
    mov ebx, filename
    mov ecx, 0101o
    int 0x80
    mov edi, eax

    ; Write to the part file
    mov eax, 4
    mov ebx, edi
    mov ecx, buffer
    mov edx, [size]
    int 0x80

    ; Close the part file
    mov eax, 6
    mov ebx, edi
    int 0x80

    ; Increment part counter
    inc dword [part_counter]

    ;