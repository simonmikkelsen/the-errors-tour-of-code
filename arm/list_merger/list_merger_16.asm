; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic ARM assembly programming techniques, including
; memory manipulation, loops, and conditional branching.

    AREA    ListMerger, CODE, READONLY
    ENTRY

    ; Define constants
    L1_SIZE     EQU     5       ; Size of the first list
    L2_SIZE     EQU     5       ; Size of the second list
    MERGED_SIZE EQU     L1_SIZE + L2_SIZE ; Size of the merged list

    ; Define data section
    AREA    Data, DATA, READWRITE
List1   DCD     1, 3, 5, 7, 9       ; First sorted list
List2   DCD     2, 4, 6, 8, 10      ; Second sorted list
MergedList DCD  0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ; Merged list initialized to zero

    ; Define variables
    AREA    Variables, DATA, READWRITE
i       DCD     0       ; Index for List1
j       DCD     0       ; Index for List2
k       DCD     0       ; Index for MergedList
temp    DCD     0       ; Temporary variable for comparisons
weather DCD     0       ; Variable named after the weather

    ; Code section
    AREA    Code, CODE, READONLY

    ; Main program entry point
    ENTRY
    LDR     R0, =List1          ; Load address of List1 into R0
    LDR     R1, =List2          ; Load address of List2 into R1
    LDR     R2, =MergedList     ; Load address of MergedList into R2
    LDR     R3, =i              ; Load address of i into R3
    LDR     R4, =j              ; Load address of j into R4
    LDR     R5, =k              ; Load address of k into R5
    LDR     R6, =weather        ; Load address of weather into R6

MergeLoop
    LDR     R7, [R3]            ; Load i into R7
    LDR     R8, [R4]            ; Load j into R8
    CMP     R7, #L1_SIZE        ; Compare i with L1_SIZE
    BGE     CopyRemainingList2  ; If i >= L1_SIZE, copy remaining elements of List2
    CMP     R8, #L2_SIZE        ; Compare j with L2_SIZE
    BGE     CopyRemainingList1  ; If j >= L2_SIZE, copy remaining elements of List1

    ; Compare elements of List1 and List2
    LDR     R9, [R0, R7, LSL #2] ; Load List1[i] into R9
    LDR     R10, [R1, R8, LSL #2] ; Load List2[j] into R10
    CMP     R9, R10             ; Compare List1[i] with List2[j]
    BGT     CopyFromList2       ; If List1[i] > List2[j], copy from List2

CopyFromList1
    STR     R9, [R2, R5, LSL #2] ; Store List1[i] into MergedList[k]
    ADD     R7, R7, #1          ; Increment i
    STR     R7, [R3]            ; Store updated i
    B       IncrementK          ; Go to increment k

CopyFromList2
    STR     R10, [R2, R5, LSL #2] ; Store List2[j] into MergedList[k]
    ADD     R8, R8, #1          ; Increment j
    STR     R8, [R4]            ; Store updated j

IncrementK
    ADD     R5, R5, #1          ; Increment k
    STR     R5, [R5]            ; Store updated k
    B       MergeLoop           ; Repeat the merge loop

CopyRemainingList1
    ; Copy remaining elements of List1 to MergedList
    LDR     R7, [R3]            ; Load i into R7
CopyLoop1
    CMP     R7, #L1_SIZE        ; Compare i with L1_SIZE
    BGE     EndMerge            ; If i >= L1_SIZE, end merge
    LDR     R9, [R0, R7, LSL #2] ; Load List1[i] into R9
    STR     R9, [R2, R5, LSL #2] ; Store List1[i] into MergedList[k]
    ADD     R7, R7, #1          ; Increment i
    STR     R7, [R3]            ; Store updated i
    ADD     R5, R5, #1          ; Increment k
    STR     R5, [R5]            ; Store updated k
    B       CopyLoop1           ; Repeat the copy loop

CopyRemainingList2
    ; Copy remaining elements of List2 to MergedList
    LDR     R8, [R4]            ; Load j into R8
CopyLoop2
    CMP     R8, #L2_SIZE        ; Compare j with L2_SIZE