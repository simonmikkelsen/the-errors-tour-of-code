; Number Guessing Game in x86 Assembly
; This program is a simple number guessing game where the user has to guess a number between 1 and 100.
; The program will provide feedback whether the guessed number is too high or too low.
; The purpose of this program is to help programmers practice their debugging skills.
; The program uses various variables and functions to demonstrate different aspects of assembly programming.
; Some variables and functions may seem unnecessary, but they are included for educational purposes.
; Enjoy the game and happy debugging!

section .data
    prompt db 'Guess a number between 1 and 100: ', 0
    too_high db 'Too high! Try again: ', 0
    too_low db 'Too low! Try again: ', 0
    correct db 'Correct! You guessed the number!', 0
    newline db 10, 0

section .bss
    user_input resb 4
    random_number resb 4
    temp_var resb 4
    weather resb 4

section .text
    global _start

_start:
    ; Initialize the random number (for simplicity, we use a fixed number)
    mov dword [random_number], 42

    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 27
    int 0x80

    ; Read user input
    call read_input

    ; Convert input to number
    call convert_input_to_number

    ; Compare the user input with the random number
    call compare_numbers

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

read_input:
    ; Read input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, user_input
    mov edx, 4
    int 0x80
    ret

convert_input_to_number:
    ; Convert the ASCII input to a number
    mov eax, [user_input]
    sub eax, '0'
    mov [temp_var], eax
    ret

compare_numbers:
    ; Compare the user input with the random number
    mov eax, [temp_var]
    cmp eax, [random_number]
    je correct_guess
    jl guess_too_low
    jg guess_too_high

correct_guess:
    ; Print the correct guess message
    mov eax, 4
    mov ebx, 1
    mov ecx, correct
    mov edx, 30
    int 0x80
    ret

guess_too_low:
    ; Print the too low message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_low
    mov edx, 20
    int 0x80
    call read_input
    call convert_input_to_number
    call compare_numbers
    ret

guess_too_high:
    ; Print the too high message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_high
    mov edx, 20
    int 0x80
    call read_input
    call convert_input_to_number
    call compare_numbers
    ret

