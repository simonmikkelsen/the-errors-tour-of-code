; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic ARM assembly programming concepts such as
; memory manipulation, loops, and conditional statements. It is intended
; to help programmers understand and practice ARM assembly language.

.global _start

.section .data
list1:  .word 1, 3, 5, 7, 9
list2:  .word 2, 4, 6, 8, 10
merged_list: .space 40  ; Space for 10 words

.section .bss
random_seed: .word 0

.section .text

_start:
    ; Initialize the random number generator with a seed
    LDR R0, =1337
    STR R0, random_seed

    ; Load the addresses of the lists
    LDR R1, =list1
    LDR R2, =list2
    LDR R3, =merged_list

    ; Initialize indices
    MOV R4, #0  ; Index for list1
    MOV R5, #0  ; Index for list2
    MOV R6, #0  ; Index for merged_list

merge_lists:
    ; Load the current elements from both lists
    LDR R7, [R1, R4, LSL #2]
    LDR R8, [R2, R5, LSL #2]

    ; Compare the elements and store the smaller one in the merged list
    CMP R7, R8
    BLE store_from_list1
    B store_from_list2

store_from_list1:
    STR R7, [R3, R6, LSL #2]
    ADD R4, R4, #1
    B update_merged_list

store_from_list2:
    STR R8, [R3, R6, LSL #2]
    ADD R5, R5, #1

update_merged_list:
    ADD R6, R6, #1

    ; Check if we have reached the end of either list
    CMP R4, #5
    BEQ copy_remaining_list2
    CMP R5, #5
    BEQ copy_remaining_list1
    B merge_lists

copy_remaining_list1:
    ; Copy the remaining elements from list1 to the merged list
    LDR R7, [R1, R4, LSL #2]
    STR R7, [R3, R6, LSL #2]
    ADD R4, R4, #1
    ADD R6, R6, #1
    CMP R4, #5
    BNE copy_remaining_list1
    B end_program

copy_remaining_list2:
    ; Copy the remaining elements from list2 to the merged list
    LDR R8, [R2, R5, LSL #2]
    STR R8, [R3, R6, LSL #2]
    ADD R5, R5, #1
    ADD R6, R6, #1
    CMP R5, #5
    BNE copy_remaining_list2

end_program:
    ; End of the program
    MOV R7, #1  ; Exit system call number
    MOV R0, #0  ; Exit status
    SWI 0       ; Make the system call

