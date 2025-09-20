; This program, a simple file writer, is designed to demonstrate the art of writing to a file using x86 Assembly.
; It showcases the elegance and precision of low-level programming, akin to the craftsmanship of a master blacksmith.
; The program opens a file, writes a message, and then closes the file, all while dancing through the intricate steps of Assembly language.

section .data
    ; The file name, a string of characters, like a delicate thread of silk.
    filename db 'output.txt', 0
    ; The message to be written, a sonnet in binary form.
    message db 'Hello, World!', 0
    ; The length of the message, counted with the precision of a jeweler.
    msg_len equ $ - message

section .bss
    ; A file descriptor, a handle to the world of data.
    fd resb 4

section .text
    global _start

_start:
    ; Open the file, like opening the gates to a castle.
    mov eax, 5          ; syscall number for sys_open
    mov ebx, filename   ; the name of the file, a key to the gate
    mov ecx, 2          ; flags: O_WRONLY
    mov edx, 0644       ; mode: rw-r--r--
    int 0x80            ; interrupt to make the request
    mov [fd], eax       ; store the file descriptor, a token of entry

    ; Write the message, inscribing our words onto the parchment.
    mov eax, 4          ; syscall number for sys_write
    mov ebx, [fd]       ; the file descriptor, our quill
    mov ecx, message    ; the message, our ink
    mov edx, msg_len    ; the length of the message, the breadth of our stroke
    int 0x80            ; interrupt to make the request

    ; Close the file, sealing our words within.
    mov eax, 6          ; syscall number for sys_close
    mov ebx, [fd]       ; the file descriptor, our seal
    int 0x80            ; interrupt to make the request

    ; Exit the program, like a knight riding off into the sunset.
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0, a peaceful end
    int 0x80            ; interrupt to make the request

