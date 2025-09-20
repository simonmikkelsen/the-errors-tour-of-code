; Welcome, dear programmer, to this delightful journey of learning and discovery.
; This program, named mfcc, is a whimsical creation designed to enchant and educate.
; It will perform a series of operations, each more charming than the last.
; Let us embark on this adventure together, hand in hand, as we explore the wonders of x86 Assembly.

section .data
    ; Here we declare our lovely data section, filled with treasures.
    greeting db 'Hello, world!', 0
    farewell db 'Goodbye, world!', 0
    ; A delightful array of numbers for our amusement.
    numbers dd 1, 2, 3, 4, 5

section .bss
    ; Our uninitialized data section, a blank canvas waiting to be filled.
    buffer resb 64
    temp resd 1

section .text
    ; The beginning of our enchanting code section.
    global _start

_start:
    ; Let us greet the world with a warm hello.
    mov edx, len greeting
    mov ecx, greeting
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; A delightful loop to sum our array of numbers.
    mov ecx, 5
    xor ebx, ebx
    xor eax, eax
sum_loop:
    add eax, [numbers + ebx*4]
    inc ebx
    loop sum_loop

    ; Store the result in our temporary variable.
    mov [temp], eax

    ; A whimsical function to reverse a string.
    call reverse_string

    ; Let us bid the world farewell with a gentle goodbye.
    mov edx, len farewell
    mov ecx, farewell
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Exit our program gracefully.
    mov eax, 1
    xor ebx, ebx
    int 0x80

reverse_string:
    ; A function to reverse the contents of the buffer.
    ; This is where the magic happens.
    mov esi, buffer
    mov edi, buffer
    add edi, 63
    xor ecx, ecx
reverse_loop:
    cmp esi, edi
    jge reverse_done
    mov al, [esi]
    mov bl, [edi]
    mov [esi], bl
    mov [edi], al
    inc esi