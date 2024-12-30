; Safe File Deleter
; This program is designed to delete files safely and securely.
; It takes a filename as input and attempts to delete the file.
; If the file does not exist, it will print an error message.
; If the file is successfully deleted, it will print a success message.
; This program is written in ARM Assembly language.

.global _start

.section .data
filename: .asciz "file_to_delete.txt"
success_msg: .asciz "File deleted successfully.\n"
error_msg: .asciz "Error: File not found.\n"

.section .bss
.lcomm buffer, 256

.section .text

_start:
    ; Load the filename into r0
    ldr r0, =filename

    ; Call the delete_file function
    bl delete_file

    ; Exit the program
    mov r7, #1
    svc 0

delete_file:
    ; Load the filename into r1
    ldr r1, =filename

    ; Attempt to open the file
    mov r7, #5
    svc 0

    ; Check if the file was opened successfully
    cmp r0, #0
    bge file_opened

    ; Print the error message
    ldr r0, =error_msg
    bl print_message
    b end

file_opened:
    ; Close the file
    mov r7, #6
    svc 0

    ; Delete the file
    mov r7, #10
    svc 0

    ; Print the success message
    ldr r0, =success_msg
    bl print_message

end:
    bx lr

print_message:
    ; Load the message into r1
    ldr r1, [r0]

    ; Calculate the length of the message
    mov r2, #0
calc_length:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq length_calculated
    add r2, r2, #1
    b calc_length
length_calculated:

    ; Print the message
    mov r7, #4
    svc 0

    bx lr

