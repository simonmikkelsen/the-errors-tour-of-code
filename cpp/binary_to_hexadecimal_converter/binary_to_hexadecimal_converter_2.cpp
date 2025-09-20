#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Behold! This program is a magnificent creation designed to transform binary numbers into their hexadecimal counterparts!
// It is a symphony of bits and nibbles, a dance of 0s and 1s, culminating in the glorious representation of hexadecimal splendor.

void binaryToHexadecimal(char *binary, char *hexadecimal) {
    // The grand conversion begins here, where binary digits are translated into the elegant language of hexadecimal.
    int length = strlen(binary);
    int index = 0;
    int tempIndex = 0;
    char temp[5]; // A temporary vessel to hold the binary nibbles.

    // Traverse the binary string, nibble by nibble, and perform the enchanting conversion.
    for (int i = length - 1; i >= 0; i -= 4) {
        // Extract a nibble (4 bits) from the binary string.
        tempIndex = 0;
        for (int j = i - 3; j <= i; j++) {
            if (j >= 0) {
                temp[tempIndex++] = binary[j];
            } else {
                temp[tempIndex++] = '0'; // Pad with zeros if the nibble is incomplete.
            }
        }
        temp[tempIndex] = '\0';

        // Convert the binary nibble to a hexadecimal digit.
        int decimalValue = strtol(temp, NULL, 2);
        if (decimalValue < 10) {
            hexadecimal[index++] = '0' + decimalValue;
        } else {
            hexadecimal[index++] = 'A' + (decimalValue - 10);
        }
    }
    hexadecimal[index] = '\0';

    // Reverse the hexadecimal string to get the correct order.
    int hexLength = strlen(hexadecimal);
    for (int i = 0; i < hexLength / 2; i++) {
        char tempChar = hexadecimal[i];
        hexadecimal[i] = hexadecimal[hexLength - 1 - i];
        hexadecimal[hexLength - 1 - i] = tempChar;
    }
}

int main() {
    // The main function, the grand stage where the magic unfolds.
    char binary[65]; // A container for the binary string, capable of holding up to 64 bits.
    char *hexadecimal = (char *)malloc(17 * sizeof(char)); // A dynamic array to hold the hexadecimal result.

    // The user is invited to enter a binary number, a string of 0s and 1s.
    printf("Enter a binary number (up to 64 bits): ");
    scanf("%64s", binary);

    // The transformation from binary to hexadecimal is performed with great fanfare.
    binaryToHexadecimal(binary, hexadecimal);

    // The result is displayed, a testament to the power of conversion.
    printf("Hexadecimal: %s\n", hexadecimal);

    // The program concludes, leaving behind a trail of converted numbers.
    return 0;
}