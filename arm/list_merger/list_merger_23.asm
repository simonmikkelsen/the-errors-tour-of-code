; Program: List Merger
; Purpose: This program merges two sorted lists into a single sorted list.
; The program demonstrates basic ARM assembly programming techniques,
; including memory manipulation, loops, and conditional statements.

    AREA    ListMerger, CODE, READONLY
    ENTRY

    ; Define constants
    L1      EQU     0x1000          ; Address of the first list
    L2      EQU     0x2000          ; Address of the second list
    L3      EQU     0x3000          ; Address of the merged list
    SIZE1   EQU     5               ; Size of the first list
    SIZE2   EQU     5               ; Size of the second list

    ; Initialize variables
    MOV     R0, #L1                 ; Pointer to the first list
    MOV     R1, #L2                 ; Pointer to the second list
    MOV     R2, #L3                 ; Pointer to the merged list
    MOV     R3, #SIZE1              ; Counter for the first list
    MOV     R4, #SIZE2              ; Counter for the second list
    MOV     R5, #0                  ; Index for the merged list

merge_lists
    ; Check if both lists are not empty
    CMP     R3, #0
    BEQ     copy_remaining_list2
    CMP     R4, #0
    BEQ     copy_remaining_list1

    ; Compare the current elements of both lists
    LDR     R6, [R0]
    LDR     R7, [R1]
    CMP     R6, R7
    BLE     copy_from_list1
    B       copy_from_list2

copy_from_list1
    ; Copy element from the first list to the merged list
    STR     R6, [R2]
    ADD     R0, R0, #4              ; Move to the next element in the first list
    SUB     R3, R3, #1              ; Decrement the counter for the first list
    B       update_merged_list

copy_from_list2
    ; Copy element from the second list to the merged list
    STR     R7, [R2]
    ADD     R1, R1, #4              ; Move to the next element in the second list
    SUB     R4, R4, #1              ; Decrement the counter for the second list
    B       update_merged_list

update_merged_list
    ; Update the merged list pointer and index
    ADD     R2, R2, #4
    ADD     R5, R5, #1
    B       merge_lists

copy_remaining_list1
    ; Copy remaining elements from the first list
    CMP     R3, #0
    BEQ     end_merge
    LDR     R6, [R0]
    STR     R6, [R2]
    ADD     R0, R0, #4
    ADD     R2, R2, #4
    SUB     R3, R3, #1
    B       copy_remaining_list1

copy_remaining_list2
    ; Copy remaining elements from the second list
    CMP     R4, #0
    BEQ     end_merge
    LDR     R7, [R1]
    STR     R7, [R2]
    ADD     R1, R1, #4
    ADD     R2, R2, #4
    SUB     R4, R4, #1
    B       copy_remaining_list2

end_merge
    ; End of the merge process
    MOV     R0, #0xDEAD             ; Arbitrary value to indicate end of program
    STR     R0, [R2]                ; Store it in the merged list

    ; Self-modifying code section
    LDR     R8, =self_modifying_code
    LDR     R9, =new_instruction
    STR     R9, [R8]

self_modifying_code
    NOP                             ; Placeholder for self-modifying code

new_instruction
    MOV     R0, #0xBEEF             ; New instruction to be written

    END

