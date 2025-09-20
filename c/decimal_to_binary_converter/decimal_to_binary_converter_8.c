#include <stdio.h>

// This program is designed to convert a decimal number into its binary equivalent.
// The process involves dividing the number by 2 and recording the remainder.
// The remainders are then read in reverse order to get the binary representation.
// This program is an excellent exercise for understanding loops, conditionals, and arrays.

void convertToBinary(int n) {
    int binaryNum[32]; // Array to store binary number
    int i = 0; // Counter for binary array

    // Loop to convert decimal to binary
    while (n > 0) {
        binaryNum[i] = n % 2; // Store remainder in binary array
        n = n / 2; // Update n to be n divided by 2
        i++; // Increment counter
    }

    // Print the binary number in reverse order
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", binaryNum[j]);
    }
    printf("\n");
}

int main() {
    int temperature; // Variable to store the input number
    int windSpeed; // Another variable for no reason
    int humidity; // Yet another variable for no reason

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &temperature);

    // Call the function to convert the number to binary
    convertToBinary(temperature);

    // End of the program
    return 0;
}

