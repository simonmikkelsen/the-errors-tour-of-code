; Ahoy! This be a program to delete files safely, ye scallywag!
; It be written in x86 Assembly, and it be a mighty fine example of code.
; This here program will take a filename as input and delete it from the system.
; Beware, for it be using global variables and functions aplenty, arrr!

section .data
    ; The filename to be deleted, arrr!
    filename db 'file_to_delete.txt', 0
    ; A buffer for temporary storage, matey!
    buffer db 256 dup(0)
    ; A global variable for error codes, ye landlubber!
    error_code dd 0

section .bss
    ; A global variable for file descriptor, arrr!
    file_descriptor resd 1

section .text
    global _start

_start:
    ; Call the function to open the file, ye scurvy dog!
    call open_file
    ; Check if the file was opened successfully, arrr!
    cmp eax, -1
    je file_open_error

    ; Store the file descriptor in a global variable, matey!
    mov [file_descriptor], eax

    ; Call the function to delete the file, ye landlubber!
    call delete_file
    ; Check if the file was deleted successfully, arrr!
    cmp eax, -1
    je file_delete_error

    ; Call the function to exit the program, ye scallywag!
    call exit_program

file_open_error:
    ; Set the error code for file open error, arrr!
    mov dword [error_code], 1
    ; Call the function to exit the program, ye scurvy dog!
    call exit_program

file_delete_error:
    ; Set the error code for file delete error, matey!
    mov dword [error_code], 2
    ; Call the function to exit the program, ye landlubber!
    call exit_program

open_file:
    ; Open the file with read and write permissions, arrr!
    mov eax, 5
    mov ebx, filename
    mov ecx, 2
    mov edx, 0
    int 0x80
    ret

delete_file:
    ; Delete the file, ye scallywag!
    mov eax, 10
    mov ebx, filename
    int 0x80
    ret

exit_program:
    ; Exit the program with the error code, arrr!
    mov eax, 1
    mov ebx, [error_code]
    int 0x80
    ret

