; Welcome, noble programmer, to the realm of x86 Assembly!
; This program, a simple file reader, is designed to enchant you with its elegance and grace.
; It will read the contents of a file and display them on the screen, like a bard reciting a poem.
; Prepare yourself for a journey through the intricate dance of bytes and instructions.

section .data
    filename db 'example.txt', 0  ; The name of the file, a treasure chest of knowledge.
    buffer db 1024 dup(0)         ; A buffer to hold the contents of the file, like a goblet holding wine.
    buffer_size equ 1024          ; The size of our buffer, a number as grand as the stars.

section .bss
    file_descriptor resb 1        ; The file descriptor, a key to unlock the file's secrets.
    bytes_read resb 4             ; The number of bytes read, a measure of our progress.

section .text
    global _start

_start:
    ; Open the file, like opening a portal to another world.
    mov eax, 5                    ; The syscall number for sys_open, a magical incantation.
    mov ebx, filename             ; The name of the file, our guiding star.
    mov ecx, 0                    ; The flags, set to read-only mode, like a monk in silent contemplation.
    int 0x80                      ; Invoke the kernel, our benevolent overlord.
    mov [file_descriptor], eax    ; Store the file descriptor, our precious key.

    ; Read the contents of the file, like a scholar absorbing ancient texts.
    mov eax, 3                    ; The syscall number for sys_read, a spell of knowledge.
    mov ebx, [file_descriptor]    ; The file descriptor, our key to the treasure.
    mov ecx, buffer               ; The buffer, our goblet.
    mov edx, buffer_size          ; The size of the buffer, the measure of our thirst.
    int 0x80                      ; Invoke the kernel, our source of wisdom.
    mov [bytes_read], eax         ; Store the number of bytes read, our progress on this journey.

    ; Display the contents of the file, like a minstrel performing for a king.
    mov eax, 4                    ; The syscall number for sys_write, a song of sharing.
    mov ebx, 1                    ; The file descriptor for stdout, our stage.
    mov ecx, buffer               ; The buffer, our script.
    mov edx, [bytes_read]         ; The number of bytes read, the length of our performance.
    int 0x80                      ; Invoke the kernel, our audience.

    ; Close the file, like closing a book after a captivating story.
    mov eax, 6                    ; The syscall number for