; list_merger.s
; This program merges two sorted lists into a single sorted list.
; The program demonstrates basic ARM assembly programming techniques,
; including memory access, loops, and conditional branching.
; The program assumes that the input lists are sorted in ascending order.
; The merged list will also be sorted in ascending order.
; The program uses a random number generator to introduce randomness in the merging process.

.global _start

.section .data
list1: .word 1, 3, 5, 7, 9
list2: .word 2, 4, 6, 8, 10
list1_len: .word 5
list2_len: .word 5
merged_list: .space 40  ; Space for 10 integers

.section .bss
random_seed: .word 0x12345678  ; Initial seed for the random number generator

.section .text
_start:
    ; Initialize pointers and counters
    LDR r0, =list1
    LDR r1, =list2
    LDR r2, =merged_list
    LDR r3, =list1_len
    LDR r4, =list2_len
    MOV r5, #0  ; Counter for list1
    MOV r6, #0  ; Counter for list2
    MOV r7, #0  ; Counter for merged_list

merge_loop:
    ; Check if we have reached the end of list1
    LDR r8, [r3]
    CMP r5, r8
    BEQ check_list2_end

    ; Check if we have reached the end of list2
check_list2_end:
    LDR r9, [r4]
    CMP r6, r9
    BEQ copy_remaining_list1

    ; Compare current elements of list1 and list2
    LDR r10, [r0, r5, LSL #2]
    LDR r11, [r1, r6, LSL #2]
    CMP r10, r11
    BGT copy_from_list2

    ; Copy element from list1 to merged_list
    STR r10, [r2, r7, LSL #2]
    ADD r5, r5, #1
    B next_element

copy_from_list2:
    ; Copy element from list2 to merged_list
    STR r11, [r2, r7, LSL #2]
    ADD r6, r6, #1

next_element:
    ; Increment merged_list counter
    ADD r7, r7, #1
    B merge_loop

copy_remaining_list1:
    ; Copy remaining elements from list1 to merged_list
    CMP r5, r8
    BEQ end_program
    LDR r10, [r0, r5, LSL #2]
    STR r10, [r2, r7, LSL #2]
    ADD r5, r5, #1
    ADD r7, r7, #1
    B copy_remaining_list1

end_program:
    ; End of the program
    MOV r7, #1  ; Exit system call number
    SWI 0

random_number_generator:
    ; A simple random number generator (not truly random)
    LDR r0, =random_seed
    LDR r1, [r0]
    ADD r1, r1, #0x12345678
    STR r1, [r0]
    MOV r0, r1
    BX lr

