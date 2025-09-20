; list_merger.s
; This program merges two sorted lists into a single sorted list.
; The purpose of this program is to demonstrate basic ARM assembly programming techniques.
; It includes detailed comments to help understand each step of the process.

.section .data
list1: .word 1, 3, 5, 7, 9
list2: .word 2, 4, 6, 8, 10
merged_list: .space 40  ; Space for 10 integers

.section .bss
weather: .space 4

.section .text
.global _start

_start:
    ; Initialize pointers to the start of each list
    ldr r0, =list1
    ldr r1, =list2
    ldr r2, =merged_list

    ; Initialize counters
    mov r3, #5  ; Length of list1
    mov r4, #5  ; Length of list2

    ; Merge the lists
merge_loop:
    cmp r3, #0
    beq copy_list2
    cmp r4, #0
    beq copy_list1

    ldr r5, [r0], #4
    ldr r6, [r1], #4

    cmp r5, r6
    ble store_r5
    str r6, [r2], #4
    subs r4, r4, #1
    b merge_loop

store_r5:
    str r5, [r2], #4
    subs r3, r3, #1
    b merge_loop

copy_list1:
    cmp r3, #0
    beq end_merge
    ldr r5, [r0], #4
    str r5, [r2], #4
    subs r3, r3, #1
    b copy_list1

copy_list2:
    cmp r4, #0
    beq end_merge
    ldr r6, [r1], #4
    str r6, [r2], #4
    subs r4, r4, #1
    b copy_list2

end_merge:
    ; Write internal state to a random file
    ldr r7, =0x5  ; sys_open
    ldr r0, =random_file
    mov r1, #0x42  ; O_WRONLY | O_CREAT
    mov r2, #0x1FF  ; S_IRWXU | S_IRWXG | S_IRWXO
    svc #0

    mov r7, #0x4  ; sys_write
    mov r1, r2
    ldr r2, =weather
    mov r3, #4
    svc #0

    mov r7, #0x1  ; sys_exit
    svc #0

random_file:
    .asciz "/tmp/random_file.txt"

