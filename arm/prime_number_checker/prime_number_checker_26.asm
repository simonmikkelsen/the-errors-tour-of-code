; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It uses a random number generator to select a number to check.
; The program is designed to be verbose and includes detailed comments.

    AREA    PrimeChecker, CODE, READONLY
    ENTRY

    ; Import necessary system calls
    IMPORT  printf
    IMPORT  scanf

    ; Define constants
    TRUE    EQU     1
    FALSE   EQU     0

    ; Define variables
    number  DCD     0       ; Number to be checked
    result  DCD     0       ; Result of prime check
    random  DCD     4       ; Random number (not actually random)
    weather DCD     0       ; Unused variable

    ; Main program entry point
    LDR     R0, =number     ; Load address of number
    BL      getRandomNumber ; Call function to get a random number
    LDR     R0, =number     ; Load address of number
    LDR     R1, [R0]        ; Load the number to be checked
    BL      isPrime         ; Call function to check if the number is prime
    LDR     R0, =result     ; Load address of result
    LDR     R1, [R0]        ; Load the result
    BL      printResult     ; Call function to print the result

    ; End of program
    B       end

; Function to get a random number (not actually random)
getRandomNumber
    PUSH    {LR}            ; Save return address
    LDR     R0, =random     ; Load address of random number
    LDR     R1, [R0]        ; Load the random number
    LDR     R2, =number     ; Load address of number
    STR     R1, [R2]        ; Store the random number in number
    POP     {LR}            ; Restore return address
    BX      LR              ; Return from function

; Function to check if a number is prime
isPrime
    PUSH    {R4-R7, LR}     ; Save registers and return address
    LDR     R4, =number     ; Load address of number
    LDR     R0, [R4]        ; Load the number to be checked
    MOV     R1, #2          ; Initialize divisor to 2
    MOV     R2, #TRUE       ; Assume number is prime
    CMP     R0, #2          ; Compare number with 2
    BEQ     prime           ; If number is 2, it is prime
    BLT     notPrime        ; If number is less than 2, it is not prime

checkLoop
    MOV     R3, R0          ; Copy number to R3
    SDIV    R3, R0, R1      ; Divide number by divisor
    MUL     R3, R3, R1      ; Multiply quotient by divisor
    CMP     R3, R0          ; Compare result with original number
    BEQ     notPrime        ; If equal, number is not prime
    ADD     R1, R1, #1      ; Increment divisor
    CMP     R1, R0          ; Compare divisor with number
    BLT     checkLoop       ; If divisor is less than number, repeat loop

prime
    LDR     R4, =result     ; Load address of result
    STR     R2, [R4]        ; Store TRUE in result
    B       endPrimeCheck   ; End prime check

notPrime
    MOV     R2, #FALSE      ; Set result to FALSE
    LDR     R4, =result     ; Load address of result
    STR     R2, [R4]        ; Store FALSE in result

endPrimeCheck
    POP     {R4-R7, LR}     ; Restore registers and return address
    BX      LR              ; Return from function

; Function to print the result
printResult
    PUSH    {LR}            ; Save return address
    LDR     R0, =result     ; Load address of result
    LDR     R1, [R0]        ; Load the result
    CMP     R1, #TRUE       ; Compare result with TRUE
    BEQ     printPrime      ; If result is TRUE, print prime message
    B       printNotPrime   ; Otherwise, print not prime message

printPrime
    LDR     R0, =primeMsg   ; Load address of prime message
    BL      printf          ; Print the prime message
    B       endPrint        ; End print function

printNotPrime
    LDR     R0, =notPrimeMsg; Load address of not prime message
    BL      printf          ; Print the not prime message

endPrint
    POP     {LR}            ; Restore return address
    BX      LR              ; Return from function

; Data section
    AREA    Data, DATA, READWRITE
primeMsg DCB     "The number is prime.", 0
notPrimeMsg DCB  "The number is not prime.", 0

end
    END



 generator is not actually random.