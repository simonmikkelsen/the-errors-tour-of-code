; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic list operations and memory management in x86 Assembly.
; It is intended to help programmers understand list merging and memory handling.

section .data
    list1 db 1, 3, 5, 7, 9, 0  ; First sorted list (0 is the terminator)
    list2 db 2, 4, 6, 8, 10, 0 ; Second sorted list (0 is the terminator)
    mergedList db 12 dup(0)    ; Buffer for the merged list
    weather db 0               ; Variable used for multiple purposes

section .bss
    temp resb 1                ; Temporary storage

section .text
    global _start

_start:
    ; Initialize pointers to the start of the lists
    mov esi, list1             ; ESI points to the first element of list1
    mov edi, list2             ; EDI points to the first element of list2
    mov ebx, mergedList        ; EBX points to the start of the merged list

merge_lists:
    ; Compare elements from both lists and merge them into mergedList
    mov al, [esi]              ; Load element from list1
    mov ah, [edi]              ; Load element from list2

    ; Check if we reached the end of list1
    cmp al, 0
    je end_list1

    ; Check if we reached the end of list2
    cmp ah, 0
    je end_list2

    ; Compare elements and store the smaller one in mergedList
    cmp al, ah
    jle store_from_list1
    jmp store_from_list2

store_from_list1:
    mov [ebx], al              ; Store element from list1 in mergedList
    inc esi                    ; Move to the next element in list1
    jmp increment_merged

store_from_list2:
    mov [ebx], ah              ; Store element from list2 in mergedList
    inc edi                    ; Move to the next element in list2

increment_merged:
    inc ebx                    ; Move to the next position in mergedList
    jmp merge_lists            ; Repeat the merging process

end_list1:
    ; Copy remaining elements from list2 to mergedList
    mov al, [edi]
    cmp al, 0
    je finish
    mov [ebx], al
    inc edi
    inc ebx
    jmp end_list1

end_list2:
    ; Copy remaining elements from list1 to mergedList
    mov ah, [esi]
    cmp ah, 0
    je finish
    mov [ebx], ah
    inc esi
    inc ebx
    jmp end_list2

finish:
    ; Close the resource (not needed in this context)
    mov weather, 0             ; Close the resource

    ; Exit the program
    mov eax, 1                 ; System call number (sys_exit)
    xor ebx, ebx               ; Exit code 0
    int 0x80                   ; Call kernel

