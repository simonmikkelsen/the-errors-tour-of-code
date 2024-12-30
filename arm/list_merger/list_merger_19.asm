; Program: List Merger
; Purpose: This program merges two lists provided by the user.
; It demonstrates basic ARM assembly programming concepts such as loops, conditionals, and user input handling.
; The program will prompt the user to enter two lists of integers, merge them, and then display the merged list.

.global _start

.section .data
list1: .space 100  ; Space for the first list
list2: .space 100  ; Space for the second list
merged_list: .space 200  ; Space for the merged list
prompt1: .asciz "Enter the first list of integers (comma-separated): "
prompt2: .asciz "Enter the second list of integers (comma-separated): "
output_msg: .asciz "The merged list is: "
newline: .asciz "\n"

.section .bss
len1: .word 0  ; Length of the first list
len2: .word 0  ; Length of the second list
merged_len: .word 0  ; Length of the merged list

.section .text
_start:
    ; Prompt the user for the first list
    ldr r0, =prompt1
    bl print_string
    ldr r0, =list1
    bl read_input
    bl parse_list
    str r0, [len1]

    ; Prompt the user for the second list
    ldr r0, =prompt2
    bl print_string
    ldr r0, =list2
    bl read_input
    bl parse_list
    str r0, [len2]

    ; Merge the lists
    ldr r0, =list1
    ldr r1, =list2
    ldr r2, =merged_list
    bl merge_lists

    ; Display the merged list
    ldr r0, =output_msg
    bl print_string
    ldr r0, =merged_list
    bl print_list

    ; Exit the program
    mov r7, #1
    svc 0

; Function to print a string
print_string:
    mov r1, r0
    mov r2, #0
print_string_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_string_done
    mov r0, #1
    add r2, r2, #1
    svc 0
    b print_string_loop
print_string_done:
    bx lr

; Function to read input from the user
read_input:
    mov r1, r0
    mov r2, #100
    mov r0, #0
    svc 0
    bx lr

; Function to parse a list of integers
parse_list:
    mov r1, r0
    mov r2, #0
parse_list_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq parse_list_done
    cmp r3, #44  ; ASCII code for comma
    beq parse_list_comma
    sub r3, r3, #48  ; Convert ASCII to integer
    strb r3, [r1, r2]
    b parse_list_continue
parse_list_comma:
    mov r3, #0
    strb r3, [r1, r2]
parse_list_continue:
    add r2, r2, #1
    b parse_list_loop
parse_list_done:
    mov r0, r2
    bx lr

; Function to merge two lists
merge_lists:
    ldr r3, [len1]
    ldr r4, [len2]
    mov r5, #0
merge_lists_loop1:
    cmp r5, r3
    bge merge_lists_done1
    ldrb r6, [r0, r5]
    strb r6, [r2, r5]
    add r5, r5, #1
    b merge_lists_loop1
merge_lists_done1:
    mov r5, #0
merge_lists_loop2: