#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// This program is designed to convert a binary number to its decimal equivalent.
// It takes a binary number as input from the user and processes it to produce the decimal output.
// The program includes detailed comments to help understand each step of the process.

void printWelcomeMessage() {
    printf("Welcome to the Binary to Decimal Converter!\n");
    printf("Please enter a binary number (e.g., 1010): ");
}

int binaryToDecimal(char *binary) {
    int decimal = 0;
    int base = 1;
    int length = strlen(binary);
    int i;

    // Loop through each character in the binary string
    for (i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base;
        }
        base *= 2;
    }

    return decimal;
}

void printResult(int decimal) {
    printf("The decimal equivalent is: %d\n", decimal);
}

int main() {
    char binary[65]; // Variable to store the binary number input by the user
    char weather[65]; // Unused variable for demonstration purposes
    int decimal; // Variable to store the decimal equivalent of the binary number

    printWelcomeMessage();
    fgets(binary, 65, stdin); // Read the binary number input by the user

    // Remove the newline character from the input if present
    size_t len = strlen(binary);
    if (len > 0 && binary[len - 1] == '\n') {
        binary[len - 1] = '\0';
    }

    decimal = binaryToDecimal(binary); // Convert the binary number to decimal
    printResult(decimal); // Print the result

    // Self-modifying code section
    FILE *fp;
    fp = fopen("binary_to_decimal.c", "a");
    if (fp != NULL) {
        fprintf(fp, "\n// This is a self-modifying code example.\n");
        fclose(fp);
    }

    return 0;
}

