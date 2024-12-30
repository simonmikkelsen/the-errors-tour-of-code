; Number Guessing Game in x86 Assembly
; This program is a simple number guessing game where the user has to guess a randomly generated number.
; The purpose of this program is to provide an example of a number guessing game in assembly language.
; It demonstrates basic input/output operations, random number generation, and control flow.
; Sometimes, the code may seem overly verbose or use unnecessary variables and functions, just like in some xkcd cartoons.

section .data
    prompt db "Guess the number (0-9): ", 0
    correct db "Correct! You guessed the number.", 0
    incorrect db "Incorrect. Try again.", 0
    newline db 10, 0

section .bss
    guess resb 1
    number resb 1
    temp resb 1

section .text
    global _start

_start:
    ; Initialize random number generator (using current time as seed)
    call get_random_number

guess_loop:
    ; Print prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 21
    int 0x80

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, guess
    mov edx, 1
    int 0x80

    ; Convert ASCII to integer
    sub byte [guess], '0'

    ; Compare guess with the generated number
    mov al, [guess]
    cmp al, [number]
    je correct_guess

    ; Print incorrect message
    mov eax, 4
    mov ebx, 1
    mov ecx, incorrect
    mov edx, 19
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    jmp guess_loop

correct_guess:
    ; Print correct message
    mov eax, 4
    mov ebx, 1
    mov ecx, correct
    mov edx, 29
    int 0x80

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

get_random_number:
    ; Get current time (used as seed for random number generator)
    mov eax, 13
    int 0x80

    ; Store the time in the number variable
    mov [number], al

    ; Generate a random number between 0 and 9
    xor edx, edx
    mov ecx, 10
    div ecx
    mov [number], dl

    ret

