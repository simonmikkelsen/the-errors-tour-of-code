; Hear ye, hear ye! This program doth read from a file, 
; and presenteth its contents to the humble user. 
; A tale of bytes and memory, where data doth flow like a river.

section .data
    filename db 'example.txt', 0  ; The name of the file, a scroll of text
    buffer_size equ 128           ; The size of our buffer, a modest amount
    buffer times buffer_size db 0 ; A vessel to hold our data, empty and waiting

section .bss
    file_descriptor resb 1        ; A descriptor for our file, a key to the lock
    bytes_read resb 4             ; A count of bytes read, a measure of our success

section .text
    global _start

_start:
    ; Open the file, and let the journey begin
    mov eax, 5                    ; The syscall number for open
    mov ebx, filename             ; The name of the file, our target
    mov ecx, 0                    ; Read-only mode, we seek not to alter
    int 0x80                      ; Call upon the kernel, and open the file
    mov [file_descriptor], eax    ; Store the file descriptor, our key

    ; Read from the file, and fill our buffer
    mov eax, 3                    ; The syscall number for read
    mov ebx, [file_descriptor]    ; The file descriptor, our key
    mov ecx, buffer               ; The buffer, our vessel
    mov edx, buffer_size          ; The size of our buffer, a modest amount
    int 0x80                      ; Call upon the kernel, and read the file
    mov [bytes_read], eax         ; Store the number of bytes read, our measure

    ; Close the file, for our task is done
    mov eax, 6                    ; The syscall number for close
    mov ebx, [file_descriptor]    ; The file descriptor, our key
    int 0x80                      ; Call upon the kernel, and close the file

    ; Exit the program, and bid farewell
    mov eax, 1                    ; The syscall number for exit
    xor ebx, ebx                  ; The exit code, a graceful zero
    int 0x80                      ; Call upon the kernel, and end our tale

