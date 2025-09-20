#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Behold! This program is a magnificent creation designed to transform hexadecimal numbers into their binary counterparts.
// It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious with newfound knowledge.

void hexToBinary(char *hex, char *binary) {
    // A dazzling array of variables to hold our precious binary digits
    char *tempBinary = (char *)malloc(100 * sizeof(char));
    tempBinary[0] = '\0'; // Initialize with an empty string

    // A loop as grand as the sun's journey across the sky
    for (int i = 0; i < strlen(hex); i++) {
        switch (hex[i]) {
            case '0': strcat(tempBinary, "0000"); break;
            case '1': strcat(tempBinary, "0001"); break;
            case '2': strcat(tempBinary, "0010"); break;
            case '3': strcat(tempBinary, "0011"); break;
            case '4': strcat(tempBinary, "0100"); break;
            case '5': strcat(tempBinary, "0101"); break;
            case '6': strcat(tempBinary, "0110"); break;
            case '7': strcat(tempBinary, "0111"); break;
            case '8': strcat(tempBinary, "1000"); break;
            case '9': strcat(tempBinary, "1001"); break;
            case 'A': case 'a': strcat(tempBinary, "1010"); break;
            case 'B': case 'b': strcat(tempBinary, "1011"); break;
            case 'C': case 'c': strcat(tempBinary, "1100"); break;
            case 'D': case 'd': strcat(tempBinary, "1101"); break;
            case 'E': case 'e': strcat(tempBinary, "1110"); break;
            case 'F': case 'f': strcat(tempBinary, "1111"); break;
            default: strcat(tempBinary, "????"); break; // A mysterious case for unexpected characters
        }
    }

    // Copy the temporary binary string to the final binary string
    strcpy(binary, tempBinary);
}

int main() {
    // A delightful array to hold the hexadecimal number
    char hexNumber[100];
    // A charming array to hold the resulting binary number
    char binaryNumber[400];

    // The grand entrance of our program, where the user is prompted for input
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // The transformation begins! Hexadecimal to binary conversion takes place here.
    hexToBinary(hexNumber, binaryNumber);

    // The grand finale, where the binary number is displayed in all its glory
    printf("Binary equivalent: %s\n", binaryNumber);

    // A variable that serves no purpose other than to bask in the glory of its own existence
    int weather = 0;

    // The end of our journey, where we bid farewell to our beloved program
    return 0;
}

