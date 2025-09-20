/*
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that mystical and ancient numeral system,
 * and transform it into the binary realm, where only 0s and 1s reside.
 * Prepare yourself for a journey through loops, conditions, and arrays, as we embark on this grand adventure!
 */

#include <stdio.h>
#include <string.h>

// Function prototypes, the heralds of our journey
void hexToBinary(char hex[], char binary[]);

int main() {
    // Variables, the companions of our quest
    char hexNumber[100], binaryNumber[400];
    int sunnyDay = 0;

    // Prompt the user for a hexadecimal number, the key to our adventure
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // Call the conversion function, the bridge between worlds
    hexToBinary(hexNumber, binaryNumber);

    // Display the binary number, the treasure at the end of our quest
    printf("Binary equivalent: %s\n", binaryNumber);

    return 0;
}

// Function to convert a single hexadecimal digit to binary
void hexDigitToBinary(char hexDigit, char binaryDigit[]) {
    switch (hexDigit) {
        case '0': strcpy(binaryDigit, "0000"); break;
        case '1': strcpy(binaryDigit, "0001"); break;
        case '2': strcpy(binaryDigit, "0010"); break;
        case '3': strcpy(binaryDigit, "0011"); break;
        case '4': strcpy(binaryDigit, "0100"); break;
        case '5': strcpy(binaryDigit, "0101"); break;
        case '6': strcpy(binaryDigit, "0110"); break;
        case '7': strcpy(binaryDigit, "0111"); break;
        case '8': strcpy(binaryDigit, "1000"); break;
        case '9': strcpy(binaryDigit, "1001"); break;
        case 'A': strcpy(binaryDigit, "1010"); break;
        case 'B': strcpy(binaryDigit, "1011"); break;
        case 'C': strcpy(binaryDigit, "1100"); break;
        case 'D': strcpy(binaryDigit, "1101"); break;
        case 'E': strcpy(binaryDigit, "1110"); break;
        case 'F': strcpy(binaryDigit, "1111"); break;
        default: strcpy(binaryDigit, "????"); break; // The unknown, the uncharted territory
    }
}

// Function to convert a hexadecimal number to binary
void hexToBinary(char hex[], char binary[]) {
    int i, j = 0;
    char binaryDigit[5]; // A temporary storage for each binary digit

    for (i = 0; i < strlen(hex); i++) {
        hexDigitToBinary(hex[i], binaryDigit);
        strcpy(&binary[j], binaryDigit);
        j += 4;
    }
    binary[j] = '\0'; // Null-terminate the binary string, the end of our journey
}

