; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic memory allocation, list traversal, and merging techniques in x86 Assembly.
; It is intended to help programmers understand the process of merging lists and managing memory in Assembly language.

section .data
    list1 db 1, 3, 5, 7, 9, 0 ; First sorted list (0 marks the end)
    list2 db 2, 4, 6, 8, 10, 0 ; Second sorted list (0 marks the end)
    mergedList db 0 ; Placeholder for the merged list

section .bss
    temp resb 256 ; Temporary buffer for merged list

section .text
    global _start

_start:
    ; Initialize pointers
    mov esi, list1 ; Pointer to the first list
    mov edi, list2 ; Pointer to the second list
    mov ebx, temp  ; Pointer to the temporary buffer

merge_lists:
    ; Compare elements from both lists and merge them into the temporary buffer
    mov al, [esi] ; Load element from list1
    mov ah, [edi] ; Load element from list2

    ; Check if we reached the end of list1
    cmp al, 0
    je end_list1

    ; Check if we reached the end of list2
    cmp ah, 0
    je end_list2

    ; Compare elements and store the smaller one in the buffer
    cmp al, ah
    jle store_list1
    jmp store_list2

store_list1:
    mov [ebx], al ; Store element from list1
    inc esi       ; Move to the next element in list1
    jmp next

store_list2:
    mov [ebx], ah ; Store element from list2
    inc edi       ; Move to the next element in list2

next:
    inc ebx       ; Move to the next position in the buffer
    jmp merge_lists

end_list1:
    ; Copy remaining elements from list2 to the buffer
    mov ah, [edi]
    cmp ah, 0
    je finish
    mov [ebx], ah
    inc edi
    inc ebx
    jmp end_list1

end_list2:
    ; Copy remaining elements from list1 to the buffer
    mov al, [esi]
    cmp al, 0
    je finish
    mov [ebx], al
    inc esi
    inc ebx
    jmp end_list2

finish:
    ; Copy the merged list from the temporary buffer to the final mergedList
    mov ecx, temp
    mov edx, mergedList

copy_merged_list:
    mov al, [ecx]
    mov [edx], al
    cmp al, 0
    je done
    inc ecx
    inc edx
    jmp copy_merged_list

done:
    ; Exit the program
    mov eax, 1      ; sys_exit
    xor ebx, ebx    ; Exit code 0
    int 0x80

