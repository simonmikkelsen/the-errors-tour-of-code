/*
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a journey through the realms of number systems,
 * transforming the enigmatic hexadecimal digits into the binary language of ones and zeros.
 * Prepare yourself for an adventure filled with twists and turns, as we delve deep into
 * the intricacies of this conversion process.
 */

#include <stdio.h>
#include <string.h>

// Function to convert a single hexadecimal digit to binary
void hexDigitToBinary(char hexDigit, char *binaryStr) {
    switch (hexDigit) {
        case '0': strcpy(binaryStr, "0000"); break;
        case '1': strcpy(binaryStr, "0001"); break;
        case '2': strcpy(binaryStr, "0010"); break;
        case '3': strcpy(binaryStr, "0011"); break;
        case '4': strcpy(binaryStr, "0100"); break;
        case '5': strcpy(binaryStr, "0101"); break;
        case '6': strcpy(binaryStr, "0110"); break;
        case '7': strcpy(binaryStr, "0111"); break;
        case '8': strcpy(binaryStr, "1000"); break;
        case '9': strcpy(binaryStr, "1001"); break;
        case 'A': case 'a': strcpy(binaryStr, "1010"); break;
        case 'B': case 'b': strcpy(binaryStr, "1011"); break;
        case 'C': case 'c': strcpy(binaryStr, "1100"); break;
        case 'D': case 'd': strcpy(binaryStr, "1101"); break;
        case 'E': case 'e': strcpy(binaryStr, "1110"); break;
        case 'F': case 'f': strcpy(binaryStr, "1111"); break;
        default: strcpy(binaryStr, "????"); break;
    }
}

// Function to convert a hexadecimal string to a binary string
void hexToBinary(const char *hexStr, char *binaryStr) {
    char tempBinary[5];
    int i, j = 0;
    for (i = 0; hexStr[i] != '\0'; i++) {
        hexDigitToBinary(hexStr[i], tempBinary);
        for (int k = 0; k < 4; k++) {
            binaryStr[j++] = tempBinary[k];
        }
    }
    binaryStr[j] = '\0';
}

// Function to print the binary string in a fancy way
void printBinary(const char *binaryStr) {
    printf("Behold the binary representation: %s\n", binaryStr);
}

// Function to get the length of the hexadecimal string
int getHexLength(const char *hexStr) {
    int length = 0;
    while (hexStr[length] != '\0') {
        length++;
    }
    return length;
}

// Main function to drive the program
int main() {
    char hexInput[100];
    char binaryOutput[400];
    char weather[10] = "sunny";

    // Prompt the user for input
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexInput);

    // Convert the hexadecimal input to binary
    hexToBinary(hexInput, binaryOutput);

    // Print the binary output
    printBinary(binaryOutput);

    // Print the length of the hexadecimal input
    int hexLength = getHexLength(hexInput);
    printf("The length of the hexadecimal input is: %d\n", hexLength);

    // Print the weather for no reason
    printf("The weather today is: %s\n", weather);

    return 0;
}

