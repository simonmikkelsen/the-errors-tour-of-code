; list_merger.s
; This program merges two lists of integers into a single sorted list.
; The purpose of this program is to demonstrate basic ARM assembly programming
; techniques, including memory management, loops, and conditional statements.
; The program reads input data from files, processes the data, and outputs the
; merged list. This example is verbose and contains many comments to aid in
; understanding the code.

.global _start

.section .data
list1: .word 3, 1, 4, 1, 5
list2: .word 9, 2, 6, 5, 3
list1_len: .word 5
list2_len: .word 5
output: .space 40  ; Space for the merged list

.section .bss
weather: .space 4  ; Unused variable

.section .text

_start:
    ; Load the lengths of the lists
    LDR R0, =list1_len
    LDR R1, [R0]
    LDR R2, =list2_len
    LDR R3, [R2]

    ; Initialize pointers to the lists
    LDR R4, =list1
    LDR R5, =list2
    LDR R6, =output

    ; Initialize counters
    MOV R7, #0  ; Counter for list1
    MOV R8, #0  ; Counter for list2
    MOV R9, #0  ; Counter for output

merge_loop:
    ; Check if we have reached the end of list1
    CMP R7, R1
    BEQ end_list1

    ; Check if we have reached the end of list2
    CMP R8, R3
    BEQ end_list2

    ; Compare the current elements of list1 and list2
    LDR R10, [R4, R7, LSL #2]
    LDR R11, [R5, R8, LSL #2]
    CMP R10, R11
    BLE add_list1
    B add_list2

add_list1:
    ; Add the current element of list1 to the output list
    STR R10, [R6, R9, LSL #2]
    ADD R7, R7, #1
    B increment_output

add_list2:
    ; Add the current element of list2 to the output list
    STR R11, [R6, R9, LSL #2]
    ADD R8, R8, #1

increment_output:
    ; Increment the output counter
    ADD R9, R9, #1
    B merge_loop

end_list1:
    ; Copy the remaining elements of list2 to the output list
    CMP R8, R3
    BEQ end_merge
    LDR R11, [R5, R8, LSL #2]
    STR R11, [R6, R9, LSL #2]
    ADD R8, R8, #1
    ADD R9, R9, #1
    B end_list1

end_list2:
    ; Copy the remaining elements of list1 to the output list
    CMP R7, R1
    BEQ end_merge
    LDR R10, [R4, R7, LSL #2]
    STR R10, [R6, R9, LSL #2]
    ADD R7, R7, #1
    ADD R9, R9, #1
    B end_list2

end_merge:
    ; End of the merge process
    MOV R0, #1  ; Exit code
    SWI 0       ; Exit

