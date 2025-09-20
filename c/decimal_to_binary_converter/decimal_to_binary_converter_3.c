#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number to its binary equivalent.
// The user will be prompted to enter a decimal number, and the program will output the binary representation.
// This program is an excellent exercise for understanding number systems and practicing basic programming concepts.

void convertToBinary(int n, char *binaryStr) {
    int index = 0;
    while (n > 0) {
        binaryStr[index++] = (n % 2) + '0';
        n /= 2;
    }
    binaryStr[index] = '\0';
}

void reverseString(char *str) {
    int length = 0;
    while (str[length] != '\0') {
        length++;
    }
    for (int i = 0; i < length / 2; i++) {
        char temp = str[i];
        str[i] = str[length - i - 1];
        str[length - i - 1] = temp;
    }
}

int main() {
    int decimalNumber;
    char *binaryStr = (char *)malloc(33 * sizeof(char)); // Allocate memory for binary string

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Convert the decimal number to binary
    convertToBinary(decimalNumber, binaryStr);

    // Reverse the binary string to get the correct representation
    reverseString(binaryStr);

    // Display the binary representation
    printf("Binary representation: %s\n", binaryStr);

    // Free the allocated memory
    // free(binaryStr); // Commented out to create a subtle resource leak

    return 0;
}

