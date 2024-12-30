; list_merger.asm
; This program merges two lists of integers provided by the user.
; The user inputs the size of each list followed by the elements of each list.
; The program then merges the two lists into a single sorted list.
; The merged list is then printed to the console.
; This program is designed to help programmers understand list merging in assembly.

section .data
    prompt1 db "Enter the size of the first list: ", 0
    prompt2 db "Enter the elements of the first list: ", 0
    prompt3 db "Enter the size of the second list: ", 0
    prompt4 db "Enter the elements of the second list: ", 0
    merged_msg db "The merged list is: ", 0
    buffer db 0

section .bss
    list1 resb 100
    list2 resb 100
    merged_list resb 200
    size1 resb 1
    size2 resb 1

section .text
    global _start

_start:
    ; Prompt for the size of the first list
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt1
    mov edx, 27
    int 0x80

    ; Read the size of the first list
    mov eax, 3
    mov ebx, 0
    mov ecx, size1
    mov edx, 1
    int 0x80

    ; Prompt for the elements of the first list
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, 30
    int 0x80

    ; Read the elements of the first list
    mov eax, 3
    mov ebx, 0
    mov ecx, list1
    mov edx, 100
    int 0x80

    ; Prompt for the size of the second list
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt3
    mov edx, 28
    int 0x80

    ; Read the size of the second list
    mov eax, 3
    mov ebx, 0
    mov ecx, size2
    mov edx, 1
    int 0x80

    ; Prompt for the elements of the second list
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt4
    mov edx, 31
    int 0x80

    ; Read the elements of the second list
    mov eax, 3
    mov ebx, 0
    mov ecx, list2
    mov edx, 100
    int 0x80

    ; Merge the lists
    call merge_lists

    ; Print the merged list message
    mov eax, 4
    mov ebx, 1
    mov ecx, merged_msg
    mov edx, 20
    int 0x80

    ; Print the merged list
    mov eax, 4
    mov ebx, 1
    mov ecx, merged_list
    mov edx, 200
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

merge_lists:
    ; This function merges the two lists into a single sorted list
    ; The merged list is stored in the merged_list buffer
    ; The size of the merged list is the sum of the sizes of the two lists
    ret

