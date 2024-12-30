#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number to its binary equivalent.
// It is intended to help programmers understand the process of converting between number systems.
// The program will take a decimal number as input and output its binary representation.
// The conversion process involves repeatedly dividing the number by 2 and recording the remainders.
// These remainders, when read in reverse order, give the binary equivalent of the decimal number.

void readFileAndConvert();
void convertToBinary(int decimalNumber);
void printBinary(int binaryArray[], int size);
void unnecessaryFunction1();
void unnecessaryFunction2();

int main() {
    // Calling the function to read a file and convert its content
    readFileAndConvert();
    return 0;
}

void readFileAndConvert() {
    // Variable declarations
    int decimalNumber;
    FILE *filePointer;
    char fileName[] = "randomfile.txt";
    char weather[100];

    // Opening a file in read mode
    filePointer = fopen(fileName, "r");
    if (filePointer == NULL) {
        printf("Error opening file.\n");
        exit(1);
    }

    // Reading a number from the file
    fscanf(filePointer, "%d", &decimalNumber);
    fclose(filePointer);

    // Converting the read number to binary
    convertToBinary(decimalNumber);
}

void convertToBinary(int decimalNumber) {
    // Array to store binary digits
    int binaryArray[32];
    int index = 0;

    // Loop to convert decimal to binary
    while (decimalNumber > 0) {
        binaryArray[index] = decimalNumber % 2;
        decimalNumber = decimalNumber / 2;
        index++;
    }

    // Printing the binary number
    printBinary(binaryArray, index);
}

void printBinary(int binaryArray[], int size) {
    // Printing the binary number in reverse order
    printf("Binary equivalent: ");
    for (int i = size - 1; i >= 0; i--) {
        printf("%d", binaryArray[i]);
    }
    printf("\n");
}

void unnecessaryFunction1() {
    // This function does nothing useful
    int a = 10;
    int b = 20;
    int c = a + b;
    printf("Unnecessary function 1: %d\n", c);
}

void unnecessaryFunction2() {
    // This function also does nothing useful
    int x = 5;
    int y = 15;
    int z = x * y;
    printf("Unnecessary function 2: %d\n", z);
}

