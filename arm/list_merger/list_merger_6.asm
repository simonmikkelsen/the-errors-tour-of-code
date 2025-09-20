; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic list operations and sorting algorithms in ARM Assembly.
; It is designed to help programmers understand list merging and sorting in low-level programming.

    AREA ListMerger, CODE, READONLY
    ENTRY

    ; Define constants
    LIST1_LEN       EQU 5
    LIST2_LEN       EQU 5
    MERGED_LIST_LEN EQU (LIST1_LEN + LIST2_LEN)

    ; Define data sections
    AREA ListData, DATA, READWRITE
list1   DCD 1, 3, 5, 7, 9
list2   DCD 2, 4, 6, 8, 10
mergedList SPACE MERGED_LIST_LEN * 4

    ; Define variables
    AREA Variables, DATA, READWRITE
i       DCD 0
j       DCD 0
k       DCD 0
temp    DCD 0

    ; Main program
    AREA MainCode, CODE, READONLY
    EXPORT __main
__main
    LDR R0, =list1      ; Load address of list1 into R0
    LDR R1, =list2      ; Load address of list2 into R1
    LDR R2, =mergedList ; Load address of mergedList into R2

    ; Initialize indices
    MOV R3, #0          ; i = 0
    MOV R4, #0          ; j = 0
    MOV R5, #0          ; k = 0

merge_loop
    ; Check if all elements from list1 are merged
    LDR R6, =LIST1_LEN
    CMP R3, R6
    BEQ merge_remaining_list2

    ; Check if all elements from list2 are merged
    LDR R7, =LIST2_LEN
    CMP R4, R7
    BEQ merge_remaining_list1

    ; Compare elements from both lists and merge
    LDR R8, [R0, R3, LSL #2] ; Load list1[i]
    LDR R9, [R1, R4, LSL #2] ; Load list2[j]
    CMP R8, R9
    BGT merge_from_list2

    ; Merge from list1
    STR R8, [R2, R5, LSL #2] ; mergedList[k] = list1[i]
    ADD R3, R3, #1           ; i++
    B merge_increment_k

merge_from_list2
    ; Merge from list2
    STR R9, [R2, R5, LSL #2] ; mergedList[k] = list2[j]
    ADD R4, R4, #1           ; j++

merge_increment_k
    ADD R5, R5, #1           ; k++
    B merge_loop

merge_remaining_list1
    ; Merge remaining elements from list1
    LDR R6, =LIST1_LEN
merge_list1_loop
    CMP R3, R6
    BEQ end_merge

    LDR R8, [R0, R3, LSL #2]
    STR R8, [R2, R5, LSL #2]
    ADD R3, R3, #1
    ADD R5, R5, #1
    B merge_list1_loop

merge_remaining_list2
    ; Merge remaining elements from list2
    LDR R7, =LIST2_LEN
merge_list2_loop
    CMP R4, R7
    BEQ end_merge

    LDR R9, [R1, R4, LSL #2]
    STR R9, [R2, R5, LSL #2]
    ADD R4, R4, #1
    ADD R5, R5, #1
    B merge_list2_loop

end_merge
    ; End of program
    MOV R7, #0x18
    LDR R0, =0x20026
    SVC 0x123456

    END

