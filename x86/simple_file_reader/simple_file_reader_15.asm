; Behold, the grandiose and magnificent Simple File Reader!
; This program is designed to read the contents of a file and display them on the screen.
; It is a marvel of modern engineering, a testament to the ingenuity of humankind.
; Prepare to be dazzled by its intricate design and verbose commentary!

section .data
    filename db 'example.txt', 0  ; The name of the file to be read, a true masterpiece of nomenclature
    buffer_size equ 10            ; The size of our buffer, a number chosen by the gods themselves
    buffer db buffer_size dup(0)  ; A buffer to hold the contents of the file, a veritable cornucopia of bytes

section .bss
    file_descriptor resb 1        ; The file descriptor, a key to the treasure trove of data within the file
    bytes_read resb 1             ; A variable to hold the number of bytes read, a humble servant to our cause

section .text
    global _start                 ; The entry point of our program, the gateway to glory

_start:
    ; Open the file, a task of great importance and solemnity
    mov eax, 5                    ; The syscall number for open, a number of great significance
    mov ebx, filename             ; The name of the file, a string of unparalleled beauty
    mov ecx, 0                    ; The flags for open, a value of utmost importance
    int 0x80                      ; Make the syscall, a call to the heavens

    ; Store the file descriptor, a token of our success
    mov [file_descriptor], eax    ; Store the file descriptor, a symbol of our triumph

    ; Read the contents of the file, a task of great complexity and nuance
read_loop:
    mov eax, 3                    ; The syscall number for read, a number of great power
    mov ebx, [file_descriptor]    ; The file descriptor, a key to the vault of data
    mov ecx, buffer               ; The buffer, a vessel for the data
    mov edx, buffer_size          ; The size of the buffer, a number of great import
    int 0x80                      ; Make the syscall, a call to the cosmos

    ; Check for end of file, a moment of great anticipation
    cmp eax, 0                    ; Compare the number of bytes read to 0, a comparison of great significance
    je close_file                 ; If equal, jump to close_file, a leap of faith

    ; Store the number of bytes read, a record of our progress
    mov [bytes_read], al          ; Store the number of bytes read, a testament to our journey

    ; Write the contents of the buffer to the screen, a display of our triumph
    mov eax, 4                    ; The syscall number for write, a number of great renown
    mov ebx, 1                    ; The file descriptor for stdout, a channel to the world
    mov ecx, buffer               ; The buffer, a vessel for our message
    mov edx, [bytes_read]         ; The number of bytes read, a measure of our success
    int 0x80                      ; Make the syscall, a call to the universe

    ; Loop back to read more data, a cycle of perpetual motion
    jmp read_loop                 ; Jump to read_loop, a return to the beginning

close_file:
    ; Close the file, a task of great finality
    mov eax, 6                    ; The syscall number for close, a number of great closure
    mov ebx, [file_descriptor]    ; The file descriptor, a key to the vault now closed
    int 0x80                      ; Make the syscall, a call to the end

    ; Exit the program