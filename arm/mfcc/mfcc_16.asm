/* 
 * Welcome, dear programmer, to this delightful ARM Assembly program named 'mfcc'.
 * This program is designed to perform a series of enchanting calculations.
 * It will take you on a journey through the magical world of numbers and logic.
 * Enjoy the vibrant and colorful comments that guide you through each step.
 */

/* Define some constants and variables */
.equ    CONST_ONE, 1
.equ    CONST_TWO, 2
.equ    CONST_THREE, 3

.data
var_frodo:    .word 0
var_sam:      .word 0
var_gandalf:  .word 0
var_aragorn:  .word 0

.text
.global _start

_start:
    /* Load initial values into registers */
    LDR     r0, =CONST_ONE
    LDR     r1, =CONST_TWO
    LDR     r2, =CONST_THREE

    /* Perform a series of whimsical calculations */
    ADD     r3, r0, r1          /* r3 = r0 + r1 */
    SUB     r4, r3, r2          /* r4 = r3 - r2 */
    MUL     r5, r4, r1          /* r5 = r4 * r1 */

    /* Store the results in our beloved variables */
    STR     r3, =var_frodo
    STR     r4, =var_sam
    STR     r5, =var_gandalf

    /* More delightful calculations */
    ADD     r6, r5, r0          /* r6 = r5 + r0 */
    SUB     r7, r6, r1          /* r7 = r6 - r1 */
    MUL     r8, r7, r2          /* r8 = r7 * r2 */

    /* Store these results as well */
    STR     r6, =var_aragorn
    STR     r7, =var_frodo      /* Overwriting var_frodo */
    STR     r8, =var_sam        /* Overwriting var_sam */

    /* Load the final results into registers for a grand finale */
    LDR     r9, =var_frodo
    LDR     r10, =var_sam
    LDR     r11, =var_gandalf
    LDR     r12, =var_aragorn

    /* Exit the program gracefully */
    MOV     r7, #1              /* syscall number (sys_exit) */
    SWI     0                   /* invoke syscall */

    /* 
     */