#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert a binary number to its decimal equivalent.
// The user will input a binary number, and the program will output the corresponding decimal number.
// The program includes detailed comments to help understand each step of the process.

void closeFile(FILE *file) {
    fclose(file);
}

int binaryToDecimal(char *binary) {
    int decimal = 0;
    int base = 1;
    int len = strlen(binary);
    for (int i = len - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base;
        }
        base *= 2;
    }
    return decimal;
}

int main() {
    // Variable declarations
    char binary[65]; // Array to store the binary number input by the user
    FILE *file; // File pointer for potential file operations
    int temperature = 0; // Variable to store the temperature (not used in this program)
    int result; // Variable to store the result of the conversion

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binary);

    // Open a file (not used in this program)
    file = fopen("dummy.txt", "w");

    // Close the file (subtle error: file is closed before it is used)
    closeFile(file);

    // Convert the binary number to decimal
    result = binaryToDecimal(binary);

    // Output the result
    printf("The decimal equivalent of %s is %d\n", binary, result);

    // Reopen the file (not used in this program)
    file = fopen("dummy.txt", "w");

    // Close the file again
    closeFile(file);

    return 0;
}

