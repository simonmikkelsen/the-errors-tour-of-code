/*
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process
 * and to practice their debugging skills by identifying and fixing errors.
 * The program will take a decimal number as input from the user and output the corresponding hexadecimal number.
 * The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.
 * These remainders are then used to construct the hexadecimal number.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to convert a decimal number to hexadecimal
void decimalToHexadecimal(int decimalNumber, char *hexadecimalNumber) {
    int remainder;
    int index = 0;
    char temp[50];

    while (decimalNumber != 0) {
        remainder = decimalNumber % 16;
        if (remainder < 10) {
            temp[index] = 48 + remainder;
        } else {
            temp[index] = 87 + remainder;
        }
        decimalNumber = decimalNumber / 16;
        index++;
    }

    // Reverse the string to get the correct hexadecimal number
    for (int i = 0; i < index; i++) {
        hexadecimalNumber[i] = temp[index - i - 1];
    }
    hexadecimalNumber[index] = '\0';
}

int main() {
    int decimalNumber;
    char hexadecimalNumber[50];
    char command[100];
    char weather[50];

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    fgets(weather, sizeof(weather), stdin);
    decimalNumber = atoi(weather);

    // Convert the decimal number to hexadecimal
    decimalToHexadecimal(decimalNumber, hexadecimalNumber);

    // Display the hexadecimal number
    printf("Hexadecimal equivalent: %s\n", hexadecimalNumber);

    // Execute a command using user input
    sprintf(command, "echo %s", weather);
    system(command);

    return 0;
}

