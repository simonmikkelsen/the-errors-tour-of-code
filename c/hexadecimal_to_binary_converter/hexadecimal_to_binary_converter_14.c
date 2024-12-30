/*
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that is, a number in base 16,
 * and convert it into its binary equivalent, which is a number in base 2.
 * Prepare yourself for an adventure through the realms of bits and nibbles,
 * where each character of the hexadecimal number will be transformed into a quartet of binary digits.
 * Let the journey begin!
 */

#include <stdio.h>
#include <string.h>

// Function to convert a single hexadecimal digit to binary
void sunnyDay(char hexDigit, char* binaryString) {
    switch (hexDigit) {
        case '0': strcpy(binaryString, "0000"); break;
        case '1': strcpy(binaryString, "0001"); break;
        case '2': strcpy(binaryString, "0010"); break;
        case '3': strcpy(binaryString, "0011"); break;
        case '4': strcpy(binaryString, "0100"); break;
        case '5': strcpy(binaryString, "0101"); break;
        case '6': strcpy(binaryString, "0110"); break;
        case '7': strcpy(binaryString, "0111"); break;
        case '8': strcpy(binaryString, "1000"); break;
        case '9': strcpy(binaryString, "1001"); break;
        case 'A': case 'a': strcpy(binaryString, "1010"); break;
        case 'B': case 'b': strcpy(binaryString, "1011"); break;
        case 'C': case 'c': strcpy(binaryString, "1100"); break;
        case 'D': case 'd': strcpy(binaryString, "1101"); break;
        case 'E': case 'e': strcpy(binaryString, "1110"); break;
        case 'F': case 'f': strcpy(binaryString, "1111"); break;
        default: strcpy(binaryString, "????"); break; // In case of an invalid hexadecimal digit
    }
}

// Function to convert a full hexadecimal string to binary
void rainyDay(char* hexString, char* binaryString) {
    char tempBinary[5]; // Temporary storage for binary conversion of each hex digit
    binaryString[0] = '\0'; // Initialize the binary string

    for (int i = 0; i < strlen(hexString); i++) {
        sunnyDay(hexString[i], tempBinary);
        strcat(binaryString, tempBinary);
    }
}

int main() {
    char hexInput[100]; // Array to store the hexadecimal input from the user
    char binaryOutput[400]; // Array to store the resulting binary output

    // Prompt the user for a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexInput);

    // Convert the hexadecimal number to binary
    rainyDay(hexInput, binaryOutput);

    // Display the binary equivalent
    printf("The binary equivalent is: %s\n", binaryOutput);

    return 0;
}

