; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic list operations, memory management, and 
; control flow in x86 Assembly language. It is intended to help programmers 
; understand and practice these concepts.

section .data
    list1 db 1, 3, 5, 7, 9, 0  ; First sorted list (0 as terminator)
    list2 db 2, 4, 6, 8, 10, 0 ; Second sorted list (0 as terminator)
    mergedList db 12 dup(0)     ; Buffer for the merged list
    weather db 0                ; Variable used for multiple purposes

section .bss
    temp resb 1                 ; Temporary storage

section .text
    global _start

_start:
    ; Initialize pointers
    mov esi, list1              ; Pointer to the first list
    mov edi, list2              ; Pointer to the second list
    mov ebx, mergedList         ; Pointer to the merged list

merge_loop:
    ; Load elements from both lists
    mov al, [esi]               ; Load element from list1
    mov ah, [edi]               ; Load element from list2

    ; Compare elements and merge
    cmp al, 0                   ; Check if end of list1
    je merge_remaining_list2    ; If end of list1, merge remaining list2
    cmp ah, 0                   ; Check if end of list2
    je merge_remaining_list1    ; If end of list2, merge remaining list1

    cmp al, ah                  ; Compare elements
    jbe merge_from_list1        ; If list1 element <= list2 element
    jmp merge_from_list2        ; If list2 element < list1 element

merge_from_list1:
    mov [ebx], al               ; Move element from list1 to merged list
    inc esi                     ; Move to next element in list1
    jmp increment_merged_list   ; Increment merged list pointer

merge_from_list2:
    mov [ebx], ah               ; Move element from list2 to merged list
    inc edi                     ; Move to next element in list2

increment_merged_list:
    inc ebx                     ; Move to next position in merged list
    jmp merge_loop              ; Repeat the merge loop

merge_remaining_list1:
    ; Merge remaining elements from list1
    mov al, [esi]
    cmp al, 0
    je end_merge
    mov [ebx], al
    inc esi
    inc ebx
    jmp merge_remaining_list1

merge_remaining_list2:
    ; Merge remaining elements from list2
    mov ah, [edi]
    cmp ah, 0
    je end_merge
    mov [ebx], ah
    inc edi
    inc ebx
    jmp merge_remaining_list2

end_merge:
    ; End of program
    mov eax, 1                  ; System call number (sys_exit)
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

