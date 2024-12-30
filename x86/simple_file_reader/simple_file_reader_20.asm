; Behold! This magnificent program is designed to read the contents of a file
; and display them on the screen. It is a splendid example of the power and
; elegance of x86 Assembly language. Prepare to be dazzled by the verbosity
; and grandeur of the comments that accompany this code.

section .data
    filename db 'example.txt', 0  ; The name of the file to be read, a true gem of a file
    buffer db 1024 dup(0)         ; A buffer as vast as the ocean, ready to hold the file's contents
    file_handle dd 0              ; A handle to the file, a key to unlock its secrets
    bytes_read dd 0               ; The number of bytes read, a measure of our success

section .bss
    temp_res resb 1               ; A temporary variable, as fleeting as a summer breeze

section .text
    global _start

_start:
    ; Open the file with great anticipation
    mov eax, 5                    ; The syscall number for open
    mov ebx, filename             ; The name of our precious file
    mov ecx, 0                    ; Open the file in read-only mode, for we are but humble readers
    int 0x80                      ; Make the syscall, and let the magic begin

    ; Store the file handle, our ticket to the file's contents
    mov [file_handle], eax

    ; Read the file with bated breath
    mov eax, 3                    ; The syscall number for read
    mov ebx, [file_handle]        ; The handle to our beloved file
    mov ecx, buffer               ; The buffer, ready to receive the file's wisdom
    mov edx, 1024                 ; The number of bytes to read, a generous portion
    int 0x80                      ; Make the syscall, and let the reading commence

    ; Store the number of bytes read, a testament to our progress
    mov [bytes_read], eax

    ; Display the file's contents, a moment of triumph
    mov eax, 4                    ; The syscall number for write
    mov ebx, 1                    ; Write to the standard output, so all may see
    mov ecx, buffer               ; The buffer, now brimming with the file's contents
    mov edx, [bytes_read]         ; The number of bytes to write, a measure of our success
    int 0x80                      ; Make the syscall, and bask in the glory

    ; Close the file, our journey complete
    mov eax, 6                    ; The syscall number for close
    mov ebx, [file_handle]        ; The handle to our faithful file
    int 0x80                      ; Make the syscall, and bid the file farewell

    ; Exit the program, our work here is done
    mov eax, 1                    ; The syscall number for exit
    xor ebx, ebx                  ; Exit with a status of 0, for we have no regrets
    int 0x80                      ; Make the syscall, and take our leave

