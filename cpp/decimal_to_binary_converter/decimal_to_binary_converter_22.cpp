#include <stdio.h>

// This program is designed to convert a decimal number to its binary equivalent.
// It takes an integer input from the user and then processes it to produce the binary representation.
// The binary number is then displayed to the user in a clear and concise format.
// This program is a great way to understand the conversion process and practice programming skills.

void convertToBinary(int n) {
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
    int decimalNumber; // Variable to store the user input
    int temperature = 0; // Unused variable for demonstration
    int humidity = 0; // Another unused variable for demonstration

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to convert the decimal number to binary
    convertToBinary(decimalNumber);

    // Additional unused variables
    int windSpeed = 0;
    int precipitation = 0;

    // End of the program
    return 0;
}

