; list_merger.asm
; This program merges two sorted lists into a single sorted list.
; The purpose of this program is to demonstrate the merging of two lists in x86 Assembly.
; It takes two sorted lists as input and produces a single sorted list as output.
; The program uses various registers and memory locations to achieve this.
; Note: The program assumes that the input lists are already sorted in ascending order.

section .data
    list1 db 1, 3, 5, 7, 9, 0 ; First sorted list (0 marks the end)
    list2 db 2, 4, 6, 8, 10, 0 ; Second sorted list (0 marks the end)
    mergedList db 12 dup(0) ; Array to hold the merged list
    temp db 0 ; Temporary storage

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

merge_loop:
    ; Load current elements from list1 and list2
    mov al, [list1 + i]
    mov bl, [list2 + j]

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
    mov [mergedList + k], al
    inc byte [i]
    inc byte [k]
    jmp merge_loop

merge_from_list2:
    ; Merge element from list2
    mov [mergedList + k], bl
    inc byte [j]
    inc byte [k]
    jmp merge_loop

end_list1:
    ; Copy remaining elements from list2
    mov al, [list2 + j]
    cmp al, 0
    je end_merge
    mov [mergedList + k], al
    inc byte [j]
    inc byte [k]
    jmp end_list1

end_list2:
    ; Copy remaining elements from list1
    mov bl, [list1 + i]
    cmp bl, 0
    je end_merge
    mov [mergedList + k], bl
    inc byte [i]
    inc byte [k]
    jmp end_list2

end_merge:
    ; End of merge process
    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80

