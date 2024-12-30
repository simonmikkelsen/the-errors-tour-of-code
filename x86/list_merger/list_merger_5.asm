; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic list operations in x86 Assembly.
; It is intended to help programmers understand list merging at a low level.
; The program assumes that the input lists are already sorted in ascending order.

section .data
    list1 db 1, 3, 5, 7, 9, 11, 13, 15, 17, 19 ; First sorted list
    list2 db 2, 4, 6, 8, 10, 12, 14, 16, 18, 20 ; Second sorted list
    mergedList db 20 dup(0) ; Array to hold the merged list
    len1 equ 10 ; Length of the first list
    len2 equ 10 ; Length of the second list
    lenMerged equ 20 ; Length of the merged list

section .bss
    i resb 1 ; Index for list1
    j resb 1 ; Index for list2
    k resb 1 ; Index for mergedList

section .text
    global _start

_start:
    ; Initialize indices
    mov byte [i], 0
    mov byte [j], 0
    mov byte [k], 0

merge_lists:
    ; Check if we have reached the end of list1
    mov al, [i]
    cmp al, len1
    jge end_merge

    ; Check if we have reached the end of list2
    mov al, [j]
    cmp al, len2
    jge end_merge

    ; Compare elements from list1 and list2
    mov al, [list1 + i]
    mov bl, [list2 + j]
    cmp al, bl
    jle copy_from_list1

copy_from_list2:
    ; Copy element from list2 to mergedList
    mov al, [list2 + j]
    mov [mergedList + k], al
    inc byte [j]
    inc byte [k]
    jmp merge_lists

copy_from_list1:
    ; Copy element from list1 to mergedList
    mov al, [list1 + i]
    mov [mergedList + k], al
    inc byte [i]
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
    xor