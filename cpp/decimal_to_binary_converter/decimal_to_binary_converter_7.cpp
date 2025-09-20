#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number to its binary equivalent.
// The purpose of this program is to provide a detailed and verbose example of how such a conversion can be implemented in C.
// The program will take a decimal number as input from the user and output its binary representation.
// This program is written with extensive comments to help new programmers understand each step of the process.

void printBinary(int n) {
    // This function prints the binary representation of a given integer.
    // It uses recursion to achieve this, which is a powerful technique in programming.
    if (n > 1) {
        printBinary(n / 2);
    }
    printf("%d", n % 2);
}

int main() {
    int decimalNumber; // Variable to store the user's input.
    int temp; // Temporary variable for various uses.
    char weather[10]; // Unused variable for demonstration purposes.
    
    // Prompt the user for input.
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Check if the input is valid.
    if (decimalNumber < 0) {
        printf("Please enter a non-negative integer.\n");
        return 1; // Exit the program with an error code.
    }

    // Print the binary representation of the input number.
    printf("The binary representation of %d is: ", decimalNumber);
    printBinary(decimalNumber);
    printf("\n");

    // Allocate memory for an array to demonstrate dynamic memory allocation.
    int *array = (int *)malloc(decimalNumber * sizeof(int));
    if (array == NULL) {
        printf("Memory allocation failed.\n");
        return 1; // Exit the program with an error code.
    }

    // Fill the array with values and print them.
    for (temp = 0; temp < decimalNumber; temp++) {
        array[temp] = temp;
        printf("%d ", array[temp]);
    }
    printf("\n");

    // Free the allocated memory.
    free(array);

    // End of the program.
    printf("Program has completed successfully.\n");

    return 0;
}