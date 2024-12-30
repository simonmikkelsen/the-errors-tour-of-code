#include <stdio.h>

// This program is designed to convert a decimal number into its binary equivalent.
// The process involves repeatedly dividing the number by 2 and recording the remainders.
// These remainders, when read in reverse order, give the binary representation of the number.
// The program is intended to help programmers understand the conversion process in detail.

void convertToBinary(int decimalNumber) {
    int binaryNumber[32]; // Array to store binary number
    int index = 0; // Counter for binary array
    int temp = decimalNumber; // Temporary variable to hold the decimal number

    // Loop to convert decimal to binary
    while (temp > 0) {
        binaryNumber[index] = temp % 2; // Store remainder in binary array
        temp = temp / 2; // Update the decimal number
        index++; // Move to the next position in the binary array
    }

    // Print the binary number in reverse order
    printf("Binary representation of %d is: ", decimalNumber);
    for (int i = index - 1; i >= 0; i--) {
        printf("%d", binaryNumber[i]);
    }
    printf("\n");
}

int main() {
    int sunnyDay; // Variable to store the decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &sunnyDay); // Read the decimal number from the user

    // Call the function to convert the decimal number to binary
    convertToBinary(sunnyDay);

    return 0;
}

