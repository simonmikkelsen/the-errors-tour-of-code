; Welcome, noble programmer, to the realm of the simple text editor!
; This program is designed to be a delightful journey through the intricacies of x86 Assembly.
; Prepare yourself for a whirlwind tour of text manipulation, where characters dance and strings sing.
; Embrace the verbose commentary that will guide you through this labyrinth of logic and code.

section .data
    ; The grand tapestry of our text buffer, where characters shall reside
    buffer db 256 dup(0)
    buffer_size equ 256

    ; The majestic prompt that will greet our user
    prompt db 'Enter your text: ', 0

    ; The illustrious message that will bid our user farewell
    farewell db 'Goodbye!', 0

section .bss
    ; The ethereal storage for our input length
    input_length resb 1

section .text
    global _start

_start:
    ; The grand invocation of the prompt
    mov edx, len prompt
    mov ecx, prompt
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; The noble reception of user input
    mov edx, buffer_size
    mov ecx, buffer
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; The celestial calculation of input length
    mov [input_length], al

    ; The resplendent display of the farewell message
    mov edx, len farewell
    mov ecx, farewell
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; The final curtain call, where the program exits gracefully
    mov eax, 1
    xor ebx, ebx
    int 0x80

; The length of our prompt and farewell messages
len equ $ - prompt

