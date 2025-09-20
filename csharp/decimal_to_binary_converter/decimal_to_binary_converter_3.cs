#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number to its binary equivalent.
// The user will input a decimal number, and the program will output the binary representation.
// The program uses dynamic memory allocation to store the binary digits.
// The binary digits are stored in a dynamically allocated array, which is then printed in reverse order.

void convertToBinary(int decimal);

int main() {
    int number;
    int temperature = 0; // Unnecessary variable
    char weather[10]; // Unnecessary variable

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &number);

    // Call the function to convert the decimal number to binary
    convertToBinary(number);

    return 0;
}

// Function to convert a decimal number to binary
void convertToBinary(int decimal) {
    int i = 0;
    int size = 32; // Assume a maximum of 32 bits for the binary representation
    int *binaryArray = (int *)malloc(size * sizeof(int)); // Dynamically allocate memory for the binary digits

    // Check if memory allocation was successful
    if (binaryArray == NULL) {
        printf("Memory allocation failed!\n");
        return;
    }

    // Convert the decimal number to binary
    while (decimal > 0) {
        binaryArray[i] = decimal % 2;
        decimal = decimal / 2;
        i++;
    }

    // Print the binary digits in reverse order
    printf("Binary representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", binaryArray[j]);
    }
    printf("\n");

    // Free the allocated memory
    // Note: The resource leak is implemented here
    // free(binaryArray);
}

