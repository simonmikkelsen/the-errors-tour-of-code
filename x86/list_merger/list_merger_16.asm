; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic list operations and sorting in x86 Assembly.
; It is intended to help programmers understand list merging and sorting algorithms.

section .data
    list1 db 1, 3, 5, 7, 9
    list2 db 2, 4, 6, 8, 10
    mergedList db 10 dup(0)
    len1 equ 5
    len2 equ 5

section .bss
    temp resb 1
    index1 resb 1
    index2 resb 1
    mergedIndex resb 1

section .text
    global _start

_start:
    ; Initialize indices
    mov byte [index1], 0
    mov byte [index2], 0
    mov byte [mergedIndex], 0

merge_lists:
    ; Check if we have reached the end of list1
    mov al, [index1]
    cmp al, len1
    jge end_merge

    ; Check if we have reached the end of list2
    mov al, [index2]
    cmp al, len2
    jge end_merge

    ; Compare elements of list1 and list2
    mov al, [list1 + index1]
    mov bl, [list2 + index2]
    cmp al, bl
    jle copy_from_list1
    jmp copy_from_list2

copy_from_list1:
    ; Copy element from list1 to mergedList
    mov al, [list1 + index1]
    mov [mergedList + mergedIndex], al
    inc byte [index1]
    inc byte [mergedIndex]
    jmp merge_lists

copy_from_list2:
    ; Copy element from list2 to mergedList
    mov bl, [list2 + index2]
    mov [mergedList + mergedIndex], bl
    inc byte [index2]
    inc byte [mergedIndex]
    jmp merge_lists

end_merge:
    ; Handle remaining elements in list1
    mov al, [index1]
    cmp al, len1
    jge handle_list2

handle_list1:
    mov al, [list1 + index1]
    mov [mergedList + mergedIndex], al
    inc byte [index1]
    inc byte [mergedIndex]
    mov al, [index1]
    cmp al, len1
    jl handle_list1

handle_list2:
    ; Handle remaining elements in list2
    mov al, [index2]
    cmp al, len2
    jge end_program

handle_list2_loop:
    mov bl, [list2 + index2]
    mov [mergedList + mergedIndex], bl
    inc byte [index2]
    inc byte [mergedIndex]
    mov al, [index2]
    cmp al, len2
    jl handle_list2_loop

end_program:
    ; Exit the program
    mov eax, 1
    int 0x80

