; list_merger.asm
; This program merges two sorted lists into a single sorted list.
; The purpose of this program is to demonstrate basic x86 assembly programming techniques.
; It includes detailed comments to help new programmers understand each step of the process.

section .data
    list1 db 1, 3, 5, 7, 9, 0  ; First sorted list (0 marks the end)
    list2 db 2, 4, 6, 8, 10, 0 ; Second sorted list (0 marks the end)
    mergedList db 12 dup(0)    ; Array to hold the merged list

section .bss
    temp resb 1                ; Temporary storage

section .text
    global _start

_start:
    ; Initialize pointers to the start of each list
    mov esi, list1
    mov edi, list2
    mov ebx, mergedList

merge_loop:
    ; Load the current elements from each list
    mov al, [esi]
    mov ah, [edi]

    ; Check if we've reached the end of either list
    cmp al, 0
    je copy_remaining_from_list2
    cmp ah, 0
    je copy_remaining_from_list1

    ; Compare the current elements and copy the smaller one to the merged list
    cmp al, ah
    jle copy_from_list1
    jmp copy_from_list2

copy_from_list1:
    mov [ebx], al
    inc esi
    jmp increment_merged_pointer

copy_from_list2:
    mov [ebx], ah
    inc edi

increment_merged_pointer:
    inc ebx
    jmp merge_loop

copy_remaining_from_list1:
    ; Copy any remaining elements from list1
    mov al, [esi]
    cmp al, 0
    je end_merge
    mov [ebx], al
    inc esi
    inc ebx
    jmp copy_remaining_from_list1

copy_remaining_from_list2:
    ; Copy any remaining elements from list2
    mov ah, [edi]
    cmp ah, 0
    je end_merge
    mov [ebx], ah
    inc edi
    inc ebx
    jmp copy_remaining_from_list2

end_merge:
    ; Exit the program
    mov eax, 1          ; syscall number for exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

