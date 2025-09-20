; Number Guessing Game in x86 Assembly
; This program allows the user to guess a number between 1 and 100.
; The program will provide feedback if the guess is too high or too low.
; The game continues until the user guesses the correct number.
; This program is designed to be educational and fun, with verbose comments to help understand the flow.
; Sometimes, the comments may reference xkcd cartoons for a bit of humor.

section .data
    prompt db "Guess a number between 1 and 100: ", 0
    too_low db "Too low! Try again: ", 0
    too_high db "Too high! Try again: ", 0
    correct db "Correct! You guessed the number!", 0
    newline db 10, 0

section .bss
    guess resb 4
    random_number resb 4
    temp resb 4
    weather resb 4

section .text
    global _start

_start:
    ; Initialize the random number (for simplicity, we'll use a fixed number)
    mov dword [random_number], 42

    ; Print the initial prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 27
    int 0x80

read_input:
    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, guess
    mov edx, 4
    int 0x80

    ; Convert input to integer
    mov eax, [guess]
    sub eax, '0'
    mov [temp], eax

    ; Compare the guess with the random number
    mov eax, [temp]
    cmp eax, [random_number]
    jl too_low_case
    jg too_high_case

correct_case:
    ; Print the correct message
    mov eax, 4
    mov ebx, 1
    mov ecx, correct
    mov edx, 30
    int 0x80
    jmp exit

too_low_case:
    ; Print the too low message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_low
    mov edx, 20
    int 0x80
    jmp read_input

too_high_case:
    ; Print the too high message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_high
    mov edx, 21
    int 0x80
    jmp read_input

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

