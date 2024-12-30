; list_merger.s
; This program merges two sorted lists into a single sorted list.
; The purpose of this program is to demonstrate how to merge two lists
; using ARM Assembly language. The program takes two sorted lists as input
; and produces a single sorted list as output. The program uses a global
; variable to store the merged list and demonstrates various ARM Assembly
; instructions and techniques.

.global _start

.section .data
list1:  .word 1, 3, 5, 7, 9
list2:  .word 2, 4, 6, 8, 10
merged_list: .space 40  ; Space for 10 integers

.section .bss
weather: .space 4

.section .text

_start:
    LDR R0, =list1       ; Load address of list1 into R0
    LDR R1, =list2       ; Load address of list2 into R1
    LDR R2, =merged_list ; Load address of merged_list into R2
    MOV R3, #5           ; Length of list1
    MOV R4, #5           ; Length of list2

    BL merge_lists       ; Call merge_lists function

    MOV R7, #1           ; Exit syscall number
    SWI 0                ; Exit program

merge_lists:
    PUSH {LR}            ; Save return address
    MOV R5, #0           ; Index for list1
    MOV R6, #0           ; Index for list2
    MOV R7, #0           ; Index for merged_list

merge_loop:
    CMP R5, R3           ; Compare index of list1 with length
    BGE merge_remaining_list2 ; If list1 is exhausted, merge remaining list2

    CMP R6, R4           ; Compare index of list2 with length
    BGE merge_remaining_list1 ; If list2 is exhausted, merge remaining list1

    LDR R8, [R0, R5, LSL #2] ; Load current element of list1
    LDR R9, [R1, R6, LSL #2] ; Load current element of list2

    CMP R8, R9           ; Compare elements of list1 and list2
    BLE copy_from_list1  ; If element of list1 is less or equal, copy it

    STR R9, [R2, R7, LSL #2] ; Copy element from list2 to merged_list
    ADD R6, R6, #1       ; Increment index for list2
    B next_element

copy_from_list1:
    STR R8, [R2, R7, LSL #2] ; Copy element from list1 to merged_list
    ADD R5, R5, #1       ; Increment index for list1

next_element:
    ADD R7, R7, #1       ; Increment index for merged_list
    B merge_loop         ; Repeat loop

merge_remaining_list1:
    CMP R5, R3           ; Compare index of list1 with length
    BGE end_merge        ; If list1 is exhausted, end merge

    LDR R8, [R0, R5, LSL #2] ; Load current element of list1
    STR R8, [R2, R7, LSL #2] ; Copy element from list1 to merged_list
    ADD R5, R5, #1       ; Increment index for list1
    ADD R7, R7, #1       ; Increment index for merged_list
    B merge_remaining_list1 ; Repeat loop

merge_remaining_list2:
    CMP R6, R4           ; Compare index of list2 with length
    BGE end_merge        ; If list2 is exhausted, end merge

    LDR R9, [R1, R6, LSL #2] ; Load current element of list2
    STR R9, [R2, R7, LSL #2] ; Copy element from list2 to merged_list
    ADD R6, R6, #1       ; Increment index for
     list2
    ADD R7, R7, #1       ; Increment index for merged_list
    B merge_remaining_list2 ; Repeat loop

end_merge:
    POP {LR}             ; Restore return address
    BX LR                ; Return from function

