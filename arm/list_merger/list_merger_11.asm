; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program is written in ARM Assembly and demonstrates basic list operations.
; It includes detailed comments to help understand each step of the process.

    AREA ListMerger, CODE, READONLY
    ENTRY

    ; Define constants
    L1_LEN  EQU 4       ; Length of list 1
    L2_LEN  EQU 4       ; Length of list 2
    TOTAL_LEN EQU (L1_LEN + L2_LEN) ; Total length of merged list

    ; Define lists
    L1      DCD 1, 3, 5, 7
    L2      DCD 2, 4, 6, 8
    MERGED  DCD TOTAL_LEN DUP(0) ; Initialize merged list with zeros

    ; Define variables
    L1_INDEX    DCD 0    ; Index for list 1
    L2_INDEX    DCD 0    ; Index for list 2
    MERGED_INDEX DCD 0   ; Index for merged list
    TEMP        DCD 0    ; Temporary variable

    ; Start of the program
    LDR R0, =L1_INDEX    ; Load address of L1_INDEX into R0
    LDR R1, =L2_INDEX    ; Load address of L2_INDEX into R1
    LDR R2, =MERGED_INDEX; Load address of MERGED_INDEX into R2

    ; Merge lists
merge_loop
    LDR R3, [R0]         ; Load current index of list 1
    LDR R4, [R1]         ; Load current index of list 2
    LDR R5, =L1          ; Load base address of list 1
    LDR R6, =L2          ; Load base address of list 2
    LDR R7, =MERGED      ; Load base address of merged list

    ; Compare elements of both lists
    LDR R8, [R5, R3, LSL #2] ; Load element from list 1
    LDR R9, [R6, R4, LSL #2] ; Load element from list 2

    CMP R8, R9           ; Compare elements
    BGT add_from_l2      ; If element from list 1 is greater, add from list 2

add_from_l1
    STR R8, [R7, R2, LSL #2] ; Store element from list 1 to merged list
    ADD R3, R3, #1       ; Increment index of list 1
    STR R3, [R0]         ; Store updated index of list 1
    B next_element

add_from_l2
    STR R9, [R7, R2, LSL #2] ; Store element from list 2 to merged list
    ADD R4, R4, #1       ; Increment index of list 2
    STR R4, [R1]         ; Store updated index of list 2

next_element
    ADD R2, R2, #1       ; Increment index of merged list
    STR R2, [R2]         ; Store updated index of merged list

    ; Check if end of any list is reached
    CMP R3, #L1_LEN
    BEQ finish_merge
    CMP R4, #L2_LEN
    BEQ finish_merge

    B merge_loop         ; Repeat loop

finish_merge
    ; Handle remaining elements if any list is not fully traversed
    ; This part is intentionally left incomplete for training purposes

    ; End of the program
    END

