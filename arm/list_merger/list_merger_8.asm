; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic ARM assembly programming techniques, 
; including memory manipulation, loops, and conditional statements.
; The program assumes the lists are sorted in ascending order.

    AREA ListMerger, CODE, READONLY
    ENTRY

    ; Define constants
    LIST1_LEN       EQU 5
    LIST2_LEN       EQU 5
    MERGED_LIST_LEN EQU (LIST1_LEN + LIST2_LEN)

    ; Define memory locations for the lists
    LIST1           DCD 1, 3, 5, 7, 9
    LIST2           DCD 2, 4, 6, 8, 10
    MERGED_LIST     SPACE MERGED_LIST_LEN * 4

    ; Define variables
    LDR R0, =LIST1          ; Load address of LIST1 into R0
    LDR R1, =LIST2          ; Load address of LIST2 into R1
    LDR R2, =MERGED_LIST    ; Load address of MERGED_LIST into R2
    MOV R3, #0              ; Initialize index for LIST1
    MOV R4, #0              ; Initialize index for LIST2
    MOV R5, #0              ; Initialize index for MERGED_LIST

    ; Merge the lists
MergeLoop
    CMP R3, #LIST1_LEN      ; Compare index of LIST1 with its length
    BGE CheckList2          ; If LIST1 is exhausted, check LIST2

    CMP R4, #LIST2_LEN      ; Compare index of LIST2 with its length
    BGE CopyList1           ; If LIST2 is exhausted, copy remaining LIST1

    LDR R6, [R0, R3, LSL #2] ; Load current element of LIST1 into R6
    LDR R7, [R1, R4, LSL #2] ; Load current element of LIST2 into R7

    CMP R6, R7              ; Compare current elements of LIST1 and LIST2
    BLE CopyFromList1       ; If LIST1 element is less or equal, copy it

CopyFromList2
    STR R7, [R2, R5, LSL #2] ; Store LIST2 element into MERGED_LIST
    ADD R4, R4, #1          ; Increment LIST2 index
    B NextElement

CopyFromList1
    STR R6, [R2, R5, LSL #2] ; Store LIST1 element into MERGED_LIST
    ADD R3, R3, #1          ; Increment LIST1 index

NextElement
    ADD R5, R5, #1          ; Increment MERGED_LIST index
    B MergeLoop             ; Repeat the merge loop

CheckList2
    CMP R4, #LIST2_LEN      ; Check if LIST2 is exhausted
    BGE EndMerge            ; If both lists are exhausted, end merge

CopyList2
    LDR R7, [R1, R4, LSL #2] ; Load remaining element of LIST2
    STR R7, [R2, R5, LSL #2] ; Store it into MERGED_LIST
    ADD R4, R4, #1          ; Increment LIST2 index
    ADD R5, R5, #1          ; Increment MERGED_LIST index
    B CheckList2            ; Repeat until LIST2 is exhausted

CopyList1
    LDR R6, [R0, R3, LSL #2] ; Load remaining element of LIST1
    STR R6, [R2, R5, LSL #2] ; Store it into MERGED_LIST
    ADD R3, R3, #1          ; Increment LIST1 index
    ADD R5, R5, #1          ; Increment MERGED_LIST index
    B CheckList2            ; Repeat until LIST1 is exhausted

EndMerge
    ; End of program
    MOV R7, #1              ; Exit code
    SWI 0x11                ; Software interrupt to exit

    END

