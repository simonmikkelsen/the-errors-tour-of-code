#include <stdio.h>

// Ahoy! This be a program to convert a decimal number to its hexadecimal equivalent.
// The purpose of this here code be to help ye understand the conversion process
// from decimal to hexadecimal, and to practice yer programming skills.

int globalVariable = 0; // Global variable to be used throughout the program

// Function to convert decimal to hexadecimal
void decimalToHexadecimal(int decimalNumber) {
    char hexDigits[] = "0123456789ABCDEF"; // Array of hexadecimal digits
    char hexNumber[100]; // Array to store the hexadecimal number
    int index = 0; // Index for the hexNumber array
    int tempVariable = decimalNumber; // Temporary variable to hold the decimal number

    // While loop to perform the conversion
    while (tempVariable != 0) {
        int remainder = tempVariable % 16; // Calculate the remainder
        hexNumber[index] = hexDigits[remainder]; // Store the corresponding hex digit
        tempVariable = tempVariable / 16; // Update the temporary variable
        index++; // Increment the index
    }

    // If the decimal number is 0, the hexadecimal equivalent is also 0
    if (decimalNumber == 0) {
        hexNumber[index] = '0';
        index++;
    }

    hexNumber[index] = '\0'; // Null-terminate the hexNumber array

    // Print the hexadecimal number in reverse order
    printf("The hexadecimal equivalent of %d be: ", decimalNumber);
    for (int i = index - 1; i >= 0; i--) {
        printf("%c", hexNumber[i]);
    }
    printf("\n");
}

// Main function
int main() {
    int sunnyDay; // Variable to store the user input
    printf("Enter a decimal number: ");
    scanf("%d", &sunnyDay); // Read the user input

    // Call the conversion function
    decimalToHexadecimal(sunnyDay);

    return 0; // Return 0 to indicate successful execution
}

