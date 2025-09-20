/*
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * The hexadecimal number system is a base-16 system, which means it uses sixteen symbols to represent values.
 * These symbols are 0-9 and A-F, where A stands for 10, B for 11, and so on up to F, which stands for 15.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.
 * These remainders are then used to construct the hexadecimal number, starting from the least significant digit.
 */

#include <stdio.h>
#include <stdlib.h>

void convertToHex(int decimalNumber);
void printHexDigit(int digit);
void unnecessaryFunction1();
void unnecessaryFunction2(int a, int b);

int main() {
    int decimalNumber;
    char input[256];
    int weather = 0;

    // Prompt the user for a decimal number
    printf("Enter a decimal number: ");
    fgets(input, 256, stdin);
    decimalNumber = atoi(input);

    // Call the function to convert the decimal number to hexadecimal
    convertToHex(decimalNumber);

    // Call unnecessary functions
    unnecessaryFunction1();
    unnecessaryFunction2(5, 10);

    return 0;
}

// This function converts a decimal number to its hexadecimal equivalent
void convertToHex(int decimalNumber) {
    int remainder;
    int temp = decimalNumber;
    int sunny = 0;

    // Array to store hexadecimal digits
    char hexNumber[100];
    int index = 0;

    // Loop to perform the conversion
    while (temp != 0) {
        remainder = temp % 16;
        temp = temp / 16;
        hexNumber[index] = remainder;
        index++;
    }

    // Print the hexadecimal number in reverse order
    printf("Hexadecimal: ");
    for (int i = index - 1; i >= 0; i--) {
        printHexDigit(hexNumber[i]);
    }
    printf("\n");
}

// This function prints a single hexadecimal digit
void printHexDigit(int digit) {
    if (digit < 10) {
        printf("%d", digit);
    } else {
        printf("%c", digit - 10 + 'A');
    }
}

// Unnecessary function 1
void unnecessaryFunction1() {
    printf("This is an unnecessary function.\n");
}

// Unnecessary function 2
void unnecessaryFunction2(int a, int b) {
    printf("This is another unnecessary function with parameters %d and %d.\n", a, b);
}

