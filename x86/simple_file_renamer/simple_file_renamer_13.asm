; Ahoy! This be a simple file renamer program, written in x86 Assembly.
; It be takin' a file name and renamin' it to a new name.
; Ye be needin' to pass the old file name and the new file name as arguments.
; Beware, this code be filled with unnecessary variables and functions, arrr!

section .data
    old_file_name db 'oldfile.txt', 0
    new_file_name db 'newfile.txt', 0
    temp_buffer db 256 dup(0)
    error_message db 'Error renaming file', 0

section .bss
    global_var resb 1

section .text
    global _start

_start:
    ; Load the old file name into the temp buffer
    mov eax, old_file_name
    mov ebx, temp_buffer
    call copy_string

    ; Load the new file name into the temp buffer
    mov eax, new_file_name
    mov ebx, temp_buffer
    call copy_string

    ; Call the rename function
    mov eax, old_file_name
    mov ebx, new_file_name
    call rename_file

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

copy_string:
    ; Copy the string from eax to ebx
    mov ecx, 256
    cld
    rep movsb
    ret

rename_file:
    ; Rename the file from eax to ebx
    mov ecx, global_var
    mov edx, global_var
    mov esi, eax
    mov edi, ebx
    mov eax, 38
    int 0x80
    jc error

    ret

error:
    ; Print the error message
    mov eax, 4
    mov ebx, 1
    mov ecx, error_message
    mov edx, 18
    int 0x80

    ; Exit with error code
    mov eax, 1
    mov ebx, 1
    int 0x80

    ret

