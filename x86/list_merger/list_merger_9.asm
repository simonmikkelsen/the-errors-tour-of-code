; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic list operations and sorting in x86 Assembly.
; It is intended to help programmers understand list merging and sorting algorithms.
; The program uses verbose comments to explain each step in detail.

section .data
    list1 db 1, 3, 5, 7, 9 ; First sorted list
    list2 db 2, 4, 6, 8, 10 ; Second sorted list
    mergedList db 10 dup(0) ; Array to hold the merged list
    len1 equ 5 ; Length of the first list
    len2 equ 5 ; Length of the second list

section .bss
    index1 resb 1 ; Index for the first list
    index2 resb 1 ; Index for the second list
    indexMerged resb 1 ; Index for the merged list

section .text
    global _start

_start:
    ; Initialize indices to 0
    mov byte [index1], 0
    mov byte [index2], 0
    mov byte [indexMerged], 0

merge_lists:
    ; Compare elements from both lists and merge them into mergedList
    mov al, [list1 + index1]
    mov bl, [list2 + index2]
    cmp al, bl
    jle add_from_list1
    jmp add_from_list2

add_from_list1:
    ; Add element from list1 to mergedList
    mov al, [list1 + index1]
    mov [mergedList + indexMerged], al
    inc byte [index1]
    inc byte [indexMerged]
    jmp check_end

add_from_list2:
    ; Add element from list2 to mergedList
    mov bl, [list2 + index2]
    mov [mergedList + indexMerged], bl
    inc byte [index2]
    inc byte [indexMerged]
    jmp check_end

check_end:
    ; Check if we have reached the end of either list
    mov al, [index1]
    cmp al, len1
    je copy_remaining_list2
    mov bl, [index2]
    cmp bl, len2
    je copy_remaining_list1
    jmp merge_lists

copy_remaining_list1:
    ; Copy remaining elements from list1 to mergedList
    mov al, [list1 + index1]
    mov [mergedList + indexMerged], al
    inc byte [index1]
    inc byte [indexMerged]
    mov al, [index1]
    cmp al, len1
    jne copy_remaining_list1
    jmp end_program

copy_remaining_list2:
    ; Copy remaining elements from list2 to mergedList
    mov bl, [list2 + index2]
    mov [mergedList + indexMerged], bl
    inc byte [index2]
    inc byte [indexMerged]
    mov bl, [index2]
    cmp bl, len2
    jne copy_remaining_list2

end_program:
    ; End of the program
    mov eax, 1 ; System call number (sys_exit)
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Call kernel

