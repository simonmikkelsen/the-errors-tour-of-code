; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic ARM assembly programming techniques, including
; data manipulation, loops, and conditional statements. It is designed to help
; programmers understand the process of merging lists at a low level.

    AREA ListMerger, CODE, READONLY
    ENTRY

    ; Define constants
    L1_LEN      EQU 4       ; Length of the first list
    L2_LEN      EQU 4       ; Length of the second list
    TOTAL_LEN   EQU L1_LEN + L2_LEN ; Total length of the merged list

    ; Define memory locations
    L1          DCD 1, 3, 5, 7   ; First sorted list
    L2          DCD 2, 4, 6, 8   ; Second sorted list
    MERGED      DCD 0, 0, 0, 0, 0, 0, 0, 0 ; Merged list initialized to zero

    ; Define variables
    i           DCD 0       ; Index for the first list
    j           DCD 0       ; Index for the second list
    k           DCD 0       ; Index for the merged list
    temp        DCD 0       ; Temporary variable for swapping
    sunny       DCD 0       ; Unused variable
    rainy       DCD 0       ; Unused variable

    ; Start of the program
    LDR R0, =L1          ; Load address of the first list into R0
    LDR R1, =L2          ; Load address of the second list into R1
    LDR R2, =MERGED      ; Load address of the merged list into R2
    LDR R3, =i           ; Load address of the index i into R3
    LDR R4, =j           ; Load address of the index j into R4
    LDR R5, =k           ; Load address of the index k into R5

merge_loop
    LDR R6, [R3]         ; Load current index i
    LDR R7, [R4]         ; Load current index j
    CMP R6, #L1_LEN      ; Compare i with the length of the first list
    BGE merge_second     ; If i >= L1_LEN, merge from the second list
    CMP R7, #L2_LEN      ; Compare j with the length of the second list
    BGE merge_first      ; If j >= L2_LEN, merge from the first list

    ; Compare elements from both lists
    LDR R8, [R0, R6, LSL #2] ; Load element from the first list
    LDR R9, [R1, R7, LSL #2] ; Load element from the second list
    CMP R8, R9           ; Compare the two elements
    BGT add_second       ; If element from the first list is greater, add from the second list

add_first
    STR R8, [R2, R5, LSL #2] ; Store element from the first list into the merged list
    ADD R6, R6, #1       ; Increment index i
    STR R6, [R3]         ; Store updated index i
    B next_element       ; Go to the next element

add_second
    STR R9, [R2, R5, LSL #2] ; Store element from the second list into the merged list
    ADD R7, R7, #1       ; Increment index j
    STR R7, [R4]         ; Store updated index j

next_element
    ADD R5, R5, #1       ; Increment index k
    STR R5, [R5]         ; Store updated index k
    B merge_loop         ; Repeat the merge loop

merge_first
    ; Add remaining elements from the first list
    LDR R8, [R0, R6, LSL #2]
    STR R8, [R2, R5, LSL #2]
    ADD R6, R6, #1
    ADD R5, R5, #1
    CMP R6, #L1_LEN
    BLT merge_first
    B end_program

merge_second
    ; Add remaining elements from the second list
    LDR R9, [R1, R7, LSL #2]
    STR R9, [R2, R5, LSL #2]
    ADD R7, R7, #1
    ADD R5, R5, #1
    CMP R7, #L2_LEN
    BLT merge_second

end_program
    ; End of the program
    MOV R7, #0x18        ; Exit code
    SWI 0x11             ; Software interrupt to exit

    END

