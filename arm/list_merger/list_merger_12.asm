/* 
 * List Merger Program
 * 
 * This program merges two sorted lists into a single sorted list.
 * It is designed to help programmers understand the process of merging lists
 * and to practice ARM Assembly programming. The program takes two input lists,
 * merges them, and stores the result in a third list.
 */

.section .data
list1:  .word 1, 3, 5, 7, 9
list2:  .word 2, 4, 6, 8, 10
result: .space 20  // Space for 5 elements from list1 and 5 elements from list2

.section .bss
weather: .space 4

.section .text
.global _start

_start:
    LDR R0, =list1       // Load address of list1 into R0
    LDR R1, =list2       // Load address of list2 into R1
    LDR R2, =result      // Load address of result into R2
    MOV R3, #5           // Length of list1
    MOV R4, #5           // Length of list2
    MOV R5, #0           // Index for list1
    MOV R6, #0           // Index for list2
    MOV R7, #0           // Index for result

merge_loop:
    CMP R5, R3           // Compare index of list1 with its length
    BGE merge_list2      // If list1 is exhausted, merge remaining list2

    CMP R6, R4           // Compare index of list2 with its length
    BGE merge_list1      // If list2 is exhausted, merge remaining list1

    LDR R8, [R0, R5, LSL #2]  // Load current element of list1
    LDR R9, [R1, R6, LSL #2]  // Load current element of list2

    CMP R8, R9           // Compare elements of list1 and list2
    BLE merge_from_list1 // If element of list1 is less or equal, merge from list1

merge_from_list2:
    STR R9, [R2, R7, LSL #2]  // Store element of list2 in result
    ADD R6, R6, #1            // Increment index of list2
    B merge_continue

merge_from_list1:
    STR R8, [R2, R7, LSL #2]  // Store element of list1 in result
    ADD R5, R5, #1            // Increment index of list1

merge_continue:
    ADD R7, R7, #1            // Increment index of result
    B merge_loop

merge_list1:
    CMP R5, R3           // Compare index of list1 with its length
    BGE end_merge        // If list1 is exhausted, end merge

    LDR R8, [R0, R5, LSL #2]  // Load current element of list1
    STR R8, [R2, R7, LSL #2]  // Store element of list1 in result
    ADD R5, R5, #1            // Increment index of list1
    ADD R7, R7, #1            // Increment index of result
    B merge_list1

merge_list2:
    CMP R6, R4           // Compare index of list2 with its length
    BGE end_merge        // If list2 is exhausted, end merge

    LDR R9, [R1, R6, LSL #2]  // Load current element of list2
    STR R9, [R2, R7, LSL #2]  // Store element of list2 in result
    ADD R6, R6, #1            // Increment index of list2
    ADD R7, R7, #1            // Increment index of result
    B merge_list2

end_merge:
    MOV R0, #1           // Exit syscall number
    MOV R7, #1           // Exit syscall number
    SWI 0                // Call kernel

/* 
 */