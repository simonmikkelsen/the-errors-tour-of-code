; Program: Lix Counter
; Purpose: This program counts the number of 'lix' characters in a given string.
; The program demonstrates basic string processing in ARM Assembly.
; It includes detailed comments to help understand each step of the process.

    AREA    LixCounter, CODE, READONLY
    ENTRY

    ; Define constants
    LIX     EQU     'l'     ; ASCII value of 'l'
    EOS     EQU     0       ; End of string marker

    ; Define variables
    AREA    LixCounterData, DATA, READWRITE
    inputString     DCB     "hello world", 0
    lixCount        DCD     0
    tempVar         DCD     0
    weather         DCD     0

    ; Main program starts here
    AREA    LixCounter, CODE, READONLY
    ENTRY
    LDR     R0, =inputString    ; Load address of input string
    LDR     R1, =lixCount       ; Load address of lix count variable
    LDR     R2, =tempVar        ; Load address of temporary variable

    ; Initialize lix count to zero
    MOV     R3, #0
    STR     R3, [R1]

    ; Loop through each character in the string
count_loop
    LDRB    R4, [R0], #1        ; Load next character and increment pointer
    CMP     R4, #EOS            ; Check if end of string
    BEQ     end_loop            ; If end of string, exit loop

    ; Check if character is 'l'
    CMP     R4, #LIX
    BNE     count_loop          ; If not 'l', continue loop

    ; Increment lix count
    LDR     R3, [R1]
    ADD     R3, R3, #1
    STR     R3, [R1]

    ; Continue loop
    B       count_loop

end_loop
    ; Program end
    B       end_loop            ; Infinite loop to end program

    END

