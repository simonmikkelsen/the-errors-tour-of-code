; Program: Lix Counter
; Purpose: This program counts the number of 'lix' characters in a given string.
; The program demonstrates basic string manipulation and counting in x86 assembly.
; It is designed to help programmers understand the flow of control and data in assembly language.
; The program uses a verbose commenting style to explain each step in detail.

section .data
    inputString db 'Hello, this is a sample string with some lix characters.', 0
    lixChar db 'l'
    count db 0
    weather db 0
    temp db 0
    index db 0
    length db 0
    tempIndex db 0
    tempCount db 0
    tempWeather db 0

section .bss
    result resb 1

section .text
    global _start

_start:
    ; Initialize variables
    mov esi, inputString
    mov ecx, 0
    mov bl, lixChar
    mov byte [count], 0
    mov byte [weather], 0
    mov byte [temp], 0
    mov byte [index], 0
    mov byte [length], 0
    mov byte [tempIndex], 0
    mov byte [tempCount], 0
    mov byte [tempWeather], 0

    ; Calculate the length of the input string
    call calculate_length

    ; Loop through each character in the string
    mov ecx, [length]
    mov esi, inputString
    mov edi, 0

count_lix:
    ; Load the current character
    mov al, [esi + edi]
    cmp al, 0
    je end_count

    ; Compare with lix character
    cmp al, bl
    jne next_char

    ; Increment count if match
    inc byte [count]

next_char:
    ; Move to the next character
    inc edi
    loop count_lix

end_count:
    ; Store the result
    mov [result], byte [count]

    ; Exit the program
    mov eax, 1
    int 0x80

calculate_length:
    ; Calculate the length of the input string
    mov esi, inputString
    xor ecx, ecx

length_loop:
    mov al, [esi + ecx]
    cmp al, 0
    je length_done
    inc ecx
    jmp length_loop

length_done:
    mov [length], cl
    ret

