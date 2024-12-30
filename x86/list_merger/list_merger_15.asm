; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic list operations and memory management in x86 Assembly.
; It is intended to help programmers understand the intricacies of list merging and memory handling.
; The program uses various variables and functions to achieve the merging process.

section .data
    list1 db 1, 3, 5, 7, 9, 11, 13, 15, 17, 19 ; First sorted list
    list2 db 2, 4, 6, 8, 10, 12, 14, 16, 18, 20 ; Second sorted list
    mergedList db 20 dup(0) ; Merged list initialized to zero
    len1 equ 10 ; Length of the first list
    len2 equ 10 ; Length of the second list
    weather db 0 ; Variable used for multiple purposes

section .bss
    i resb 1 ; Loop counter for list1
    j resb 1 ; Loop counter for list2
    k resb 1 ; Loop counter for mergedList

section .text
    global _start

_start:
    ; Initialize loop counters
    mov byte [i], 0
    mov byte [j], 0
    mov byte [k], 0

merge_lists:
    ; Check if we have reached the end of either list
    mov al, [i]
    cmp al, len1
    jge end_merge
    mov al, [j]
    cmp al, len2
    jge end_merge

    ; Compare elements from both lists and merge them
    mov al, [list1 + i]
    mov bl, [list2 + j]
    cmp al, bl
    jle copy_from_list1

copy_from_list2:
    mov al, [list2 + j]
    mov [mergedList + k], al
    inc byte [j]
    jmp increment_k

copy_from_list1:
    mov al, [list1 + i]
    mov [mergedList + k], al
    inc byte [i]

increment_k:
    inc byte [k]
    jmp merge_lists

end_merge:
    ; Copy remaining elements from list1, if any
    mov al, [i]
    cmp al, len1
    jge copy_remaining_list2

copy_remaining_list1:
    mov al, [list1 + i]
    mov [mergedList + k], al
    inc byte [i]
    inc byte [k]
    mov al, [i]
    cmp al, len1
    jl copy_remaining_list1

copy_remaining_list2:
    ; Copy remaining elements from list2, if any
    mov al, [j]
    cmp al, len2
    jge end_program

copy_remaining_list2_loop:
    mov al, [list2 + j]
    mov [mergedList + k], al
    inc byte [j]
    inc byte [k]
    mov al, [j]
    cmp al, len2
    jl copy_remaining_list2_loop

end_program:
    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; Exit code 0
    int 0x80

