; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program is written in ARM Assembly language and demonstrates basic list operations.
; It is intended to help programmers understand list merging and ARM Assembly syntax.
; The program assumes that the input lists are already sorted in ascending order.

    AREA ListMerger, CODE, READONLY
    ENTRY

    ; Define constants
    L1_LEN  EQU 4       ; Length of the first list
    L2_LEN  EQU 4       ; Length of the second list
    L3_LEN  EQU (L1_LEN + L2_LEN) ; Length of the merged list

    ; Define data section
    AREA Data, DATA, READWRITE
    EXPORT __main

    ; Input lists (sorted in ascending order)
    L1      DCD 1, 3, 5, 7
    L2      DCD 2, 4, 6, 8

    ; Output list (to store the merged result)
    L3      DCD L3_LEN DUP(0)

    ; Variables for indexing
    INDEX1  DCD 0
    INDEX2  DCD 0
    INDEX3  DCD 0

    ; Main program
__main
    LDR     R0, =L1      ; Load address of the first list
    LDR     R1, =L2      ; Load address of the second list
    LDR     R2, =L3      ; Load address of the merged list

    ; Initialize indices
    LDR     R3, =INDEX1
    LDR     R4, =INDEX2
    LDR     R5, =INDEX3

    ; Load initial values of indices
    LDR     R6, [R3]
    LDR     R7, [R4]
    LDR     R8, [R5]

merge_loop
    ; Check if we have reached the end of the first list
    CMP     R6, #L1_LEN
    BEQ     copy_remaining_from_L2

    ; Check if we have reached the end of the second list
    CMP     R7, #L2_LEN
    BEQ     copy_remaining_from_L1

    ; Compare current elements of both lists
    LDR     R9, [R0, R6, LSL #2] ; Load current element from L1
    LDR     R10, [R1, R7, LSL #2] ; Load current element from L2
    CMP     R9, R10
    BGT     copy_from_L2

copy_from_L1
    ; Copy element from L1 to L3
    STR     R9, [R2, R8, LSL #2]
    ADD     R6, R6, #1  ; Increment index for L1
    ADD     R8, R8, #1  ; Increment index for L3
    B       merge_loop

copy_from_L2
    ; Copy element from L2 to L3
    STR     R10, [R2, R8, LSL #2]
    ADD     R7, R7, #1  ; Increment index for L2
    ADD     R8, R8, #1  ; Increment index for L3
    B       merge_loop

copy_remaining_from_L1
    ; Copy remaining elements from L1 to L3
    CMP     R6, #L1_LEN
    BEQ     end_merge
    LDR     R9, [R0, R6, LSL #2]
    STR     R9, [R2, R8, LSL #2]
    ADD     R6, R6, #1
    ADD     R8, R8, #1
    B       copy_remaining_from_L1

copy_remaining_from_L2
    ; Copy remaining elements from L2 to L3
    CMP     R7, #L2_LEN
    BEQ     end_merge
    LDR     R10, [R1, R7, LSL #2]
    STR     R10, [R2, R8, LSL #2]
    ADD     R7, R7, #1
    ADD     R8, R8, #1
    B       copy_remaining_from_L2

end_merge
    ; End of the program
    MOV     R0, #0x18   ; Exit code
    LDR     R1, =0x20026 ; Exit syscall
    SVC     0x123456    ; Supervisor call

    END

