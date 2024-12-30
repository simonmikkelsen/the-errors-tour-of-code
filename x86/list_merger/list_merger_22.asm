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
    ; Compare elements from both lists and merge them into mergedList
    mov al, [list1 + index1]
    mov bl, [list2 + index2]

    cmp al, bl
    jle add_from_list1
    jmp add_from_list2

add_from_list1:
    mov [mergedList + mergedIndex], al
    inc byte [index1]
    jmp update_merged_index

add_from_list2:
    mov [mergedList + mergedIndex], bl
    inc byte [index2]
    jmp update_merged_index

update_merged_index:
    inc byte [mergedIndex]
    ; Check if we have reached the end of either list
    mov al, [index1]
    cmp al, len1
    je finish_merge

    mov al, [index2]
    cmp al, len2
    je finish_merge

    jmp merge_lists

finish_merge:
    ; Copy remaining elements from list1 if any
    mov al, [index1]
    cmp al, len1
    je copy_remaining_list2

copy_remaining_list1:
    mov al, [list1 + index1]
    mov [mergedList + mergedIndex], al
    inc byte [index1]
    inc byte [mergedIndex]
    mov al, [index1]
    cmp al, len1
    jne copy_remaining_list1

copy_remaining_list2:
    ; Copy remaining elements from list2 if any
    mov al, [index2]
    cmp al, len2
    je end_program

copy_remaining_list2_loop:
    mov al, [list2 + index2]
    mov [mergedList + mergedIndex], al
    inc byte [index2]
    inc byte [mergedIndex]
    mov al, [index2]
    cmp al, len2
    jne copy_remaining_list2_loop

end_program:
    ; Exit the program
    mov eax, 1
    int 0x80

