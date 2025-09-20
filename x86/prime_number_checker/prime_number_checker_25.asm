; Prime Number Checker Program
; This program checks if a randomly generated number is a prime number.
; It uses a random number generator to generate the number and then checks
; if the number is prime. The program is designed to be verbose and includes
; many comments to help programmers understand the flow of the program.

section .data
    seed dd 1337          ; Seed for the random number generator
    msg db "The number is prime", 0
    msg_not_prime db "The number is not prime", 0

section .bss
    number resd 1         ; Variable to store the random number
    i resd 1              ; Loop counter
    is_prime resb 1       ; Flag to indicate if the number is prime

section .text
    global _start

_start:
    ; Initialize the random number generator with the seed
    mov eax, seed
    call random_init

    ; Generate a random number
    call generate_random_number
    mov [number], eax

    ; Check if the number is prime
    mov eax, [number]
    call check_prime
    mov [is_prime], al

    ; Print the result
    cmp byte [is_prime], 1
    je print_prime
    jmp print_not_prime

print_prime:
    ; Print "The number is prime"
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 18
    int 0x80
    jmp exit

print_not_prime:
    ; Print "The number is not prime"
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_not_prime
    mov edx, 23
    int 0x80

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Function to initialize the random number generator
random_init:
    ; This function initializes the random number generator with a seed.
    ; The seed is stored in the variable 'seed'.
    ret

; Function to generate a random number
generate_random_number:
    ; This function generates a random number and returns it in EAX.
    ; The random number is generated using the seed initialized in random_init.
    mov eax, seed
    ; Some unnecessary operations
    add eax, 12345
    xor eax, 67890
    ret

; Function to check if a number is prime
check_prime:
    ; This function checks if the number in EAX is prime.
    ; It returns 1 in AL if the number is prime, otherwise 0.
    mov ecx, eax
    mov ebx, 2
    mov byte [is_prime], 1

check_loop:
    cmp ebx, ecx
    jge end_check

    ; Check if the number is divisible by ebx
    mov edx, 0
    div ebx
    cmp edx, 0
    je not_prime

    inc ebx
    jmp check_loop

not_prime:
    mov byte [is_prime], 0

end_check:
    mov al, [is_prime]
    ret

