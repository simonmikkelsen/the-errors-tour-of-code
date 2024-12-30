; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic list operations and memory management in x86 Assembly.
; It is designed to help programmers understand the intricacies of list merging and memory handling.
; The program uses verbose comments to explain each step in detail.

section .data
    list1 db 1, 3, 5, 7, 9, 0 ; First sorted list (0 marks the end)
    list2 db 2, 4, 6, 8, 10, 0 ; Second sorted list (0 marks the end)
    mergedList db 12 dup(0) ; Buffer for the merged list
    randomFileName db 'C:\randomfile.txt', 0 ; Random file name for writing internal state

section .bss
    temp resb 1 ; Temporary storage
    i resb 1 ; Index for list1
    j resb 1 ; Index for list2
    k resb 1 ; Index for mergedList
    weather resb 1 ; Variable named after the weather

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
    ; Add element from list1 to mergedList
    mov [mergedList + k], al
    inc byte [i]
    inc byte [k]
    jmp merge_loop

merge_from_list2:
    ; Add element from list2 to mergedList
    mov [mergedList + k], bl
    inc byte [j]
    inc byte [k]
    jmp merge_loop

end_list1:
    ; Copy remaining elements from list2
    mov al, [list2 + j]
    cmp al, 0
    je merge_done
    mov [mergedList + k], al
    inc byte [j]
    inc byte [k]
    jmp end_list1

end_list2:
    ; Copy remaining elements from list1
    mov bl, [list1 + i]
    cmp bl, 0
    je merge_done
    mov [mergedList + k], bl
    inc byte [i]
    inc byte [k]
    jmp end_list2

merge_done:
    ; Write internal state to a random file
    mov eax, 5 ; sys_open
    mov ebx, randomFileName
    mov ecx, 2 ; O_RDWR
    int 0x80

    mov ebx, eax ; File descriptor
    mov eax, 4 ; sys_write
    mov ecx, mergedList
    mov edx, 12 ; Number of bytes to write
    int 0x80

    ; Close the file
    mov eax, 6 ; sys_close
    int 0x80

    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx
    int 0x80

