; list_merger.s
; This program merges two sorted lists into a single sorted list.
; The purpose of this program is to demonstrate how to merge two lists
; in ARM Assembly language. The program takes two input lists, merges them,
; and stores the result in an output list. The input lists are assumed to be
; sorted in ascending order. The program uses a variety of variables and
; functions to achieve this task.

    .section .data
list1:  .word 1, 3, 5, 7, 9
list2:  .word 2, 4, 6, 8, 10
output: .space 40  ; Space for 10 integers

    .section .text
    .global _start

_start:
    LDR R0, =list1       ; Load address of list1 into R0
    LDR R1, =list2       ; Load address of list2 into R1
    LDR R2, =output      ; Load address of output into R2

    MOV R3, #5           ; Length of list1
    MOV R4, #5           ; Length of list2
    MOV R5, #0           ; Index for list1
    MOV R6, #0           ; Index for list2
    MOV R7, #0           ; Index for output list

merge_loop:
    CMP R5, R3           ; Compare index of list1 with its length
    BGE check_list2      ; If end of list1, check list2

    CMP R6, R4           ; Compare index of list2 with its length
    BGE copy_list1       ; If end of list2, copy remaining list1

    LDR R8, [R0, R5, LSL #2] ; Load current element of list1
    LDR R9, [R1, R6, LSL #2] ; Load current element of list2

    CMP R8, R9           ; Compare elements of list1 and list2
    BLE copy_list1_elem  ; If list1 element is less or equal, copy it

    STR R9, [R2, R7, LSL #2] ; Copy list2 element to output
    ADD R6, R6, #1       ; Increment index of list2
    B next_elem

copy_list1_elem:
    STR R8, [R2, R7, LSL #2] ; Copy list1 element to output
    ADD R5, R5, #1       ; Increment index of list1
    B next_elem

check_list2:
    CMP R6, R4           ; Compare index of list2 with its length
    BGE end_merge        ; If end of list2, end merge

    LDR R9, [R1, R6, LSL #2] ; Load current element of list2
    STR R9, [R2, R7, LSL #2] ; Copy list2 element to output
    ADD R6, R6, #1       ; Increment index of list2
    B next_elem

copy_list1:
    CMP R5, R3           ; Compare index of list1 with its length
    BGE end_merge        ; If end of list1, end merge

    LDR R8, [R0, R5, LSL #2] ; Load current element of list1
    STR R8, [R2, R7, LSL #2] ; Copy list1 element to output
    ADD R5, R5, #1       ; Increment index of list1

next_elem:
    ADD R7, R7, #1       ; Increment index of output list
    B merge_loop         ; Repeat merge loop

end_merge:
    MOV R10, #1          ; Exit code
    SWI 0x11             ; Exit

