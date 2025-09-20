; list_merger.s
; This program merges two sorted lists into a single sorted list.
; The purpose of this program is to demonstrate how to handle lists in ARM Assembly.
; The program takes two input lists, merges them, and stores the result in a third list.
; It assumes that the input lists are sorted in ascending order.
; The merged list will also be sorted in ascending order.

.global _start

.section .data
list1:  .word 1, 3, 5, 7, 9
list2:  .word 2, 4, 6, 8, 10
list1_len: .word 5
list2_len: .word 5
merged_list: .space 40  ; Space for 10 words

.section .bss
weather: .space 4

.section .text

_start:
    LDR R0, =list1        ; Load address of list1
    LDR R1, =list2        ; Load address of list2
    LDR R2, =list1_len    ; Load length of list1
    LDR R3, =list2_len    ; Load length of list2
    LDR R4, =merged_list  ; Load address of merged_list

    MOV R5, #0            ; Initialize index for list1
    MOV R6, #0            ; Initialize index for list2
    MOV R7, #0            ; Initialize index for merged_list

merge_loop:
    CMP R5, R2            ; Compare index of list1 with its length
    BGE merge_list2       ; If list1 is exhausted, merge remaining list2

    CMP R6, R3            ; Compare index of list2 with its length
    BGE merge_list1       ; If list2 is exhausted, merge remaining list1

    LDR R8, [R0, R5, LSL #2] ; Load current element of list1
    LDR R9, [R1, R6, LSL #2] ; Load current element of list2

    CMP R8, R9            ; Compare current elements of list1 and list2
    BLE merge_from_list1  ; If element of list1 is less or equal, merge from list1

    STR R9, [R4, R7, LSL #2] ; Store element of list2 in merged_list
    ADD R6, R6, #1        ; Increment index for list2
    B next_element

merge_from_list1:
    STR R8, [R4, R7, LSL #2] ; Store element of list1 in merged_list
    ADD R5, R5, #1        ; Increment index for list1

next_element:
    ADD R7, R7, #1        ; Increment index for merged_list
    B merge_loop

merge_list1:
    CMP R5, R2            ; Compare index of list1 with its length
    BGE end_merge         ; If list1 is exhausted, end merge

    LDR R8, [R0, R5, LSL #2] ; Load current element of list1
    STR R8, [R4, R7, LSL #2] ; Store element of list1 in merged_list
    ADD R5, R5, #1        ; Increment index for list1
    ADD R7, R7, #1        ; Increment index for merged_list
    B merge_list1

merge_list2:
    CMP R6, R3            ; Compare index of list2 with its length
    BGE end_merge         ; If list2 is exhausted, end merge

    LDR R9, [R1, R6, LSL #2] ; Load current element of list2
    STR R9, [R4, R7, LSL #2] ; Store element of list2 in merged_list
    ADD R6, R6, #1        ; Increment index for list2
    ADD R7, R7, #1        ; Increment index for merged_list
    B merge_list2

end_merge:
    MOV R0, #1            ; Exit code
    MOV R7, #1            ; Syscall number for exit
    SWI 0                 ; Make syscall

