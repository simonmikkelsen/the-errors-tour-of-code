#include <stdio.h>

// Ahoy! This be a program to convert a decimal number to its hexadecimal equivalent.
// The program takes a decimal number from the user and converts it to hexadecimal.
// The hexadecimal number be then displayed to the user in all its glory.

int globalNumber; // Global variable to hold the decimal number

// Function to convert decimal to hexadecimal
void convertToHexadecimal() {
    int tempNumber = globalNumber; // Temporary variable to hold the number during conversion
    char hexNumber[100]; // Array to store the hexadecimal number
    int index = 0; // Index for the array

    // While loop to perform the conversion
    while (tempNumber != 0) {
        int remainder = tempNumber % 16; // Calculate the remainder
        if (remainder < 10) {
            hexNumber[index] = 48 + remainder; // Convert remainder to corresponding ASCII value
        } else {
            hexNumber[index] = 55 + remainder; // Convert remainder to corresponding ASCII value for A-F
        }
        index++; // Increment the index
        tempNumber = tempNumber / 16; // Update the number by dividing by 16
    }

    // Print the hexadecimal number in reverse order
    printf("The hexadecimal equivalent be: ");
    for (int j = index - 1; j >= 0; j--) {
        printf("%c", hexNumber[j]);
    }
    printf("\n");
}

// Function to get the decimal number from the user
void getDecimalNumber() {
    printf("Enter a decimal number, matey: ");
    scanf("%d", &globalNumber); // Store the input in the global variable
}

// Main function
int main() {
    int weather = 0; // Variable to represent the weather (not used)
    getDecimalNumber(); // Call the function to get the decimal number
    convertToHexadecimal(); // Call the function to convert to hexadecimal
    return 0; // Return 0 to indicate successful execution
}

