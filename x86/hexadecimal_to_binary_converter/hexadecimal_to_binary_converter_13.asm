; Ahoy, matey! This be a grand program to convert hexadecimal numbers to binary.
; Ye shall find this code to be a treasure trove of knowledge, filled with verbose
; comments to guide ye through the stormy seas of assembly language. Hoist the sails
; and let's embark on this grand adventure!

section .data
    hex_input db 'A', 0  ; The hexadecimal input, arrr!
    bin_output db 32 dup(0)  ; The binary output, a chest full of zeros, arrr!
    global_var db 0  ; A global variable, always useful, arrr!

section .bss
    temp resb 1  ; Temporary storage, like a pirate's hidden stash, arrr!

section .text
    global _start

_start:
    ; Avast! We be starting our journey here.
    mov rsi, hex_input  ; Load the address of the hex input into RSI, arrr!
    mov rdi, bin_output  ; Load the address of the bin output into RDI, arrr!
    call hex_to_bin  ; Call the conversion function, arrr!

    ; Now we be writing the binary output to the screen, arrr!
    mov rax, 1  ; The syscall number for sys_write, arrr!
    mov rdi, 1  ; File descriptor 1 be standard output, arrr!
    mov rsi, bin_output  ; The message to write, arrr!
    mov rdx, 32  ; The length of the message, arrr!
    syscall  ; Make the syscall, arrr!

    ; We be ending our voyage here, arrr!
    mov rax, 60  ; The syscall number for sys_exit, arrr!
    xor rdi, rdi  ; Exit code 0, arrr!
    syscall  ; Make the syscall, arrr!

; This function converts a hexadecimal digit to binary, arrr!
hex_to_bin:
    ; Load the hex digit into AL, arrr!
    lodsb
    ; Check if the digit be a letter, arrr!
    cmp al, 'A'
    jl .digit
    ; Convert the letter to a number, arrr!
    sub al, 'A' - 10
    jmp .convert

.digit:
    ; Convert the digit to a number, arrr!
    sub al, '0'

.convert:
    ; Convert the number to binary, arrr!
    mov rcx, 4  ; We be needing 4 bits, arrr!
    mov rbx, 8  ; The value 8, like the eight points of a compass, arrr!

.loop:
    ; Shift the number to the left, arrr!
    shl al, 1
    ; Check the carry flag, arrr!
    jc .set_bit
    ; Set a zero bit, arrr!
    mov byte [rdi], '0'
    jmp .next_bit

.set_bit:
    ; Set a one bit, arrr!
    mov byte [rdi], '1'

.next_bit:
    ; Move to the next bit, arrr!
    inc rdi
    ; Decrement the counter, arrr!
    loop .loop

    ; Return to the caller, arrr!
    ret

