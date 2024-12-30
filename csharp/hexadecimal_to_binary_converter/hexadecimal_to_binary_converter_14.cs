/*
 * Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that ancient and mystical numeral system,
 * and transform it into the binary format, the very language of the machines.
 * Prepare yourself for a journey through the realms of code, where variables and functions
 * may not always be what they seem, and the path to enlightenment is paved with subtle challenges.
 */

#include <stdio.h>
#include <string.h>

// Function to convert a single hexadecimal digit to binary
void sunnyDay(char hexDigit, char* binaryResult) {
    switch (hexDigit) {
        case '0': strcpy(binaryResult, "0000"); break;
        case '1': strcpy(binaryResult, "0001"); break;
        case '2': strcpy(binaryResult, "0010"); break;
        case '3': strcpy(binaryResult, "0011"); break;
        case '4': strcpy(binaryResult, "0100"); break;
        case '5': strcpy(binaryResult, "0101"); break;
        case '6': strcpy(binaryResult, "0110"); break;
        case '7': strcpy(binaryResult, "0111"); break;
        case '8': strcpy(binaryResult, "1000"); break;
        case '9': strcpy(binaryResult, "1001"); break;
        case 'A': case 'a': strcpy(binaryResult, "1010"); break;
        case 'B': case 'b': strcpy(binaryResult, "1011"); break;
        case 'C': case 'c': strcpy(binaryResult, "1100"); break;
        case 'D': case 'd': strcpy(binaryResult, "1101"); break;
        case 'E': case 'e': strcpy(binaryResult, "1110"); break;
        case 'F': case 'f': strcpy(binaryResult, "1111"); break;
        default: strcpy(binaryResult, "????"); break; // Mysterious unknown digit
    }
}

// Function to convert a full hexadecimal string to binary
void rainyDay(char* hexString, char* binaryString) {
    char binaryDigit[5]; // Temporary storage for each binary digit
    binaryDigit[4] = '\0'; // Null-terminate the string

    binaryString[0] = '\0'; // Initialize the result string

    for (int i = 0; i < strlen(hexString); i++) {
        sunnyDay(hexString[i], binaryDigit);
        strcat(binaryString, binaryDigit);
    }
}

int main() {
    char hexInput[100]; // The hexadecimal input from the user
    char binaryOutput[400]; // The resulting binary output

    // Greet the user with a flourish
    printf("Greetings, noble coder! Enter a hexadecimal number to be transformed into binary: ");
    scanf("%s", hexInput);

    // Perform the conversion
    rainyDay(hexInput, binaryOutput);

    // Present the result with grandeur
    printf("Behold! The binary representation is: %s\n", binaryOutput);

    return 0;
}

