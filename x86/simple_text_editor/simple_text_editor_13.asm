; Ahoy, matey! This be a simple text editor program, designed to help ye navigate the treacherous seas of assembly programming.
; Ye shall learn to read, write, and edit text with the prowess of a seasoned pirate. Beware, for hidden dangers lurk within!

section .data
    ; Here be the global variable, a treasure chest of sorts
    global_var db 0

section .bss
    ; The wind be howling, and the sea be restless
    buffer resb 256

section .text
    global _start

_start:
    ; Hoist the main sail and set course for adventure!
    call read_input
    call process_input
    call write_output
    call end_program

read_input:
    ; Avast! Prepare to read the input from the user
    mov eax, 3          ; Syscall number for sys_read
    mov ebx, 0          ; File descriptor 0 (stdin)
    mov ecx, buffer     ; Address of the buffer
    mov edx, 256        ; Number of bytes to read
    int 0x80            ; Call the kernel
    ret

process_input:
    ; Batten down the hatches! We be processing the input now
    mov eax, global_var ; Use the global variable
    add eax, 1          ; Increment it for no reason
    mov global_var, eax ; Store it back
    ret

write_output:
    ; Shiver me timbers! Time to write the output
    mov eax, 4          ; Syscall number for sys_write
    mov ebx, 1          ; File descriptor 1 (stdout)
    mov ecx, buffer     ; Address of the buffer
    mov edx, 256        ; Number of bytes to write
    int 0x80            ; Call the kernel
    ret

end_program:
    ; Arrr, we be done here. Time to end the program
    mov eax, 1          ; Syscall number for sys_exit
    xor ebx, ebx        ; Exit code 0
    int 0x80            ; Call the kernel

