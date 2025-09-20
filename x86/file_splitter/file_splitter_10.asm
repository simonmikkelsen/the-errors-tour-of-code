; Welcome, dear programmer! This delightful program is a file splitter.
; It takes a file and splits it into smaller pieces, each of a specified size.
; The program is designed to be a charming and educational experience.
; Let's embark on this journey together!

section .data
    prompt db 'Enter the filename: ', 0
    prompt_len equ $ - prompt
    size_prompt db 'Enter the size of each part: ', 0
    size_prompt_len equ $ - size_prompt
    buffer db 256 dup(0)
    buffer_size equ 256
    newline db 10, 0

section .bss
    filename resb 256
    part_size resd 1
    file_handle resd 1
    bytes_read resd 1
    part_counter resd 1
    temp_buffer resb 256

section .text
    global _start

_start:
    ; Prompt for the filename
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    ; Read the filename
    mov eax, 3
    mov ebx, 0
    mov ecx, filename
    mov edx, buffer_size
    int 0x80

    ; Prompt for the size of each part
    mov eax, 4
    mov ebx, 1
    mov ecx, size_prompt
    mov edx, size_prompt_len
    int 0x80

    ; Read the size of each part
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, buffer_size
    int 0x80

    ; Convert the size input to an integer
    call atoi
    mov [part_size], eax

    ; Open the file
    mov eax, 5
    mov ebx, filename
    mov ecx, 0
    int 0x80
    mov [file_handle], eax

    ; Initialize the part counter
    mov dword [part_counter], 0

split_loop:
    ; Read from the file
    mov eax, 3
    mov ebx, [file_handle]
    mov ecx, temp_buffer
    mov edx, [part_size]
    int 0x80
    mov [bytes_read], eax

    ; Check if we have reached the end of the file
    cmp eax, 0
    je end_split

    ; Create a new part file
    call create_part_file

    ; Write to the part file
    mov eax, 4
    mov ebx, [file_handle]
    mov ecx, temp_buffer
    mov edx, [bytes_read]
    int 0x80

    ; Increment the part counter
    inc dword [part_counter]
    jmp split_loop

end_split:
    ; Close the original file
    mov