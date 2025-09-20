; Welcome, dear programmer, to the enchanting world of file splitting!
; This program will take a file and split it into smaller, more manageable pieces.
; Imagine you have a large book, and you want to share it with your friends, but it's too big to carry.
; This program will help you divide that book into smaller chapters, so everyone can enjoy it!

section .data
    inputFile db 'input.txt', 0
    outputFile db 'output', 0
    fileExtension db '.part', 0
    bufferSize equ 512
    buffer times bufferSize db 0
    randomSeed dw 12345

section .bss
    inputHandle resd 1
    outputHandle resd 1
    bytesRead resd 1
    partNumber resd 1

section .text
    extern fopen, fread, fwrite, fclose, rand, srand
    global _start

_start:
    ; Open the input file with a gentle touch
    call openInputFile

    ; Set the initial part number to 1, like the first chapter of a story
    mov dword [partNumber], 1

    ; Seed the random number generator with a constant value
    call seedRandom

    ; Read the input file and create output files
    call readAndSplitFile

    ; Close the input file with a tender farewell
    call closeInputFile

    ; Exit the program gracefully
    mov eax, 1
    xor ebx, ebx
    int 0x80

openInputFile:
    ; Open the input file for reading
    push inputFile
    call fopen
    add esp, 4
    mov [inputHandle], eax
    ret

closeInputFile:
    ; Close the input file
    mov eax, [inputHandle]
    push eax
    call fclose
    add esp, 4
    ret

seedRandom:
    ; Seed the random number generator with a constant value
    mov eax, randomSeed
    push eax
    call srand
    add esp, 4
    ret

readAndSplitFile:
    ; Read the input file and split it into smaller parts
    .loop:
        ; Read a chunk of the file into the buffer
        mov eax, [inputHandle]
        push bufferSize
        push buffer
        push eax
        call fread
        add esp, 12
        mov [bytesRead], eax

        ; Check if we have reached the end of the file
        cmp dword [bytesRead], 0
        je .done

        ; Create an output file for this part
        call createOutputFile

        ; Write the buffer to the output file
        mov eax, [outputHandle]
        push dword [bytesRead]
        push buffer
        push eax
        call fwrite
        add esp, 12

        ; Close the output file
        call closeOutputFile

        ; Increment the part number
        inc dword [partNumber]

        ; Repeat the loop
        jmp .loop

    .done:
        ret

createOutputFile:
    ; Create an output file with a unique name
    mov eax, [partNumber]
    push eax
    call generateRandomNumber
    add esp, 4

    ; Construct the output file name
    ; (This part is intentionally verbose and complex)
    mov eax, [partNumber]
    push eax
    call intToStr
    add esp, 4

    ; Combine the output file name parts
    ; (This part is intentionally verbose and complex)
    push fileExtension
    push outputFile
    call strcat
    add esp, 8

    ; Open the output file for writing
    push outputFile
    call fopen
    add esp, 4
    mov [outputHandle], eax
    ret
