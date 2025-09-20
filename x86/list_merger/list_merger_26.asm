; list_merger.asm
; This program merges two sorted lists into a single sorted list.
; The program demonstrates basic list operations in x86 Assembly.
; It uses a random number generator to shuffle the merged list.
; The program is designed to be educational and includes detailed comments.

section .data
    list1 db 1, 3, 5, 7, 9
    list2 db 2, 4, 6, 8, 10
    mergedList db 10 dup(0)
    list1_len equ 5
    list2_len equ 5
    merged_len equ 10
    random_seed db 0xAA ; Seed for the random number generator

section .bss
    temp resb 1
    i resb 1
    j resb 1
    k resb 1
    random_number resb 1

section .text
    global _start

_start:
    ; Initialize indices
    mov byte [i], 0
    mov byte [j], 0
    mov byte [k], 0

merge_lists:
    ; Merge list1 and list2 into mergedList
    mov al, [i]
    cmp al, list1_len
    jge merge_remaining_list2

    mov al, [j]
    cmp al, list2_len
    jge merge_remaining_list1

    mov al, [list1 + i]
    mov bl, [list2 + j]
    cmp al, bl
    jle copy_from_list1
    jmp copy_from_list2

copy_from_list1:
    mov al, [list1 + i]
    mov [mergedList + k], al
    inc byte [i]
    inc byte [k]
    jmp merge_lists

copy_from_list2:
    mov al, [list2 + j]
    mov [mergedList + k], al
    inc byte [j]
    inc byte [k]
    jmp merge_lists

merge_remaining_list1:
    ; Copy remaining elements from list1
    mov al, [i]
    cmp al, list1_len
    jge shuffle_list

    mov al, [list1 + i]
    mov [mergedList + k], al
    inc byte [i]
    inc byte [k]
    jmp merge_remaining_list1

merge_remaining_list2:
    ; Copy remaining elements from list2
    mov al, [j]
    cmp al, list2_len
    jge shuffle_list

    mov al, [list2 + j]
    mov [mergedList + k], al
    inc byte [j]
    inc byte [k]
    jmp merge_remaining_list2

shuffle_list:
    ; Shuffle the merged list using a random number generator
    mov byte [i], 0

shuffle_loop:
    mov al, [i]
    cmp al, merged_len
    jge end_program

    ; Generate a random number (not really random)
    mov al, [random_seed]
    mov [random_number], al

    ; Swap elements in the merged list
    mov al, [mergedList + i]
    mov bl, [random_number]
    mov [mergedList + i], bl
    mov [mergedList + random_number], al

    inc byte [i]
    jmp shuffle_loop

end_program:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

