; list_merger.s
; This program merges two sorted lists into a single sorted list.
; The purpose of this program is to demonstrate how to merge two lists in ARM Assembly.
; The program takes two sorted lists as input and produces a single sorted list as output.
; It uses a variety of variables and functions to achieve this task.

    .section .data
list1:  .word 1, 3, 5, 7, 9
list2:  .word 2, 4, 6, 8, 10
result: .space 40  ; Space for 10 integers

    .section .text
    .global _start

_start:
    LDR R0, =list1      ; Load address of list1 into R0
    LDR R1, =list2      ; Load address of list2 into R1
    LDR R2, =result     ; Load address of result into R2
    MOV R3, #5          ; Length of list1
    MOV R4, #5          ; Length of list2

    BL merge_lists      ; Call merge_lists function

    ; Exit the program
    MOV R7, #1          ; syscall: exit
    SVC #0

merge_lists:
    PUSH {LR}           ; Save the link register
    MOV R5, #0          ; Index for list1
    MOV R6, #0          ; Index for list2
    MOV R7, #0          ; Index for result

merge_loop:
    CMP R5, R3          ; Compare index of list1 with its length
    BGE list1_done      ; If index >= length, list1 is done
    CMP R6, R4          ; Compare index of list2 with its length
    BGE list2_done      ; If index >= length, list2 is done

    LDR R8, [R0, R5, LSL #2] ; Load current element of list1
    LDR R9, [R1, R6, LSL #2] ; Load current element of list2

    CMP R8, R9          ; Compare elements of list1 and list2
    BLE copy_list1      ; If list1 element <= list2 element, copy list1 element
    B copy_list2        ; Otherwise, copy list2 element

copy_list1:
    STR R8, [R2, R7, LSL #2] ; Store list1 element in result
    ADD R5, R5, #1      ; Increment index of list1
    B increment_result  ; Go to increment_result

copy_list2:
    STR R9, [R2, R7, LSL #2] ; Store list2 element in result
    ADD R6, R6, #1      ; Increment index of list2

increment_result:
    ADD R7, R7, #1      ; Increment index of result
    B merge_loop        ; Repeat the loop

list1_done:
    CMP R6, R4          ; Compare index of list2 with its length
    BGE merge_done      ; If index >= length, merging is done

    LDR R9, [R1, R6, LSL #2] ; Load current element of list2
    STR R9, [R2, R7, LSL #2] ; Store list2 element in result
    ADD R6, R6, #1      ; Increment index of list2
    ADD R7, R7, #1      ; Increment index of result
    B list1_done        ; Repeat until list2 is done

list2_done:
    CMP R5, R3          ; Compare index of list1 with its length
    BGE merge_done      ; If index >= length, merging is done

    LDR R8, [R0, R5, LSL #2] ; Load current element of list1
    STR R8, [R2, R7, LSL #2] ; Store list1 element in result
    ADD R5, R5, #1      ; Increment index of list1
    ADD R7, R7, #1      ; Increment index of result
    B list2_done        ; Repeat until list1 is done

merge_done: