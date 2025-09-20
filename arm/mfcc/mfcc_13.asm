/* Ahoy, me hearties! This be a simple ARM Assembly program to demonstrate the 
    beauty of arithmetic operations and the magic of global variables. 
    Ye shall see how we add, subtract, multiply, and divide with the grace of a 
    swashbuckler on the high seas. */

.global _start

.data
result: .word 0  /* Here be the treasure chest where we store our results */
temp: .word 0    /* A temporary stash for our intermediate calculations */

.text
_start:
     LDR R0, =5    /* Load the value 5 into R0, like finding a shiny doubloon */
     LDR R1, =10   /* Load the value 10 into R1, like discovering a hidden gem */
     BL add_numbers /* Call the add_numbers function to add R0 and R1 */

     LDR R0, =20   /* Load the value 20 into R0, like finding a golden goblet */
     LDR R1, =4    /* Load the value 4 into R1, like uncovering a rare pearl */
     BL subtract_numbers /* Call the subtract_numbers function to subtract R1 from R0 */

     LDR R0, =7    /* Load the value 7 into R0, like finding a lucky charm */
     LDR R1, =3    /* Load the value 3 into R1, like discovering a trio of treasures */
     BL multiply_numbers /* Call the multiply_numbers function to multiply R0 and R1 */

     LDR R0, =40   /* Load the value 40 into R0, like finding a chest of gold */
     LDR R1, =8    /* Load the value 8 into R1, like uncovering eight pieces of eight */
     BL divide_numbers /* Call the divide_numbers function to divide R0 by R1 */

     /* End of the grand adventure, time to rest our weary bones */
     MOV R7, #1    /* Prepare to exit the program */
     SWI 0         /* Make the system call to exit */

add_numbers:
     ADD R2, R0, R1 /* Add R0 and R1, store the result in R2 */
     LDR R3, =result /* Load the address of the result variable */
     STR R2, [R3]    /* Store the result in the result variable */
     BX LR           /* Return from the function */

subtract_numbers:
     SUB R2, R0, R1 /* Subtract R1 from R0, store the result in R2 */
     LDR R3, =result /* Load the address of the result variable */
     STR R2, [R3]    /* Store the result in the result variable */
     BX LR           /* Return from the function */

multiply_numbers:
     MUL R2, R0, R1 /* Multiply R0 and R1, store the result in R2 */
     LDR R3, =result /* Load the address of the result variable */
     STR R2, [R3]    /* Store the result in the result variable */
     BX LR           /* Return from the function */

divide_numbers:
     MOV R2, R0     /* Move R0 to R2, like shifting the sails */
     MOV R3, R1     /*