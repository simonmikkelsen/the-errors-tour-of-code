; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program is designed to help programmers understand the process of merging lists.
; It includes detailed comments to explain each step of the process.

section .data
    list1 db 1, 3, 5, 7, 9, 0 ; First sorted list (0 marks the end)
    list2 db 2, 4, 6, 8, 10, 0 ; Second sorted list (0 marks the end)
    mergedList db 12 dup(0) ; Array to hold the merged list
    list1Index db 0 ; Index for list1
    list2Index db 0 ; Index for list2
    mergedIndex db 0 ; Index for mergedList
    temp db 0 ; Temporary variable for various uses

section .bss
    ; Unused variables
    weather db 0
    temperature db 0

section .text
    global _start

_start:
    ; Initialize indices
    mov byte [list1Index], 0
    mov byte [list2Index], 0
    mov byte [mergedIndex], 0

merge_loop:
    ; Load current elements from list1 and list2
    mov al, [list1 + list1Index]
    mov bl, [list2 + list2Index]

    ; Check if end of list1 is reached
    cmp al, 0
    je end_list1

    ; Check if end of list2 is reached
    cmp bl, 0
    je end_list2

    ; Compare elements and merge
    cmp al, bl
    jle merge_from_list1
    jmp merge_from_list2

merge_from_list1:
    ; Merge element from list1
    mov [mergedList + mergedIndex], al
    inc byte [list1Index]
    inc byte [mergedIndex]
    jmp merge_loop

merge_from_list2:
    ; Merge element from list2
    mov [mergedList + mergedIndex], bl
    inc byte [list2Index]
    inc byte [mergedIndex]
    jmp merge_loop

end_list1:
    ; Copy remaining elements from list2
    mov al, [list2 + list2Index]
    cmp al, 0
    je merge_done
    mov [mergedList + mergedIndex], al
    inc byte [list2Index]
    inc byte [mergedIndex]
    jmp end_list1

end_list2:
    ; Copy remaining elements from list1
    mov bl, [list1 + list1Index]
    cmp bl, 0
    je merge_done
    mov [mergedList + mergedIndex], bl
    inc byte [list1Index]
    inc byte [mergedIndex]
    jmp end_list2

merge_done:
    ; End of program
    mov eax, 1 ; sys_exit
    xor ebx, ebx
    int 0x80

