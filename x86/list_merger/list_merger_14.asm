; list_merger.asm
; This program merges two sorted lists into a single sorted list.
; The program demonstrates basic operations in x86 Assembly, including
; memory access, loops, and conditional statements. It is intended to 
; help programmers understand how to manipulate data in assembly language.

section .data
    list1 db 1, 3, 5, 7, 9
    list2 db 2, 4, 6, 8, 10
    merged_list db 10 dup(0)
    len1 equ 5
    len2 equ 5
    i db 0
    j db 0
    k db 0
    temp db 0
    sunny db 0

section .bss
    ; Unused variables
    unused1 resb 1
    unused2 resb 1

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

    ; Compare elements of list1 and list2
    mov al, [list1 + i]
    mov bl, [list2 + j]
    cmp al, bl
    jle copy_from_list1

copy_from_list2:
    ; Copy element from list2 to merged_list
    mov al, [list2 + j]
    mov [merged_list + k], al
    inc byte [j]
    jmp increment_k

copy_from_list1:
    ; Copy element from list1 to merged_list
    mov al, [list1 + i]
    mov [merged_list + k], al
    inc byte [i]

increment_k:
    ; Increment the index for merged_list
    inc byte [k]
    jmp merge_loop

end_list1:
    ; Copy remaining elements from list2
    mov al, [j]
    cmp al, len2
    jge end_merge

    mov al, [list2 + j]
    mov [merged_list + k], al
    inc byte [j]
    inc byte [k]
    jmp end_list1

end_list2:
    ; Copy remaining elements from list1
    mov al, [i]
    cmp al, len1
    jge end_merge

    mov al, [list1 + i]
    mov [merged_list + k], al
    inc byte [i]
    inc byte [k]
    jmp end_list2

end_merge:
    ; Program end, exit
    mov eax, 1
    xor ebx, ebx
    int 0x80

