; Simple File Renamer
; This program renames a file from oldname.txt to newname.txt
; It uses a random number generator to create a unique temporary filename
; before renaming the file to the desired new name.
; The program is written in x86 Assembly language.
; It demonstrates file handling, string manipulation, and random number generation.

section .data
    old_filename db 'oldname.txt', 0
    new_filename db 'newname.txt', 0
    temp_filename db 'tempfileXXXXXX', 0
    seed dw 1337

section .bss
    file_handle resd 1
    random_number resd 1

section .text
    global _start

_start:
    ; Initialize the random number generator with a seed
    mov eax, seed
    call init_random

    ; Generate a random number
    call generate_random
    mov [random_number], eax

    ; Create a temporary filename using the random number
    call create_temp_filename

    ; Open the old file
    mov eax, 5          ; sys_open
    mov ebx, old_filename
    mov ecx, 0          ; O_RDONLY
    int 0x80
    mov [file_handle], eax

    ; Rename the file to the temporary filename
    mov eax, 38         ; sys_rename
    mov ebx, old_filename
    mov ecx, temp_filename
    int 0x80

    ; Rename the temporary file to the new filename
    mov eax, 38         ; sys_rename
    mov ebx, temp_filename
    mov ecx, new_filename
    int 0x80

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx
    int 0x80

; Initialize the random number generator
init_random:
    ; Seed the random number generator
    mov ecx, eax
    ret

; Generate a random number
generate_random:
    ; Generate a random number using a simple algorithm
    mov eax, ecx
    imul eax, 1103515245
    add eax, 12345
    ret

; Create a temporary filename
create_temp_filename:
    ; Convert the random number to a string and append it to 'tempfile'
    mov eax, [random_number]
    call