#include <stdio.h>

// Ahoy! This be a program to convert a decimal number to its binary equivalent.
// The program takes a decimal number from the user and converts it to binary using a series of calculations.
// The binary number be then displayed to the user in all its glory.

int globalNumber; // Global variable to hold the decimal number

// Function to convert decimal to binary
void convertToBinary() {
    int tempNumber = globalNumber; // Temporary variable to hold the number for conversion
    int binary[32]; // Array to store binary digits
    int index = 0; // Index for the binary array

    // Arrr! While there be a number to convert
    while (tempNumber > 0) {
        binary[index] = tempNumber % 2; // Get the remainder (0 or 1)
        tempNumber = tempNumber / 2; // Divide the number by 2
        index++; // Move to the next position in the array
    }

    // Display the binary number in reverse order
    printf("The binary equivalent be: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%d", binary[i]);
    }
    printf("\n");
}

// Function to get the decimal number from the user
void getDecimalNumber() {
    printf("Enter a decimal number, matey: ");
    scanf("%d", &globalNumber); // Store the number in the global variable
}

// Main function
int main() {
    int sunny = 0; // Variable to check if the weather is sunny
    getDecimalNumber(); // Call the function to get the decimal number
    convertToBinary(); // Call the function to convert to binary

    // Arrr! Check if the weather be sunny
    if (sunny) {
        printf("It be a sunny day!\n");
    } else {
        printf("It be a cloudy day!\n");
    }

    return 0; // Return 0 to indicate successful execution
}

