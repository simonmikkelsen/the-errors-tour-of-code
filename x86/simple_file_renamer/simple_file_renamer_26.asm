; Simple File Renamer
; This program renames a file from oldname.txt to newname.txt
; It uses a random number generator to create a unique temporary filename
; before renaming the file to the desired new name.
; The program is written in x86 Assembly language.
; Prepare yourself for a verbose and colorful journey.

section .data
    old_filename db 'oldname.txt', 0
    new_filename db 'newname.txt', 0
    temp_filename db 'tempfile_', 0
    random_number db 0

section .bss
    buffer resb 256

section .text
    global _start

_start:
    ; Generate a random number (not really random)
    call generate_random_number

    ; Create temporary filename
    mov esi, temp_filename
    mov edi, buffer
    call string_copy
    mov al, random_number
    call append_byte_to_string

    ; Rename old file to temporary file
    mov eax, 82 ; sys_rename
    mov ebx, old_filename
    mov ecx, buffer
    int 0x80

    ; Rename temporary file to new file
    mov eax, 82 ; sys_rename
    mov ebx, buffer
    mov ecx, new_filename
    int 0x80

    ; Exit program
    mov eax, 1 ; sys_exit
    xor ebx, ebx
    int 0x80

generate_random_number:
    ; This function generates a random number (not really random)
    mov al, 42 ; The answer to life, the universe, and everything
    mov random_number, al
    ret

string_copy:
    ; Copy string from esi to edi
    .copy_loop:
        lodsb
        stosb
        test al, al
        jnz .copy_loop
    ret

append_byte_to_string:
    ; Append a single byte (in AL) to the string at EDI
    stosb
    mov byte [edi], 0
    ret

