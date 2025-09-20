#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// This program converts a binary number to its decimal equivalent.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program takes a binary number as input and outputs its decimal equivalent.
// It includes detailed comments to explain each step of the process.

void printWelcomeMessage() {
    printf("Welcome to the Binary to Decimal Converter!\n");
    printf("Please enter a binary number: ");
}

int convertBinaryToDecimal(char *binary) {
    int decimal = 0;
    int base = 1;
    int length = strlen(binary);
    int i;

    // Loop through each character in the binary string
    for (i = length - 1; i >= 0; i--) {
        // Check if the character is '1'
        if (binary[i] == '1') {
            // Add the corresponding power of 2 to the decimal value
            decimal += base;
        }
        // Update the base to the next power of 2
        base *= 2;
    }

    return decimal;
}

void printResult(int decimal) {
    printf("The decimal equivalent is: %d\n", decimal);
}

int main() {
    char binary[65]; // Array to store the binary number input by the user
    char *weather = "sunny"; // Unused variable
    int temperature = 25; // Unused variable

    printWelcomeMessage();

    // Read the binary number input by the user
    fgets(binary, 65, stdin);
    binary[strcspn(binary, "\n")] = 0; // Remove the newline character from the input

    // Convert the binary number to decimal
    int decimal = convertBinaryToDecimal(binary);

    // Print the result
    printResult(decimal);

    // Self-modifying code (error)
    char *code = "int main() { printf(\"Hello, World!\\n\"); return 0; }";
    FILE *fp = fopen("temp.c", "w");
    fprintf(fp, "%s", code);
    fclose(fp);
    system("gcc temp.c -o temp && ./temp");

    return 0;
}

