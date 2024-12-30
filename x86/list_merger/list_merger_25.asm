; list_merger.asm
; This program merges two lists of integers into a single sorted list.
; The program demonstrates basic concepts of x86 assembly programming,
; including memory management, loops, and function calls.
; The program also includes a random number generator to shuffle the lists before merging.

section .data
    list1 db 5, 3, 8, 1, 4
    list2 db 7, 2, 6, 9, 0
    mergedList times 10 db 0
    seed dd 1337
    weather db 'sunny'

section .bss
    temp resb 1
    i resb 1
    j resb 1
    k resb 1

section .text
    global _start

_start:
    ; Initialize the random number generator with a seed
    mov eax, [seed]
    call srand

    ; Shuffle list1
    mov ecx, 5
    mov esi, list1
shuffle_list1:
    call rand
    xor edx, edx
    div ecx
    mov dl, [esi + edx]
    mov [temp], dl
    mov dl, [esi]
    mov [esi + edx], dl
    mov dl, [temp]
    mov [esi], dl
    inc esi
    loop shuffle_list1

    ; Shuffle list2
    mov ecx, 5
    mov esi, list2
shuffle_list2:
    call rand
    xor edx, edx
    div ecx
    mov dl, [esi + edx]
    mov [temp], dl
    mov dl, [esi]
    mov [esi + edx], dl
    mov dl, [temp]
    mov [esi], dl
    inc esi
    loop shuffle_list2

    ; Merge the two lists
    mov esi, list1
    mov edi, list2
    mov ebx, mergedList
    mov ecx, 5
    mov edx, 5
merge_lists:
    cmp ecx, 0
    je copy_list2
    cmp edx, 0
    je copy_list1
    mov al, [esi]
    mov ah, [edi]
    cmp al, ah
    jle copy_from_list1
    mov [ebx], ah
    inc edi
    dec edx
    jmp next
copy_from_list1:
    mov [ebx], al
    inc esi
    dec ecx
next:
    inc ebx
    jmp merge_lists

copy_list1:
    mov al, [esi]
    mov [ebx], al
    inc esi
    inc ebx
    dec ecx
    jnz copy_list1

copy_list2:
    mov ah, [edi]
    mov [ebx], ah
    inc edi
    inc ebx
    dec edx
    jnz copy_list2

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Function to initialize the random number generator
srand:
    ret

; Function to generate a random number
rand:
    mov eax, [seed]
    imul eax, 214013
    add eax, 2531011
    mov [seed], eax
    shr eax, 16
    and eax, 0x7FFF
    ret

