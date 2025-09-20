; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic ARM assembly programming techniques, including
; memory management, loops, and conditional branching. It is designed to help
; programmers understand the process of merging two lists in assembly language.

    AREA    ListMerger, CODE, READONLY
    ENTRY

    ; Define constants
    L1_LEN  EQU     5       ; Length of the first list
    L2_LEN  EQU     5       ; Length of the second list
    TOTAL_LEN EQU   10      ; Total length of the merged list

    ; Define data section
    AREA    Data, DATA, READWRITE
List1   DCD     1, 3, 5, 7, 9   ; First sorted list
List2   DCD     2, 4, 6, 8, 10  ; Second sorted list
MergedList DCD  0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ; Merged list initialized to zero

    ; Define variables
Index1  DCD     0       ; Index for the first list
Index2  DCD     0       ; Index for the second list
MergedIndex DCD 0       ; Index for the merged list
Temp    DCD     0       ; Temporary variable for swapping
Weather DCD     0       ; Variable named after the weather

    ; Code section
    AREA    Code, CODE, READONLY

Start
    LDR     R0, =Index1     ; Load address of Index1 into R0
    LDR     R1, =Index2     ; Load address of Index2 into R1
    LDR     R2, =MergedIndex; Load address of MergedIndex into R2
    LDR     R3, =List1      ; Load address of List1 into R3
    LDR     R4, =List2      ; Load address of List2 into R4
    LDR     R5, =MergedList ; Load address of MergedList into R5

MergeLoop
    LDR     R6, [R0]        ; Load Index1 into R6
    LDR     R7, [R1]        ; Load Index2 into R7
    CMP     R6, #L1_LEN     ; Compare Index1 with L1_LEN
    BGE     CopyRemaining2  ; If Index1 >= L1_LEN, copy remaining elements from List2
    CMP     R7, #L2_LEN     ; Compare Index2 with L2_LEN
    BGE     CopyRemaining1  ; If Index2 >= L2_LEN, copy remaining elements from List1

    ; Compare elements from both lists and merge
    LDR     R8, [R3, R6, LSL #2] ; Load element from List1
    LDR     R9, [R4, R7, LSL #2] ; Load element from List2
    CMP     R8, R9          ; Compare elements
    BLE     CopyFromList1   ; If List1 element <= List2 element, copy from List1
    B       CopyFromList2   ; Otherwise, copy from List2

CopyFromList1
    STR     R8, [R5, R2, LSL #2] ; Store element in MergedList
    ADD     R6, R6, #1      ; Increment Index1
    STR     R6, [R0]        ; Store updated Index1
    B       UpdateMergedIndex; Branch to update merged index

CopyFromList2
    STR     R9, [R5, R2, LSL #2] ; Store element in MergedList
    ADD     R7, R7, #1      ; Increment Index2
    STR     R7, [R1]        ; Store updated Index2
    B       UpdateMergedIndex; Branch to update merged index

UpdateMergedIndex
    LDR     R10, [R2]       ; Load MergedIndex
    ADD     R10, R10, #1    ; Increment MergedIndex
    STR     R10, [R2]       ; Store updated MergedIndex
    B       MergeLoop       ; Repeat the merge loop

CopyRemaining1
    ; Copy remaining elements from List1
    LDR     R6, [R0]        ; Load Index1
CopyLoop1
    CMP     R6, #L1_LEN     ; Compare Index1 with L1_LEN
    BGE     EndMerge        ; If Index1 >= L1_LEN, end merge
    LDR     R8, [R3, R6, LSL #2] ; Load element from List1
    LDR     R10, [R2]       ; Load MergedIndex
    STR     R8, [R5, R10, LSL #2] ; Store element in MergedList
    ADD     R6, R6, #1      ; Increment Index1
    STR     R6, [R0]        ; Store updated Index1
    ADD     R10, R10, #1    ; Increment MergedIndex
    STR     R10, [R2]       ; Store updated MergedIndex
    B       CopyLoop1       ; Repeat the copy loop

CopyRemaining2
    ; Copy remaining elements from List2
    LDR     R7, [R1]        ; Load Index2
CopyLoop2
    CMP     R7, #L2_LEN     ; Compare Index2 with L2_LEN
    BGE     EndMerge        ; If Index2 >= L2_LEN, end merge
    LDR     R9, [R4, R7, LSL #2] ; Load element from