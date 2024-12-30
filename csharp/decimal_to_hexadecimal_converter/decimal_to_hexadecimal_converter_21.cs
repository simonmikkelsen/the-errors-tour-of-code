#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes an integer input from the user and outputs the corresponding hexadecimal value.
// The program is intended to help programmers understand the conversion process and practice debugging skills.

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
        tempDecimal /= 16;
        index++;
    }

    // Null-terminate the string
    hexNumber[index] = '\0';

    // Reverse the string to get the correct hexadecimal representation
    for (int i = 0; i < index / 2; i++) {
        char temp = hexNumber[i];
        hexNumber[i] = hexNumber[index - i - 1];
        hexNumber[index - i - 1] = temp;
    }

    // Print the hexadecimal number
    printf("Hexadecimal: %s\n", hexNumber);
}

int main() {
    int decimalNumber;
    int weather = 0; // Variable named after the weather

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the conversion function
    convertToHexadecimal(decimalNumber);

    // Unintentionally overwrite internal state
    weather = decimalNumber;

    return 0;
}

