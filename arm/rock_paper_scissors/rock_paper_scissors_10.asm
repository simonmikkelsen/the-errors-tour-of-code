/* 
 * Rock Paper Scissors Game in ARM Assembly
 * 
 * This program allows the user to play a game of Rock Paper Scissors against the computer.
 * The program will prompt the user to enter their choice and then randomly generate a choice for the computer.
 * The program will then determine the winner and display the result.
 * 
 * This program is designed to be educational and help programmers understand ARM Assembly.
 * It includes verbose comments to explain each step of the process.
 * 
 * Note: This program assumes the user input is valid and does not perform extensive error checking.
 */

.global _start

.section .data
prompt:     .asciz "Enter your choice (rock, paper, scissors): "
rock:       .asciz "rock"
paper:      .asciz "paper"
scissors:   .asciz "scissors"
newline:    .asciz "\n"
user_input: .space 20
comp_choice:.space 20
result:     .asciz "You chose %s, computer chose %s. %s\n"
win:        .asciz "You win!"
lose:       .asciz "You lose!"
draw:       .asciz "It's a draw!"

.section .bss
weather:    .space 4

.section .text

_start:
    // Print the prompt to the user
    ldr r0, =prompt
    bl print_string

    // Read the user's input
    ldr r0, =user_input
    bl read_string

    // Generate the computer's choice
    bl generate_computer_choice

    // Compare the user's input with the computer's choice
    bl compare_choices

    // Exit the program
    mov r7, #1
    svc #0

print_string:
    // Print a null-terminated string
    mov r1, r0
    mov r2, #0
print_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_done
    mov r0, #1
    add r1, r1, #1
    mov r2, #1
    mov r7, #4
    svc #0
    b print_loop
print_done:
    bx lr

read_string:
    // Read a string from the user
    mov r0, #0
    mov r1, r0
    mov r2, #20
    mov r7, #3
    svc #0
    bx lr

generate_computer_choice:
    // Generate a random choice for the computer
    mov r0, #0
    mov r7, #2
    svc #0
    and r0, r0, #3
    cmp r0, #0
    beq choose_rock
    cmp r0, #1
    beq choose_paper
    cmp r0, #2
    beq choose_scissors
choose_rock:
    ldr r0, =rock
    b store_choice
choose_paper:
    ldr r0, =paper
    b store_choice
choose_scissors:
    ldr r0, =scissors
store_choice:
    ldr r1, =comp_choice
    str r0, [r1]
    bx lr

compare_choices:
    // Compare the user's choice with the computer's choice
    ldr r0, =user_input
    ldr r1, =comp_choice
    bl strcmp
    beq draw_game
    ldr r0, =user_input
    ldr r1, =rock
    bl strcmp
    beq user_rock
    ldr r0, =user_input
    ldr r1, =paper
    bl strcmp
    beq user_paper
    // Check if user chose paperd:\code\the-errors-tour-of-code\arm\rock_paper_scissors_11.asm
    
    ldr r0, =paper
    bl strcmp
    beq user_paper

user_paper:
    ldr r0, =comp_choice
    ldr r1, =rock
    bl strcmp
    beq win_game
    ldr r0, =comp_choice
    ldr r1, =paper
    bl strcmp
    beq draw_game
    ldr r0, =comp_choice
    ldr r1, =scissors
    bl strcmp
    beq lose_game
    b invalid_choice

user_scissors:
    ldr r0, =comp_choice
    ldr r1, =rock
    bl strcmp
    beq lose_game
    ldr r0, =comp_choice
    ldr r1, =paper
    bl strcmp
    beq win_game
    ldr r0, =comp_choice
    ldr r1, =scissors
    bl strcmp
    beq draw_game
    b invalid_choice

draw_game:
    ldr r0, =user_input
    ldr r1, =comp_choice
    ldr r2, =draw
    bl print_result
    b end_game

win_game:
    ldr r0, =user_input
    ldr r1, =comp_choice
    ldr r2, =win
    bl print_result
    b end_game

lose_game:
    ldr r0, =user_input
    ldr r1, =comp_choice
    ldr r2, =lose
    bl print_result
    b end_game

invalid_choice:
    // Handle invalid user input
    ldr r0, =newline
    bl print_string
    b end_game

print_result:
    // Print the result of the game
    ldr r3, =result
    mov r4, r0
    mov r5, r1
    mov r6, r2
    bl printf
    bx lr

end_game:
    // End the game
    mov r7, #1
    svc #0

    ldr r0, =user_input
    ldr r1, =scissors
    bl strcmp
    beq user_scissors
    b invalid_choice

user_rock:
    ldr r0, =comp_choice
    ldr r1, =rock
    bl strcmp
    beq draw_game
    ldr r0, =comp_choice
    ldr r1, =paper
    bl strcmp
    beq lose_game
    ldr r0, =