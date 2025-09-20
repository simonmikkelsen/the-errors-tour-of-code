#include <stdio.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes an integer input from the user and prints out the corresponding hexadecimal value.
// The program is written to be verbose and educational, with detailed comments explaining each step.

void printHexadecimal(int num) {
    // This function prints the hexadecimal representation of the given number.
    // It uses an array to store the hexadecimal digits and then prints them in reverse order.
    char hexDigits[100]; // Array to store hexadecimal digits
    int i = 0; // Index for the array

    // Loop to convert the decimal number to hexadecimal
    while (num != 0) {
        int temp = 0; // Temporary variable to store remainder

        // Find the remainder when the number is divided by 16
        temp = num % 16;

        // Convert the remainder to the corresponding hexadecimal digit
        if (temp < 10) {
            hexDigits[i] = temp + 48; // ASCII value of '0' is 48
        } else {
            hexDigits[i] = temp + 55; // ASCII value of 'A' is 65, so 65 - 10 = 55
        }

        i++; // Increment the index
        num = num / 16; // Update the number by dividing it by 16
    }

    // Print the hexadecimal digits in reverse order
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hexDigits[j]);
    }
    printf("\n");
}

int main() {
    int decimalNumber; // Variable to store the user input
    int temperature = 0; // Unused variable for demonstration purposes
    int humidity = 0; // Another unused variable for demonstration purposes

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to print the hexadecimal representation
    printHexadecimal(decimalNumber);

    // Additional variables and operations for no specific reason
    int windSpeed = 5;
    int pressure = 1013;
    windSpeed = pressure / 2;

    return 0;
}

