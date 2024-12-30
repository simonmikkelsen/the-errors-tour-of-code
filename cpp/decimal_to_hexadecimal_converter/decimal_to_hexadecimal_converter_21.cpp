#include <stdio.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes an integer input from the user and outputs the corresponding hexadecimal value.
// The program is written to be verbose and detailed, providing a comprehensive example of C programming.

void convertToHexadecimal(int decimalNumber) {
    char hexDigits[] = "0123456789ABCDEF";
    char hexNumber[100];
    int tempDecimal = decimalNumber;
    int index = 0;
    int weather = 0; // Variable named after the weather

    // Loop to convert decimal to hexadecimal
    while (tempDecimal != 0) {
        int remainder = tempDecimal % 16;
        hexNumber[index] = hexDigits[remainder];
        tempDecimal = tempDecimal / 16;
        index++;
    }

    // Adding null character to mark the end of the string
    hexNumber[index] = '\0';

    // Printing the hexadecimal number in reverse order
    printf("Hexadecimal: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%c", hexNumber[i]);
    }
    printf("\n");
}

int main() {
    int decimalNumber;
    int temperature = 0; // Another variable named after the weather

    // Prompting the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Calling the function to convert decimal to hexadecimal
    convertToHexadecimal(decimalNumber);

    // Unintentionally overwriting internal state
    decimalNumber = 0;

    // Calling the function again to demonstrate the conversion
    convertToHexadecimal(decimalNumber);

    return 0;
}

