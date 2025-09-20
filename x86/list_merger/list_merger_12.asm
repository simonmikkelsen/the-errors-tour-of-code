; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic x86 assembly programming techniques, including
; memory management, loops, and conditional statements. It is designed to help
; programmers understand how to work with arrays and pointers in assembly language.

section .data
    list1 db 1, 3, 5, 7, 9, 11, 13, 15, 17, 19
    list2 db 2, 4, 6, 8, 10, 12, 14, 16, 18, 20
    mergedList db 20 dup(0) ; Array to hold the merged list
    len1 equ 10 ; Length of list1
    len2 equ 10 ; Length of list2
    lenMerged equ 20 ; Length of mergedList

section .bss
    index1 resb 1 ; Index for list1
    index2 resb 1 ; Index for list2
    indexMerged resb 1 ; Index for mergedList
    temp resb 1 ; Temporary storage

section .text
    global _start

_start:
    ; Initialize indices
    mov byte [index1], 0
    mov byte [index2], 0
    mov byte [indexMerged], 0

merge_loop:
    ; Check if we have reached the end of list1
    mov al, [index1]
    cmp al, len1
    jge end_merge

    ; Check if we have reached the end of list2
    mov al, [index2]
    cmp al, len2
    jge end_merge

    ; Compare elements from list1 and list2
    mov al, [list1 + index1]
    mov bl, [list2 + index2]
    cmp al, bl
    jle copy_from_list1

copy_from_list2:
    ; Copy element from list2 to mergedList
    mov al, [list2 + index2]
    mov [mergedList + indexMerged], al
    inc byte [index2]
    jmp update_merged_index

copy_from_list1:
    ; Copy element from list1 to mergedList
    mov al, [list1 + index1]
    mov [mergedList + indexMerged], al
    inc byte [index1]

update_merged_index:
    ; Update merged list index
    inc byte [indexMerged]
    jmp merge_loop

end_merge:
    ; Handle remaining elements in list1
    mov al, [index1]
    cmp al, len1
    jge handle_list2_remaining

handle_list1_remaining:
    mov al, [list1 + index1]
    mov [mergedList + indexMerged], al
    inc byte [index1]
    inc byte [indexMerged]
    mov al, [index1]
    cmp al, len1
    jl handle_list1_remaining

handle_list2_remaining:
    ; Handle remaining elements in list2
    mov al, [index2]
    cmp al, len2
    jge end_program

handle_list2_remaining_loop:
    mov al, [list2 + index2]
    mov [mergedList + indexMerged], al
    inc byte [index2]
    inc byte [indexMerged]
    mov al, [index2]
    cmp al, len2
    jl handle_list2_remaining_loop

end_program:
    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; Exit code 0
    int 0x80

