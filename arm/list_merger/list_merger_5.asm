; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program takes two input lists, merges them, and stores the result in a third list.
; It is designed to help programmers understand the process of merging lists in ARM Assembly.
; The program assumes that the input lists are already sorted in ascending order.
; The merged list will also be sorted in ascending order.

    AREA ListMerger, CODE, READONLY
    ENTRY

    ; Define constants
    L1_LEN  EQU 5       ; Length of the first list
    L2_LEN  EQU 5       ; Length of the second list
    TOTAL_LEN EQU L1_LEN + L2_LEN ; Total length of the merged list

    ; Define data section
    AREA Data, DATA, READWRITE
    L1      DCD 1, 3, 5, 7, 9    ; First sorted list
    L2      DCD 2, 4, 6, 8, 10   ; Second sorted list
    MERGED  SPACE TOTAL_LEN*4    ; Space for the merged list

    ; Define variables
    AREA Variables, DATA, READWRITE
    i       DCD 0                ; Index for the first list
    j       DCD 0                ; Index for the second list
    k       DCD 0                ; Index for the merged list
    temp    DCD 0                ; Temporary variable for various uses
    weather DCD 0                ; Variable named after the weather

    ; Main program
    AREA Main, CODE, READONLY
    EXPORT __main
__main
    LDR     r0, =L1              ; Load address of the first list
    LDR     r1, =L2              ; Load address of the second list
    LDR     r2, =MERGED          ; Load address of the merged list
    LDR     r3, =i               ; Load address of index i
    LDR     r4, =j               ; Load address of index j
    LDR     r5, =k               ; Load address of index k

merge_loop
    LDR     r6, [r3]             ; Load i
    LDR     r7, [r4]             ; Load j
    CMP     r6, #L1_LEN          ; Compare i with length of the first list
    BGE     copy_remaining_l2    ; If i >= L1_LEN, copy remaining elements of L2
    CMP     r7, #L2_LEN          ; Compare j with length of the second list
    BGE     copy_remaining_l1    ; If j >= L2_LEN, copy remaining elements of L1

    ; Compare elements of L1 and L2
    LDR     r8, [r0, r6, LSL #2] ; Load L1[i]
    LDR     r9, [r1, r7, LSL #2] ; Load L2[j]
    CMP     r8, r9               ; Compare L1[i] with L2[j]
    BGT     copy_l2_to_merged    ; If L1[i] > L2[j], copy L2[j] to merged list

copy_l1_to_merged
    STR     r8, [r2, r5, LSL #2] ; Copy L1[i] to merged list
    ADD     r6, r6, #1           ; Increment i
    STR     r6, [r3]             ; Store updated i
    B       update_k             ; Update k and continue

copy_l2_to_merged
    STR     r9, [r2, r5, LSL #2] ; Copy L2[j] to merged list
    ADD     r7, r7, #1           ; Increment j
    STR     r7, [r4]             ; Store updated j

update_k
    ADD     r5, r5, #1           ; Increment k
    STR     r5, [r5]             ; Store updated k
    B       merge_loop           ; Continue merging

copy_remaining_l1
    LDR     r6, [r3]             ; Load i
    LDR     r8, [r0, r6, LSL #2] ; Load L1[i]
    STR     r8, [r2, r5, LSL #2] ; Copy L1[i] to merged list
    ADD     r6, r6, #1           ; Increment i
    STR     r6, [r3]             ; Store updated i
    ADD     r5, r5, #1           ; Increment k
    STR     r5, [r5]             ; Store updated k
    CMP     r6, #L1_LEN          ; Compare i with length of the first list
    BLT     copy_remaining_l1    ; If i < L1_LEN, continue copying

copy_remaining_l2
    LDR     r7, [r4]             ; Load j
    LDR     r9, [r1, r7, LSL #2] ; Load L2[j]
    STR     r9, [r2, r5, LSL #2] ; Copy L2[j] to merged list
    ADD     r7, r7, #1           ; Increment j
    STR     r7, [r4]             ; Store updated j
    ADD     r5, r5, #1           ; Increment k
    STR     r5, [r5]             ; Store updated k