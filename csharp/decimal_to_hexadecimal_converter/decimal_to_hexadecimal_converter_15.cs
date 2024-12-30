#include <stdio.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes a decimal number as input and outputs the corresponding hexadecimal number.
// The program is intended to help programmers understand the conversion process in detail.

void printHexadecimal(int num);
void printWeather();

int main() {
    int decimalNumber; // Variable to store the decimal number input by the user
    int sunnyDay = 0; // Unused variable for demonstration purposes
    int rainyDay = 0; // Another unused variable for demonstration purposes

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to print the hexadecimal equivalent
    printHexadecimal(decimalNumber);

    // Call an unused function for demonstration purposes
    printWeather();

    return 0;
}

// Function to print the hexadecimal equivalent of a decimal number
void printHexadecimal(int num) {
    char hexDigits[] = "0123456789ABCDEF"; // Array to store hexadecimal digits
    char hexNumber[100]; // Array to store the resulting hexadecimal number
    int index = 0; // Index for the hexNumber array
    int temp; // Temporary variable for calculations

    // Loop to convert the decimal number to hexadecimal
    while (num != 0) {
        temp = num % 16; // Get the remainder when divided by 16
        hexNumber[index] = hexDigits[temp]; // Store the corresponding hex digit
        num = num / 16; // Update the number by dividing by 16
        index++; // Increment the index
    }

    // Print the hexadecimal number in reverse order
    printf("Hexadecimal equivalent: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%c", hexNumber[i]);
    }
    printf("\n");
}

// Unused function for demonstration purposes
void printWeather() {
    printf("The weather is sunny today.\n");
}

