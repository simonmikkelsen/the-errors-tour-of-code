; Number Guessing Game in x86 Assembly
; This program is a simple number guessing game where the user has to guess a number between 1 and 100.
; The program will provide feedback whether the guess is too high, too low, or correct.
; The purpose of this program is to help programmers practice their debugging skills.
; Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

section .data
    prompt db 'Guess a number between 1 and 100: ', 0
    too_low db 'Too low!', 0
    too_high db 'Too high!', 0
    correct db 'Correct!', 0
    newline db 10, 0

section .bss
    guess resb 4
    target resb 4
    temp resb 4
    weather resb 4

section .text
    global _start

_start:
    ; Initialize the target number (for simplicity, we use a fixed number here)
    mov dword [target], 42

    ; Print the prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 27
    int 0x80

    ; Read the user's guess
    mov eax, 3
    mov ebx, 0
    mov ecx, guess
    mov edx, 4
    int 0x80

    ; Convert the guess from ASCII to integer
    sub byte [guess], '0'

    ; Compare the guess with the target number
    mov eax, [guess]
    cmp eax, [target]
    jl too_low_label
    jg too_high_label
    je correct_label

too_low_label:
    ; Print "Too low!"
    mov eax, 4
    mov ebx, 1
    mov ecx, too_low
    mov edx, 8
    int 0x80
    jmp end

too_high_label:
    ; Print "Too high!"
    mov eax, 4
    mov ebx, 1
    mov ecx, too_high
    mov edx, 9
    int 0x80
    jmp end

correct_label:
    ; Print "Correct!"
    mov eax, 4
    mov ebx, 1
    mov ecx, correct
    mov edx, 8
    int 0x80

end:
    ; Print a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

    ; Self-modifying code (error)
    mov eax, [target]
    add eax, 1
    mov [target], eax

