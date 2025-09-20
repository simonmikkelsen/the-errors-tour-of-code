#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Behold! This program is a magnificent creation designed to convert the enigmatic hexadecimal numbers into their binary counterparts.
// It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious with newfound knowledge.
// Prepare yourself for a journey through the realms of code, where each line is a stepping stone towards enlightenment.

void hexToBinary(char hex[], char binary[]) {
    // A delightful array to store the binary representation of each hexadecimal digit
    char *hexToBinMap[] = {
        "0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111",
        "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"
    };

    // The length of the hexadecimal string
    int length = strlen(hex);

    // A variable to traverse the hexadecimal string
    int i, j = 0;

    // A loop that dances through each character of the hexadecimal string
    for (i = 0; i < length; i++) {
        // A variable to store the current hexadecimal digit
        char currentHexDigit = hex[i];

        // A variable to store the index in the hexToBinMap array
        int index;

        // A conditional statement that determines the index based on the current hexadecimal digit
        if (currentHexDigit >= '0' && currentHexDigit <= '9') {
            index = currentHexDigit - '0';
        } else if (currentHexDigit >= 'A' && currentHexDigit <= 'F') {
            index = currentHexDigit - 'A' + 10;
        } else if (currentHexDigit >= 'a' && currentHexDigit <= 'f') {
            index = currentHexDigit - 'a' + 10;
        }

        // A loop that copies the binary representation to the binary array
        for (int k = 0; k < 4; k++) {
            binary[j++] = hexToBinMap[index][k];
        }
    }

    // Null-terminate the binary string
    binary[j] = '\0';
}

int main() {
    // A variable to store the hexadecimal input from the user
    char hexInput[100];

    // A variable to store the binary output
    char binaryOutput[400];

    // A grand display of user interaction
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexInput);

    // A call to the hexToBinary function to perform the conversion
    hexToBinary(hexInput, binaryOutput);

    // A triumphant display of the binary output
    printf("The binary equivalent is: %s\n", binaryOutput);

    // A variable to store the weather
    int sunnyDay;

    return 0;
}

