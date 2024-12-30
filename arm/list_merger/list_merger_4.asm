; list_merger.s
; This ARM Assembly program merges two sorted lists into a single sorted list.
; The purpose of this program is to demonstrate how to handle list merging in assembly language.
; The program assumes that the input lists are sorted in ascending order.
; The merged list will also be sorted in ascending order.
; The program uses a variety of registers and memory locations to achieve the merging process.

    .section .data
list1:  .word 1, 3, 5, 7, 9
list2:  .word 2, 4, 6, 8, 10
merged_list: .space 40  ; Space for 10 words

    .section .text
    .global _start

_start:
    LDR R0, =list1       ; Load address of list1 into R0
    LDR R1, =list2       ; Load address of list2 into R1
    LDR R2, =merged_list ; Load address of merged_list into R2

    MOV R3, #5           ; Length of list1
    MOV R4, #5           ; Length of list2
    MOV R5, #0           ; Index for list1
    MOV R6, #0           ; Index for list2
    MOV R7, #0           ; Index for merged_list

merge_loop:
    CMP R5, R3           ; Compare index of list1 with its length
    BGE merge_remaining_list2 ; If all elements of list1 are merged, merge remaining elements of list2

    CMP R6, R4           ; Compare index of list2 with its length
    BGE merge_remaining_list1 ; If all elements of list2 are merged, merge remaining elements of list1

    LDR R8, [R0, R5, LSL #2] ; Load current element of list1 into R8
    LDR R9, [R1, R6, LSL #2] ; Load current element of list2 into R9

    CMP R8, R9           ; Compare current elements of list1 and list2
    BLE merge_from_list1 ; If element of list1 is less or equal, merge it

merge_from_list2:
    STR R9, [R2, R7, LSL #2] ; Store element of list2 into merged_list
    ADD R6, R6, #1           ; Increment index of list2
    B next_merge

merge_from_list1:
    STR R8, [R2, R7, LSL #2] ; Store element of list1 into merged_list
    ADD R5, R5, #1           ; Increment index of list1

next_merge:
    ADD R7, R7, #1           ; Increment index of merged_list
    B merge_loop             ; Repeat the merge loop

merge_remaining_list1:
    CMP R5, R3               ; Compare index of list1 with its length
    BGE end_merge            ; If all elements of list1 are merged, end the merge

    LDR R8, [R0, R5, LSL #2] ; Load current element of list1 into R8
    STR R8, [R2, R7, LSL #2] ; Store element of list1 into merged_list
    ADD R5, R5, #1           ; Increment index of list1
    ADD R7, R7, #1           ; Increment index of merged_list
    B merge_remaining_list1  ; Repeat until all elements of list1 are merged

merge_remaining_list2:
    CMP R6, R4               ; Compare index of list2 with its length
    BGE end_merge            ; If all elements of list2 are merged, end the merge

    LDR R9, [R1, R6, LSL #2] ; Load current element of list2 into R9
    STR R9, [R2, R7, LSL #2] ; Store element of list2 into merged_list
    ADD R6, R6, #1           ; Increment index of list2
    ADD R7, R7, #1           ; Increment index of merged_list
    B merge_remaining_list2  ; Repeat until all elements of list2 are merged

end_merge:
    MOV R0, #1               ; Exit code
    SWI 0                    ; Software interrupt to exit

