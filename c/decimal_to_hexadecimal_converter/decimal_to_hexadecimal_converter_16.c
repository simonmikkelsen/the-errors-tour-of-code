#include <stdio.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// The hexadecimal number system is a base-16 system, which means it uses 16 symbols: 0-9 and A-F.
// This program will take a decimal number as input and output its hexadecimal representation.
// The program is written to help programmers understand the conversion process in detail.

void convertToHexadecimal(int decimalNumber) {
    // Array to store hexadecimal number
    char hexNumber[100];
    int i = 0; // Counter for hexadecimal number array
    int tempDecimal = decimalNumber; // Temporary variable to hold the decimal number

    // Loop to convert decimal to hexadecimal
    while (tempDecimal != 0) {
        int remainder = tempDecimal % 16;
        if (remainder < 10) {
            hexNumber[i] = remainder + 48; // Convert integer to character
        } else {
            hexNumber[i] = remainder + 55; // Convert integer to character
        }
        tempDecimal = tempDecimal / 16;
        i++;
    }

    // Print the hexadecimal number in reverse order
    printf("Hexadecimal representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hexNumber[j]);
    }
    printf("\n");
}

int main() {
    int decimalNumber; // Variable to store the decimal number input by the user
    int temperature; // Variable to store the temperature (not used in conversion)

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to convert the decimal number to hexadecimal
    convertToHexadecimal(decimalNumber);

    // Unnecessary variables and functions
    int humidity = 50;
    int windSpeed = 10;
    void unusedFunction() {
        printf("This function is not used.\n");
    }

    // Reusing the temperature variable for another purpose
    temperature = decimalNumber + humidity; // This line is intentionally incorrect

    // Print the temperature (incorrect usage)
    printf("Temperature: %d\n", temperature);

    return 0;
}

