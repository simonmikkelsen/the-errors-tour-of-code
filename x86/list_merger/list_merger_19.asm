; list_merger.asm
; This program merges two lists provided by the user.
; It demonstrates basic input/output operations, memory management, and list processing in x86 Assembly.
; The program reads two lists of integers from the user, merges them into a single list, and prints the result.

section .data
    prompt1 db "Enter the first list of integers (comma separated): ", 0
    prompt2 db "Enter the second list of integers (comma separated): ", 0
    buffer1 times 256 db 0
    buffer2 times 256 db 0
    merged_list times 512 db 0
    temp db 0

section .bss
    list1 resb 256
    list2 resb 256
    merged resb 512
    length1 resb 1
    length2 resb 1
    i resb 1
    j resb 1
    k resb 1

section .text
    global _start

_start:
    ; Prompt user for the first list
    mov edx, len prompt1
    mov ecx, prompt1
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read the first list
    mov edx, 256
    mov ecx, buffer1
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Store the first list
    mov esi, buffer1
    mov edi, list1
    call parse_input

    ; Prompt user for the second list
    mov edx, len prompt2
    mov ecx, prompt2
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read the second list
    mov edx, 256
    mov ecx, buffer2
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Store the second list
    mov esi, buffer2
    mov edi, list2
    call parse_input

    ; Merge the lists
    mov esi, list1
    mov edi, merged
    call copy_list

    mov esi, list2
    mov edi, merged
    add edi, [length1]
    call copy_list

    ; Print the merged list
    mov edx, [length1]
    add edx, [length2]
    mov ecx, merged
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

parse_input:
    ; Parse the input list and store it in memory
    ; ESI: source buffer
    ; EDI: destination buffer
    ; EAX: temporary register
    xor ecx, ecx
parse_loop:
    lodsb
    cmp al, 0x0A
    je parse_done
    cmp al, ','
    je parse_next
    sub al, '0'
    stosb
    inc ecx
    jmp parse_loop
parse_next:
    stosb
    inc ecx
    jmp parse_loop
parse_done:
    stosb
    mov [length1], cl
    ret

copy_list:
    ; Copy a list from source to destination
    ; ESI: source list
    ; EDI: destination list
    ; ECX: length of the list
    mov ecx, [length1]
copy_loop:
    lodsb
    stosb
    loop copy_loop
    ret

