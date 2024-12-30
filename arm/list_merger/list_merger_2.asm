; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic memory allocation, list traversal, and merging techniques.
; It is intended for educational purposes to help programmers understand ARM Assembly.

.global _start

.section .data
list1: .word 1, 3, 5, 7, 9
list2: .word 2, 4, 6, 8, 10
len1: .word 5
len2: .word 5

.section .bss
.comm merged_list, 40  ; Allocate space for the merged list (10 elements)

.section .text

_start:
    ; Load the lengths of the lists
    LDR r0, =len1
    LDR r1, [r0]
    LDR r0, =len2
    LDR r2, [r0]

    ; Load the addresses of the lists
    LDR r3, =list1
    LDR r4, =list2

    ; Initialize pointers for the merged list
    LDR r5, =merged_list
    MOV r6, #0  ; Index for merged list

    ; Initialize counters for list traversal
    MOV r7, #0  ; Counter for list1
    MOV r8, #0  ; Counter for list2

merge_loop:
    ; Check if we have reached the end of list1
    CMP r7, r1
    BEQ copy_remaining_list2

    ; Check if we have reached the end of list2
    CMP r8, r2
    BEQ copy_remaining_list1

    ; Load the current elements from both lists
    LDR r9, [r3, r7, LSL #2]
    LDR r10, [r4, r8, LSL #2]

    ; Compare the elements and merge them into the new list
    CMP r9, r10
    BLE merge_from_list1
    B merge_from_list2

merge_from_list1:
    STR r9, [r5, r6, LSL #2]
    ADD r7, r7, #1
    B increment_merged_index

merge_from_list2:
    STR r10, [r5, r6, LSL #2]
    ADD r8, r8, #1

increment_merged_index:
    ADD r6, r6, #1
    B merge_loop

copy_remaining_list1:
    CMP r7, r1
    BEQ end_merge
    LDR r9, [r3, r7, LSL #2]
    STR r9, [r5, r6, LSL #2]
    ADD r7, r7, #1
    ADD r6, r6, #1
    B copy_remaining_list1

copy_remaining_list2:
    CMP r8, r2
    BEQ end_merge
    LDR r10, [r4, r8, LSL #2]
    STR r10, [r5, r6, LSL #2]
    ADD r8, r8, #1
    ADD r6, r6, #1
    B copy_remaining_list2

end_merge:
    ; End of the program
    MOV r7, #1  ; Exit code
    SWI 0x900001  ; Exit syscall

