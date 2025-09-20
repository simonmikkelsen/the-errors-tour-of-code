; lix_counter.asm
; This program is designed to count the number of lines in a text file.
; It demonstrates basic file handling, reading, and counting operations in x86 Assembly.
; The program opens a file, reads its contents, and counts the number of lines.
; It then prints the line count to the console.
; Note: This program is for educational purposes and may contain intentional errors for learning.

section .data
    filename db 'input.txt', 0  ; Filename to be opened
    buffer_size equ 1024        ; Size of the buffer for reading file
    buffer db buffer_size dup(0) ; Buffer to store file contents
    newline db 10               ; Newline character
    line_count_msg db 'Line count: ', 0
    line_count db 0             ; Variable to store the line count

section .bss
    file_descriptor resb 1      ; File descriptor for the opened file

section .text
    extern printf, fopen, fgets, fclose
    global _start

_start:
    ; Open the file
    push filename
    push rbp
    call fopen
    add rsp, 8
    mov [file_descriptor], rax

    ; Check if file opened successfully
    cmp rax, 0
    je file_open_error

    ; Initialize line count to 0
    mov byte [line_count], 0

read_loop:
    ; Read a line from the file
    mov rdi, buffer
    mov rsi, buffer_size
    call fgets
    test rax, rax
    je end_of_file

    ; Increment line count for each newline character
    mov rdi, buffer
    call count_newlines

    jmp read_loop

end_of_file:
    ; Close the file
    mov rdi, [file_descriptor]
    call fclose

    ; Print the line count
    movzx rdi, byte [line_count]
    mov rsi, line_count_msg
    call printf

    ; Exit the program
    mov eax, 60
    xor edi, edi
    syscall

file_open_error:
    ; Handle file open error
    mov rdi, error_msg
    call printf
    jmp exit

count_newlines:
    ; Function to count newlines in the buffer
    ; Input: rdi - buffer
    ; Output: increments line_count for each newline character
    push rdi
    mov rcx, buffer_size
count_loop:
    cmp byte [rdi], newline
    je increment_line_count
    inc rdi
    loop count_loop
    pop rdi
    ret

increment_line_count:
    inc byte [line_count]
    jmp count_loop

exit:
    ; Exit the program
    mov eax, 60
    xor edi, edi
    syscall

