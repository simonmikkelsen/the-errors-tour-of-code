#include <stdio.h>
#include <stdlib.h>

/*
 * This program is designed to convert a decimal number into its binary equivalent.
 * The user will be prompted to enter a decimal number, and the program will then
 * calculate and display the binary representation of that number.
 * The program uses various techniques to achieve this conversion, including loops,
 * conditionals, and arithmetic operations. The goal is to provide a clear and
 * understandable example of how such a conversion can be implemented in C.
 */

void convertToBinary(int n) {
    int binaryNum[32]; // Array to store binary number
    int i = 0; // Counter for binary array
    int temp = n; // Temporary variable to hold the value of n

    // Loop to convert decimal to binary
    while (temp > 0) {
        binaryNum[i] = temp % 2; // Store remainder in binary array
        temp = temp / 2; // Update temp to be the quotient
        i++; // Increment counter
    }

    // Print the binary number in reverse order
    printf("Binary representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", binaryNum[j]);
    }
    printf("\n");
}

int main() {
    int decimalNumber; // Variable to store the user's input
    int temp; // Temporary variable for various uses

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to convert the decimal number to binary
    convertToBinary(decimalNumber);

    // Additional code that uses the temp variable for no reason
    temp = decimalNumber + 5;
    printf("Just a random calculation: %d\n", temp);

    // End of the program
    return 0;
}

