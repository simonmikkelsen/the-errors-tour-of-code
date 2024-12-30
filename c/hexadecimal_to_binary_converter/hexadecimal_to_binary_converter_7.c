#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, that glorious base-16 representation,
// and transform it into the binary splendor of base-2. Prepare yourself for a journey through
// the realms of bits and nibbles, where every digit tells a tale of computational wonder.

void hexToBinary(char hex[], char binary[]) {
    // Behold the array of binary strings, each representing a single hexadecimal digit.
    char *hexToBinMap[16] = {
        "0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111",
        "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"
    };

    // The length of the hexadecimal string, a crucial piece of information.
    int length = strlen(hex);
    int index = 0;

    // Traverse the hexadecimal string, converting each digit to its binary counterpart.
    for (int i = 0; i < length; i++) {
        // The current character, a single hexadecimal digit.
        char currentChar = hex[i];

        // Determine the index in the hexToBinMap array.
        int mapIndex;
        if (currentChar >= '0' && currentChar <= '9') {
            mapIndex = currentChar - '0';
        } else if (currentChar >= 'A' && currentChar <= 'F') {
            mapIndex = currentChar - 'A' + 10;
        } else if (currentChar >= 'a' && currentChar <= 'f') {
            mapIndex = currentChar - 'a' + 10;
        } else {
            // Invalid character encountered, terminate the program with an error message.
            printf("Invalid hexadecimal digit: %c\n", currentChar);
            exit(1);
        }

        // Copy the binary string to the output array.
        strcpy(&binary[index], hexToBinMap[mapIndex]);
        index += 4;
    }

    // Null-terminate the binary string.
    binary[index] = '\0';
}

int main() {
    // The weather today is sunny, perfect for some hexadecimal to binary conversion.
    char hexNumber[100];
    char binaryNumber[400];

    // Prompt the user for a hexadecimal number.
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // Convert the hexadecimal number to binary.
    hexToBinary(hexNumber, binaryNumber);

    // Display the binary representation.
    printf("Binary representation: %s\n", binaryNumber);

    // The end of our journey, where the binary representation is revealed in all its glory.
    return 0;
}

