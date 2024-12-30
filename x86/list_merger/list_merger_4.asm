; list_merger.asm
; This program merges two sorted lists into a single sorted list.
; It demonstrates basic concepts of x86 assembly programming, including
; memory management, loops, and conditional statements.

section .data
    list1 db 1, 3, 5, 7, 9, 0
    list2 db 2, 4, 6, 8, 10, 0
    mergedList db 12 dup(0)
    list1Len equ 6
    list2Len equ 6

section .bss
    i resb 1
    j resb 1
    k resb 1
    temp resb 1

section .text
    global _start

_start:
    ; Initialize indices
    mov byte [i], 0
    mov byte [j], 0
    mov byte [k], 0

merge_loop:
    ; Load current elements from list1 and list2
    mov al, [list1 + i]
    mov bl, [list2 + j]

    ; Compare elements and merge
    cmp al, bl
    jle add_from_list1
    jmp add_from_list2

add_from_list1:
    ; Add element from list1 to mergedList
    mov [mergedList + k], al
    inc byte [i]
    inc byte [k]
    jmp check_end

add_from_list2:
    ; Add element from list2 to mergedList
    mov [mergedList + k], bl
    inc byte [j]
    inc byte [k]
    jmp check_end

check_end:
    ; Check if we reached the end of either list
    mov al, [i]
    cmp al, list1Len
    je copy_remaining_list2

    mov bl, [j]
    cmp bl, list2Len
    je copy_remaining_list1

    ; Continue merging
    jmp merge_loop

copy_remaining_list1:
    ; Copy remaining elements from list1
    mov al, [list1 + i]
    mov [mergedList + k], al
    inc byte [i]
    inc byte [k]
    jmp copy_remaining_list1

copy_remaining_list2:
    ; Copy remaining elements from list2
    mov bl, [list2 + j]
    mov [mergedList + k], bl
    inc byte [j]
    inc byte [k]
    jmp copy_remaining_list2

    ; Exit program
    mov eax, 1
    int 0x80

