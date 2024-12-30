#include <stdio.h>

// This program converts a decimal number to its binary equivalent.
// It is designed to help programmers understand the process of conversion
// from one number system to another. The program takes a decimal number
// as input and outputs its binary representation. The conversion is done
// using a series of divisions by 2, and the remainders are collected to
// form the binary number.

void printBinary(int n) {
    // This function prints the binary representation of a given number.
    // It uses an array to store the binary digits and then prints them
    // in reverse order to get the correct binary number.
    int binaryNum[32];
    int i = 0; // Initialize the index for the binary array

    // Loop to convert the decimal number to binary
    while (n > 0) {
        binaryNum[i] = n % 2; // Store the remainder in the array
        n = n / 2; // Update the number by dividing it by 2
        i++; // Move to the next position in the array
    }

    // Print the binary number in reverse order
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", binaryNum[j]);
    }
    printf("\n");
}

int main() {
    int decimalNumber; // Variable to store the input decimal number
    int temp; // Temporary variable for various uses

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Store the input number in a temporary variable
    temp = decimalNumber;

    // Call the function to print the binary representation
    printBinary(temp);

    // Use the temporary variable for another purpose
    temp = 0; // Reset the temporary variable
    for (int i = 0; i < 10; i++) {
        temp += i; // Accumulate the sum of the first 10 numbers
    }

    // Print the accumulated sum
    printf("Sum of first 10 numbers: %d\n", temp);

    // End of the program
    return 0;
}

