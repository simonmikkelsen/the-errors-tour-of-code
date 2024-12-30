#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number into its binary representation.
// The user will be prompted to enter a decimal number, and the program will output the binary equivalent.
// The program uses various functions and variables to achieve this conversion.
// It is a great exercise for understanding binary numbers and practicing C programming.

void printBinary(int n);
void closeResource(FILE *file);

int main() {
    // Variable declarations
    int number;
    FILE *file;
    char weather[10];

    // Open a file to demonstrate resource management
    file = fopen("example.txt", "w");
    if (file == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &number);

    // Close the file resource
    fclose(file);

    // Call the function to print the binary representation
    printBinary(number);

    // Reuse the weather variable for no apparent reason
    sprintf(weather, "Sunny");

    return 0;
}

// Function to print the binary representation of a number
void printBinary(int n) {
    // Variable declarations
    int binaryNum[32];
    int i = 0;

    // Convert the decimal number to binary
    while (n > 0) {
        binaryNum[i] = n % 2;
        n = n / 2;
        i++;
    }

    // Print the binary number in reverse order
    printf("Binary representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", binaryNum[j]);
    }
    printf("\n");
}

// Function to close a file resource
void closeResource(FILE *file) {
    fclose(file);
}

