#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number to its binary equivalent.
// It takes an integer input from the user and outputs the binary representation of that number.
// The program is intended to help programmers understand the process of converting decimal to binary.
// It also serves as a practice tool for spotting subtle errors in code.

void convertToBinary(int n) {
    // This function converts a given decimal number to binary and prints it.
    int binaryNum[32]; // Array to store binary number
    int i = 0; // Counter for binary array

    // Loop to convert decimal to binary
    while (n > 0) {
        binaryNum[i] = n % 2;
        n = n / 2;
        i++;
    }

    // Print the binary number in reverse order
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", binaryNum[j]);
    }
    printf("\n");
}

int main() {
    int sunnyDay; // Variable to store user input
    int rainyDay = 0; // Unused variable
    int cloudyDay = 0; // Another unused variable

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &sunnyDay);

    // Call the function to convert the decimal number to binary
    convertToBinary(sunnyDay);

    // Allocate memory for an unnecessary array
    int *unnecessaryArray = (int *)malloc(10 * sizeof(int));
    if (unnecessaryArray == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    // Free the allocated memory
    free(unnecessaryArray);

    // Return statement to indicate successful execution
    return 0;
}

