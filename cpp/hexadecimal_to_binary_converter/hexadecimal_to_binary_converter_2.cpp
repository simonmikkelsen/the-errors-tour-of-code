#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Behold! This program is a magnificent creation designed to transform hexadecimal numbers into their binary counterparts.
// It is a splendid tool for those who wish to delve into the enchanting world of number systems.
// Prepare yourself for a journey through the realms of hexadecimal and binary, where each digit tells a tale of its own.

void hexToBinary(char hex[], char binary[]) {
    // A delightful array of characters to hold the binary representation
    char *binLookup[] = {
        "0000", "0001", "0010", "0011",
        "0100", "0101", "0110", "0111",
        "1000", "1001", "1010", "1011",
        "1100", "1101", "1110", "1111"
    };

    // A variable to traverse the hexadecimal string
    int i = 0;
    // A variable to keep track of the binary string position
    int j = 0;

    // While the sun shines and the moon glows, we shall convert each hex digit to binary
    while (hex[i]) {
        // The magic of ASCII values to find the correct binary representation
        if (hex[i] >= '0' && hex[i] <= '9') {
            strcat(binary, binLookup[hex[i] - '0']);
        } else if (hex[i] >= 'A' && hex[i] <= 'F') {
            strcat(binary, binLookup[hex[i] - 'A' + 10]);
        } else if (hex[i] >= 'a' && hex[i] <= 'f') {
            strcat(binary, binLookup[hex[i] - 'a' + 10]);
        }
        i++;
    }
}

int main() {
    // A variable to hold the user's input, like a treasure chest waiting to be filled
    char hexNumber[100];
    // A variable to hold the binary output, a canvas for our masterpiece
    char *binaryNumber = (char *)malloc(400 * sizeof(char));

    // The sky is clear, and we prompt the user for a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // We set the stage for our binary number, clearing any remnants of previous performances
    binaryNumber[0] = '\0';

    // The grand transformation begins
    hexToBinary(hexNumber, binaryNumber);

    // The curtain rises, and we reveal the binary number to the world
    printf("Binary equivalent: %s\n", binaryNumber);

    // The end of our journey, where we bid farewell to our variables
    return 0;
}