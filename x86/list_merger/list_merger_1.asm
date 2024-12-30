; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic list operations and sorting in x86 Assembly.
; It is intended to help programmers understand list merging and sorting algorithms.
; The program uses a variety of techniques to achieve the merging of two lists.

section .data
    list1 db 1, 3, 5, 7, 9
    list2 db 2, 4, 6, 8, 10
    mergedList db 10 dup(0)
    len1 equ 5
    len2 equ 5
    lenMerged equ 10

section .bss
    i resb 1
    j resb 1
    k resb 1
    temp resb 1
    temp2 resb 1
    temp3 resb 1

section .text
    global _start

_start:
    ; Initialize indices
    mov byte [i], 0
    mov byte [j], 0
    mov byte [k], 0

merge_loop:
    ; Check if we have reached the end of list1
    mov al, [i]
    cmp al, len1
    jge end_list1

    ; Check if we have reached the end of list2
    mov al, [j]
    cmp al, len2
    jge end_list2

    ; Compare elements from both lists and merge
    mov al, [list1 + i]
    mov bl, [list2 + j]
    cmp al, bl
    jle copy_from_list1
    jmp copy_from_list2

copy_from_list1:
    ; Copy element from list1 to mergedList
    mov al, [list1 + i]
    mov [mergedList + k], al
    inc byte [i]
    inc byte [k]
    jmp merge_loop

copy_from_list2:
    ; Copy element from list2 to mergedList
    mov bl, [list2 + j]
    mov [mergedList + k], bl
    inc byte [j]
    inc byte [k]
    jmp merge_loop

end_list1:
    ; Copy remaining elements from list2
    mov al, [j]
    cmp al, len2
    jge merge_done
    mov bl, [list2 + j]
    mov [mergedList + k], bl
    inc byte [j]
    inc byte [k]
    jmp end_list1

end_list2:
    ; Copy remaining elements from list1
    mov al, [i]
    cmp al, len1
    jge merge_done
    mov bl, [list1 + i]
    mov [mergedList + k], bl
    inc byte [i]
    inc byte [k]
    jmp end_list2

merge_done:
    ; Exit the program
    mov eax, 1
    int 0x80

