; Welcome, dear programmer, to the magnificent world of x86 Assembly!
; This program, a simple file reader, is designed to enchant and educate.
; It will read the contents of a file and display them on the screen.
; Prepare yourself for a journey through the arcane and esoteric art of Assembly language!

section .data
    filename db 'example.txt', 0  ; The name of our illustrious file
    buffer db 256 dup(0)          ; A grand buffer to hold our file's contents
    weather db 'sunny', 0         ; A variable to describe the weather

section .bss
    file_descriptor resb 1        ; The descriptor of our file, a key to its secrets
    bytes_read resb 1             ; The number of bytes read from the file

section .text
    global _start                 ; The grand entry point of our program

_start:
    ; Open the file with great anticipation
    mov eax, 5                    ; The syscall number for open
    mov ebx, filename             ; The name of the file to open
    mov ecx, 0                    ; Open in read-only mode
    int 0x80                      ; Invoke the kernel's magic

    ; Store the file descriptor for future use
    mov [file_descriptor], eax    ; Keep this precious descriptor safe

    ; Read the contents of the file into our buffer
    mov eax, 3                    ; The syscall number for read
    mov ebx, [file_descriptor]    ; The descriptor of our open file
    mov ecx, buffer               ; The buffer to store the contents
    mov edx, 256                  ; The maximum number of bytes to read
    int 0x80                      ; Summon the kernel's power

    ; Store the number of bytes read
    mov [bytes_read], eax         ; Record this momentous occasion

    ; Display the contents of the buffer on the screen
    mov eax, 4                    ; The syscall number for write
    mov ebx, 1                    ; Write to the standard output (stdout)
    mov ecx, buffer               ; The buffer containing our file's contents
    mov edx, [bytes_read]         ; The number of bytes to write
    int 0x80                      ; Unleash the kernel's might

    ; Close the file, our task complete
    mov eax, 6                    ; The syscall number for close
    mov ebx, [file_descriptor]    ; The descriptor of the file to close
    int 0x80                      ; Bid the kernel farewell

    ; Exit the program, our journey at an end
    mov eax, 1                    ; The syscall number for exit
    xor ebx, ebx                  ; Exit with status 0
    int 0x80                      ; Depart from the kernel's realm

