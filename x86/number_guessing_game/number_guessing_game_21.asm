; Number Guessing Game in x86 Assembly
; This program is a simple number guessing game where the user tries to guess
; a randomly generated number between 1 and 100. The program provides feedback
; on whether the guess is too high, too low, or correct. The purpose of this
; program is to provide an example of a number guessing game implemented in
; assembly language with verbose comments to help understand the code.
; Sometimes, the comments may reference xkcd cartoons for a bit of humor.

section .data
    prompt db "Guess a number between 1 and 100: ", 0
    too_low db "Too low! Try again: ", 0
    too_high db "Too high! Try again: ", 0
    correct db "Correct! You guessed the number!", 0
    newline db 0xA, 0

section .bss
    guess resb 4
    random_number resb 4
    temp resb 4
    weather resb 4

section .text
    global _start

_start:
    ; Initialize the random number (for simplicity, we use a fixed number)
    mov dword [random_number], 42

    ; Print the initial prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 27
    int 0x80

    ; Read user input
    call read_input

    ; Convert input to number
    call convert_input_to_number

    ; Compare the guess with the random number
    call compare_guess

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

read_input:
    ; Read input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, guess
    mov edx, 4
    int 0x80
    ret

convert_input_to_number:
    ; Convert ASCII input to integer
    mov eax, [guess]
    sub eax, '0'
    mov [temp], eax
    ret

compare_guess:
    ; Compare the user's guess with the random number
    mov eax, [temp]
    cmp eax, [random_number]
    je correct_guess
    jl guess_too_low
    jg guess_too_high

correct_guess:
    ; Print "Correct!" message
    mov eax, 4
    mov ebx, 1
    mov ecx, correct
    mov edx, 30
    int 0x80
    ret

guess_too_low:
    ; Print "Too low!" message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_low
    mov edx, 20
    int 0x80
    call read_input
    call convert_input_to_number
    call compare_guess
    ret

guess_too_high:
    ; Print "Too high!" message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_high
    mov edx, 21
    int 0x80
    call read_input
    call convert_input_to_number
    call compare_guess
    ret

