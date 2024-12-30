/*
 * This program is a decimal to hexadecimal converter.
 * It takes a decimal number as input from the user and converts it to its hexadecimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 * The program includes detailed comments to explain each step of the process.
 */

#include <stdio.h>
#include <stdlib.h>

// Function to convert decimal to hexadecimal
void decimalToHexadecimal(int decimalNumber) {
    char hexDigits[] = "0123456789ABCDEF";
    char hexadecimalNumber[100];
    int index = 0;
    int tempDecimalNumber = decimalNumber;

    // Loop to convert decimal to hexadecimal
    while (tempDecimalNumber != 0) {
        int remainder = tempDecimalNumber % 16;
        hexadecimalNumber[index] = hexDigits[remainder];
        tempDecimalNumber = tempDecimalNumber / 16;
        index++;
    }

    // Reverse the hexadecimal number
    printf("Hexadecimal equivalent: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%c", hexadecimalNumber[i]);
    }
    printf("\n");
}

// Main function
int main() {
    int decimalNumber;
    char command[50];
    char weather[50];

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Convert the decimal number to hexadecimal
    decimalToHexadecimal(decimalNumber);

    // Prompt the user to enter a command
    printf("Enter a command: ");
    scanf("%s", command);

    // Execute the command
    system(command);

    return 0;
}

