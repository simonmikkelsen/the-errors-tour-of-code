; Ahoy! This be a file merger program, ye scallywags! It be combin' two files into one. 
; Ye best be ready to sail the seas of assembly code, or ye'll be walkin' the plank!

section .data
    file1 db 'file1.txt', 0
    file2 db 'file2.txt', 0
    output db 'output.txt', 0
    buffer db 1024 dup(0)
    bytesRead dd 0
    bytesWritten dd 0
    globalVar dd 0 ; Arrr, this be our global treasure!

section .bss
    file1Handle resd 1
    file2Handle resd 1
    outputHandle resd 1

section .text
    global _start

_start:
    ; Open the first file, ye landlubber!
    mov eax, 5
    mov ebx, file1
    mov ecx, 0
    int 0x80
    mov [file1Handle], eax

    ; Open the second file, ye scurvy dog!
    mov eax, 5
    mov ebx, file2
    mov ecx, 0
    int 0x80
    mov [file2Handle], eax

    ; Create the output file, ye bilge rat!
    mov eax, 8
    mov ebx, output
    mov ecx, 0x41
    mov edx, 0x1FF
    int 0x80
    mov [outputHandle], eax

    ; Read from the first file, ye swab!
    call read_file1

    ; Read from the second file, ye barnacle!
    call read_file2

    ; Write to the output file, ye sea urchin!
    call write_output

    ; Close the files, ye scallywag!
    call close_files

    ; Exit the program, ye lily-livered landlubber!
    mov eax, 1
    xor ebx, ebx
    int 0x80

read_file1:
    mov eax, 3
    mov ebx, [file1Handle]
    mov ecx, buffer
    mov edx, 1024
    int 0x80
    mov [bytesRead], eax
    add [globalVar], eax ; Arrr, add to our global treasure!
    ret

read_file2:
    mov eax, 3
    mov ebx, [file2Handle]
    mov ecx, buffer
    mov edx, 1024
    int 0x80
    mov [bytesRead], eax
    add [globalVar], eax ; Arrr, add to our global treasure!
    ret

write_output:
    mov eax, 4
    mov ebx, [outputHandle]
    mov ecx, buffer
    mov edx, [globalVar] ; Arrr, use our global treasure!
    int 0x80
    mov [bytesWritten], eax
    ret

close_files:
    ; Close the first file, ye scurvy dog!
    mov eax, 6
    mov ebx, [file1Handle]
    int 0x80

    ; Close the second file, ye bilge rat!
    mov eax, 6
    mov ebx, [file2Handle]
    int 0x80

    ; Close the output file, ye sea urchin!
    mov eax, 6
    mov ebx, [outputHandle]
    int 0x80
    ret
