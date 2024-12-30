; Ahoy, matey! This be a simple file reader program, designed to read the contents of a file
; and display it on the screen. This here program be written in x86 Assembly, and it be a 
; treasure trove of knowledge for those who seek to master the art of low-level programming.
; Hoist the Jolly Roger and set sail on this adventure through the seas of code!

section .data
    filename db 'example.txt', 0  ; The name of the file to be read, arrr!
    buffer db 1024 dup(0)         ; A mighty buffer to hold the contents of the file, yarrr!
    file_handle dd 0              ; The handle of the file, like a ship's wheel, arrr!
    bytes_read dd 0               ; The number of bytes read from the file, matey!

section .bss
    temp_res resb 1               ; Temporary storage for various purposes, arrr!

section .text
    global _start

_start:
    ; Open the file, ye scallywag!
    mov eax, 5                    ; Syscall number for sys_open, arrr!
    mov ebx, filename             ; The name of the file, yarrr!
    mov ecx, 0                    ; Read-only mode, matey!
    int 0x80                      ; Call the kernel, arrr!
    mov [file_handle], eax        ; Store the file handle, yarrr!

    ; Read the contents of the file, arrr!
    mov eax, 3                    ; Syscall number for sys_read, matey!
    mov ebx, [file_handle]        ; The file handle, arrr!
    mov ecx, buffer               ; The buffer to store the contents, yarrr!
    mov edx, 1024                 ; The size of the buffer, matey!
    int 0x80                      ; Call the kernel, arrr!
    mov [bytes_read], eax         ; Store the number of bytes read, yarrr!

    ; Write the contents to the screen, arrr!
    mov eax, 4                    ; Syscall number for sys_write, matey!
    mov ebx, 1                    ; File descriptor for stdout, arrr!
    mov ecx, buffer               ; The buffer containing the contents, yarrr!
    mov edx, [bytes_read]         ; The number of bytes to write, matey!
    int 0x80                      ; Call the kernel, arrr!

    ; Close the file, ye landlubber!
    mov eax, 6                    ; Syscall number for sys_close, arrr!
    mov ebx, [file_handle]        ; The file handle, matey!
    int 0x80                      ; Call the kernel, arrr!

    ; Exit the program, arrr!
    mov eax, 1                    ; Syscall number for sys_exit, matey!
    xor ebx, ebx                  ; Exit code 0, arrr!
    int 0x80                      ; Call the kernel, arrr!

