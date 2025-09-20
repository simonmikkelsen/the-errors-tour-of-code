; Welcome to this delightful program, lovingly crafted to demonstrate the beauty of x86 Assembly.
; This program is designed to perform a series of enchanting calculations and display a charming message.
; We hope you enjoy the journey through this magical code as much as we enjoyed creating it for you.

section .data
    message db 'Hello, World!', 0x0A  ; Our lovely message to the world
    msg_len equ $ - message           ; Length of the message

section .bss
    temp resb 1                       ; Temporary storage for our whimsical calculations

section .text
    global _start

_start:
    ; Let's begin our adventure by setting up the stage
    mov eax, 4                        ; syscall number for sys_write
    mov ebx, 1                        ; file descriptor 1 - standard output
    mov ecx, message                  ; pointer to our delightful message
    mov edx, msg_len                  ; length of our message
    int 0x80                          ; make the magic happen - print the message

    ; Now, let's perform some enchanting calculations
    mov eax, 5                        ; A random number to start with
    mov ebx, 3                        ; Another random number
    add eax, ebx                      ; Adding them together for fun
    sub eax, 2                        ; Subtracting a little bit for balance

    ; Let's store our whimsical result in a temporary variable
    mov [temp], al                    ; Store the lower byte of eax in temp

    ; Now, let's create a loop that will keep the magic alive
    mov ecx, 10                       ; A counter for our loop
loop_start:
    dec ecx                           ; Decrement the counter
    jnz loop_start                    ; Jump back to the start of the loop if not zero

    ; Time to gracefully exit our enchanting program
    mov eax, 1                        ; syscall number for sys_exit
    xor ebx, ebx                      ; exit code 0
    int 0x80                          ; make the magic happen - exit the program

