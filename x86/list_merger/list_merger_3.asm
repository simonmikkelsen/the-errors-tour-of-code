; list_merger.asm
; This program merges two sorted lists into a single sorted list.
; The program demonstrates basic list operations and memory management in x86 Assembly.
; It takes two input lists, merges them, and outputs the merged list.
; The program assumes that the input lists are already sorted in ascending order.

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
    mov esi, list1
    mov edi, list2
    mov ebx, mergedList

merge_lists:
    ; Load the current elements of both lists
    mov al, [esi]
    mov ah, [edi]

    ; Check if we have reached the end of list1
    cmp al, 0
    je end_of_list1

    ; Check if we have reached the end of list2
    cmp ah, 0
    je end_of_list2

    ; Compare the current elements of both lists
    cmp al, ah
    jbe copy_from_list1
    jmp copy_from_list2

copy_from_list1:
    ; Copy the element from list1 to the merged list
    mov [ebx], al
    inc esi
    jmp increment_merged_list

copy_from_list2:
    ; Copy the element from list2 to the merged list
    mov [ebx], ah
    inc edi

increment_merged_list:
    ; Move to the next position in the merged list
    inc ebx
    jmp merge_lists

end_of_list1:
    ; Copy the remaining elements from list2
    mov ah, [edi]
    cmp ah, 0
    je end_merge
    mov [ebx], ah
    inc edi
    inc ebx
    jmp end_of_list1

end_of_list2:
    ; Copy the remaining elements from list1
    mov al, [esi]
    cmp al, 0
    je end_merge
    mov [ebx], al
    inc esi
    inc ebx
    jmp end_of_list2

end_merge:
    ; End of the merge process
    ; Exit the program
    mov eax, 1          ; sys_exit system call
    xor ebx, ebx        ; Exit code 0
    int 0x80            ; Interrupt to invoke system call

