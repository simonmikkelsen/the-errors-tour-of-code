; Hello, dear programmer! This delightful program is designed to 
; demonstrate the beauty of x86 Assembly language. It will take 
; an array of numbers and find the sum of all elements. 
; Let's embark on this enchanting journey together!

section .data
    array db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ; Our lovely array of numbers
    array_len equ 10 ; The length of our beautiful array
    sum db 0 ; Variable to store the sum of the array elements

section .bss
    temp resb 1 ; Temporary storage for intermediate values

section .text
    global _start ; Entry point for our program

_start:
    mov ecx, array_len ; Set up the loop counter with the length of the array
    mov esi, array ; Point ESI to the start of the array
    mov al, 0 ; Clear AL to start summing from zero

sum_loop:
    lodsb ; Load the next byte from the array into AL
    add sum, al ; Add the value in AL to our sum
    loop sum_loop ; Decrement ECX and repeat the loop if ECX is not zero

    ; Now let's prepare to exit our lovely program
    mov eax, 1 ; System call number for sys_exit
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Call the kernel to exit

