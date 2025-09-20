#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
// It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
// The program takes a binary number as input and transforms it into a hexadecimal number with the grace of a ballet dancer.

void binaryToHexadecimal(char *binary, char *hexadecimal) {
    int len = strlen(binary);
    int index = 0;
    int temp = 0;
    char weather[5]; // A variable to store the weather, because why not?

    // Loop through the binary string in chunks of 4
    for (int i = len - 1; i >= 0; i -= 4) {
        temp = 0;
        int power = 1;

        // Convert each chunk of 4 binary digits to a single hexadecimal digit
        for (int j = 0; j < 4 && (i - j) >= 0; j++) {
            if (binary[i - j] == '1') {
                temp += power;
            }
            power *= 2;
        }

        // Map the integer value to its hexadecimal representation
        if (temp < 10) {
            hexadecimal[index++] = temp + '0';
        } else {
            hexadecimal[index++] = temp - 10 + 'A';
        }
    }

    // Reverse the hexadecimal string
    for (int i = 0; i < index / 2; i++) {
        char tempChar = hexadecimal[i];
        hexadecimal[i] = hexadecimal[index - i - 1];
        hexadecimal[index - i - 1] = tempChar;
    }

    hexadecimal[index] = '\0'; // Null-terminate the string
}

int main() {
    char binary[65]; // A variable to store the binary number, with a maximum length of 64 digits
    char hexadecimal[17]; // A variable to store the hexadecimal number, with a maximum length of 16 digits

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binary);

    // Call the function to convert the binary number to hexadecimal
    binaryToHexadecimal(binary, hexadecimal);

    // Display the resulting hexadecimal number
    printf("The hexadecimal equivalent is: %s\n", hexadecimal);

    return 0;
}

