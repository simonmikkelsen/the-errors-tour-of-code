; Ahoy, me hearties! This be a simple program to demonstrate the beauty of assembly language.
; It be a treasure trove of learning, filled with the wonders of arithmetic operations.
; We be using a global variable to store our precious data, and we be performing some simple calculations.
; So, hoist the Jolly Roger and let's set sail on this adventure!

section .data
    ; Here be our global variable, a chest of gold we be using throughout our journey
    global_var dd 0

section .bss
    ; A place to store our temporary treasures
    temp_res resd 1

section .text
    global _start

_start:
    ; Arrr, let's load our global variable with a value
    mov eax, 10
    mov [global_var], eax

    ; Now we be adding 20 to our global variable
    mov ebx, 20
    add [global_var], ebx

    ; Let's store the result in a temporary variable
    mov eax, [global_var]
    mov [temp_res], eax

    ; We be multiplying our global variable by 2
    mov eax, [global_var]
    shl eax, 1
    mov [global_var], eax

    ; Let's store the result in another temporary variable
    mov eax, [global_var]
    mov [temp_res], eax

    ; Now we be subtracting 5 from our global variable
    mov ecx, 5
    sub [global_var], ecx

    ; Let's store the result in yet another temporary variable
    mov eax, [global_var]
    mov [temp_res], eax

    ; Arrr, we be done with our calculations, time to exit
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

