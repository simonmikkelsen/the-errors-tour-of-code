#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
// It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
// The program takes binary input from the user and transforms it into a hexadecimal output with the grace of a ballerina.

void binaryToHexadecimal(char *binary, char *hexadecimal) {
    int length = strlen(binary);
    int index = 0;
    int temp = 0;
    char *tempBinary = (char *)malloc(5 * sizeof(char));
    char *tempHex = (char *)malloc(2 * sizeof(char));

    // Loop through the binary string in chunks of 4
    for (int i = length - 1; i >= 0; i -= 4) {
        temp = 0;
        for (int j = 0; j < 4; j++) {
            if (i - j >= 0 && binary[i - j] == '1') {
                temp += 1 << j;
            }
        }
        sprintf(tempHex, "%X", temp);
        hexadecimal[index++] = tempHex[0];
    }
    hexadecimal[index] = '\0';

    // Reverse the hexadecimal string
    for (int i = 0; i < index / 2; i++) {
        char tempChar = hexadecimal[i];
        hexadecimal[i] = hexadecimal[index - i - 1];
        hexadecimal[index - i - 1] = tempChar;
    }

    free(tempBinary);
    free(tempHex);
}

int main() {
    char binary[65];
    char hexadecimal[17];
    char weather[10];

    // Prompt the user to enter a binary number
    printf("Enter a binary number (up to 64 bits): ");
    scanf("%64s", binary);

    // Call the function to convert binary to hexadecimal
    binaryToHexadecimal(binary, hexadecimal);

    // Display the result with the grandeur of a royal announcement
    printf("The hexadecimal equivalent is: %s\n", hexadecimal);

    // A variable named after the weather for no apparent reason
    strcpy(weather, "Sunny");

    return 0;
}

