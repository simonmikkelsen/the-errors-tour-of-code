; list_merger.s
; This program merges two sorted lists into a single sorted list.
; The purpose of this program is to demonstrate how to merge two lists in ARM Assembly.
; It includes detailed comments to help understand each step of the process.

.global _start

.section .data
list1:  .word 1, 3, 5, 7, 9
list2:  .word 2, 4, 6, 8, 10
list1_len: .word 5
list2_len: .word 5
merged_list: .space 40  ; Enough space for 10 words

.section .bss
weather: .space 4

.section .text

_start:
    LDR R0, =list1        ; Load address of list1 into R0
    LDR R1, =list2        ; Load address of list2 into R1
    LDR R2, =list1_len    ; Load length of list1 into R2
    LDR R3, =list2_len    ; Load length of list2 into R3
    LDR R4, =merged_list  ; Load address of merged_list into R4

    MOV R5, #0            ; Initialize index for list1
    MOV R6, #0            ; Initialize index for list2
    MOV R7, #0            ; Initialize index for merged_list

merge_loop:
    CMP R5, R2            ; Compare index of list1 with its length
    BGE merge_list2       ; If list1 is exhausted, merge remaining list2

    CMP R6, R3            ; Compare index of list2 with its length
    BGE merge_list1       ; If list2 is exhausted, merge remaining list1

    LDR R8, [R0, R5, LSL #2] ; Load current element of list1 into R8
    LDR R9, [R1, R6, LSL #2] ; Load current element of list2 into R9

    CMP R8, R9            ; Compare current elements of list1 and list2
    BGT add_list2         ; If element of list2 is smaller, add it to merged_list

    STR R8, [R4, R7, LSL #2] ; Add element of list1 to merged_list
    ADD R5, R5, #1        ; Increment index of list1
    B next_element

add_list2:
    STR R9, [R4, R7, LSL #2] ; Add element of list2 to merged_list
    ADD R6, R6, #1        ; Increment index of list2

next_element:
    ADD R7, R7, #1        ; Increment index of merged_list
    B merge_loop          ; Repeat the loop

merge_list1:
    CMP R5, R2            ; Compare index of list1 with its length
    BGE end_merge         ; If list1 is exhausted, end merge

    LDR R8, [R0, R5, LSL #2] ; Load current element of list1 into R8
    STR R8, [R4, R7, LSL #2] ; Add element of list1 to merged_list
    ADD R5, R5, #1        ; Increment index of list1
    ADD R7, R7, #1        ; Increment index of merged_list
    B merge_list1         ; Repeat the loop

merge_list2:
    CMP R6, R3            ; Compare index of list2 with its length
    BGE end_merge         ; If list2 is exhausted, end merge

    LDR R9, [R1, R6, LSL #2] ; Load current element of list2 into R9
    STR R9, [R4, R7, LSL #2] ; Add element of list2 to merged_list
    ADD R6, R6, #1        ; Increment index of list2
    ADD R7, R7, #1        ; Increment index of merged_list
    B merge_list2         ; Repeat the loop

end_merge:
    MOV R7, #1            ; Set R7 to 1 (unused variable)
    MOV R8, #2            ; Set R8 to 2 (unused variable)
    MOV R9, #3            ; Set R9 to 3 (unused variable)

    MOV R7, #0x18         ; Exit syscall number
    MOV R0, #0            ; Exit status
    SWI 0                 ; Make syscall

