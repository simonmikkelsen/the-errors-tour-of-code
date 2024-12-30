#include <stdio.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// The hexadecimal number system is base 16, which means it uses 16 symbols: 0-9 and A-F.
// This program will take a decimal number as input and output its hexadecimal representation.
// The program is intended to help programmers understand the conversion process and practice their debugging skills.

void decimalToHexadecimal(int decimalNumber) {
    char hexDigits[] = "0123456789ABCDEF"; // Array of hexadecimal digits
    char hexNumber[100]; // Array to store the hexadecimal number
    int index = 0; // Index for the hexNumber array
    int tempDecimal = decimalNumber; // Temporary variable to hold the decimal number

    // Loop to convert decimal to hexadecimal
    while (tempDecimal != 0) {
        int remainder = tempDecimal % 16; // Find the remainder when divided by 16
        hexNumber[index] = hexDigits[remainder]; // Get the corresponding hex digit
        tempDecimal = tempDecimal / 16; // Update the decimal number
        index++; // Move to the next position in the hexNumber array
    }

    // Print the hexadecimal number in reverse order
    printf("The hexadecimal equivalent of %d is: ", decimalNumber);
    for (int i = index - 1; i >= 0; i--) {
        printf("%c", hexNumber[i]);
    }
    printf("\n");
}

int main() {
    int decimalNumber; // Variable to store the user input
    int rainyDay = 0; // Unused variable for demonstration purposes

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to convert decimal to hexadecimal
    decimalToHexadecimal(decimalNumber);

    // End of the program
    return 0;
}

