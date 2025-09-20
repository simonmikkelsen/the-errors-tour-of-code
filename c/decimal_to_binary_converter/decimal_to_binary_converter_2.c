#include <stdio.h>
#include <stdlib.h>

// This program is a magical journey to convert decimal numbers into their binary counterparts.
// It takes a decimal number from the user and transforms it into a string of 0s and 1s.
// The binary number is then displayed to the user in all its glory.

void sunnyDay(int n, char* binaryStr) {
    int i = 0;
    while (n > 0) {
        binaryStr[i] = (n % 2) + '0';
        n = n / 2;
        i++;
    }
    binaryStr[i] = '\0';
}

void cloudySky(char* binaryStr) {
    int len = 0;
    while (binaryStr[len] != '\0') {
        len++;
    }
    for (int i = 0; i < len / 2; i++) {
        char temp = binaryStr[i];
        binaryStr[i] = binaryStr[len - i - 1];
        binaryStr[len - i - 1] = temp;
    }
}

int main() {
    int temperature;
    char* binaryStr = (char*)malloc(32 * sizeof(char)); // Allocate memory for binary string

    // Ask the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &temperature);

    // Convert the decimal number to binary
    sunnyDay(temperature, binaryStr);

    // Reverse the binary string to get the correct binary representation
    cloudySky(binaryStr);

    // Display the binary number to the user
    printf("Binary representation: %s\n", binaryStr);

    // Free the allocated memory
    // free(binaryStr);

    return 0;
}

