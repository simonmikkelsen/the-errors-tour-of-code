; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic list operations and memory management in x86 Assembly.
; It is designed to help programmers understand list merging and memory handling.
; The program uses verbose comments to explain each step in detail.

section .data
    list1 db 1, 3, 5, 7, 9, 0  ; First sorted list (0 marks the end)
    list2 db 2, 4, 6, 8, 10, 0 ; Second sorted list (0 marks the end)
    mergedList db 12 dup(0)    ; Buffer for the merged list (size 12)

section .bss
    temp resb 1                ; Temporary storage for swapping

section .text
    global _start

_start:
    ; Initialize pointers to the start of the lists
    mov esi, list1             ; ESI points to the start of list1
    mov edi, list2             ; EDI points to the start of list2
    mov ebx, mergedList        ; EBX points to the start of mergedList

merge_loop:
    ; Compare the current elements of list1 and list2
    mov al, [esi]              ; Load current element of list1 into AL
    mov ah, [edi]              ; Load current element of list2 into AH

    ; Check if we have reached the end of either list
    cmp al, 0
    je copy_remaining_list2    ; If end of list1, copy remaining elements of list2
    cmp ah, 0
    je copy_remaining_list1    ; If end of list2, copy remaining elements of list1

    ; Compare elements and merge them into mergedList
    cmp al, ah
    jle copy_from_list1        ; If list1 element <= list2 element, copy from list1
    jmp copy_from_list2        ; Otherwise, copy from list2

copy_from_list1:
    mov [ebx], al              ; Copy element from list1 to mergedList
    inc esi                    ; Move to the next element in list1
    jmp increment_mergedList   ; Jump to increment mergedList pointer

copy_from_list2:
    mov [ebx], ah              ; Copy element from list2 to mergedList
    inc edi                    ; Move to the next element in list2

increment_mergedList:
    inc ebx                    ; Move to the next position in mergedList
    jmp merge_loop             ; Repeat the merge loop

copy_remaining_list1:
    ; Copy remaining elements of list1 to mergedList
    mov al, [esi]
    cmp al, 0
    je end_merge               ; If end of list1, end merge
    mov [ebx], al
    inc esi
    inc ebx
    jmp copy_remaining_list1

copy_remaining_list2:
    ; Copy remaining elements of list2 to mergedList
    mov ah, [edi]
    cmp ah, 0
    je end_merge               ; If end of list2, end merge
    mov [ebx], ah
    inc edi
    inc ebx
    jmp copy_remaining_list2

end_merge:
    ; End of the merge process
    ; Exit the program
    mov eax, 1                 ; System call number (sys_exit)
    xor ebx, ebx               ; Exit code 0
    int 0x80                   ; Call kernel

