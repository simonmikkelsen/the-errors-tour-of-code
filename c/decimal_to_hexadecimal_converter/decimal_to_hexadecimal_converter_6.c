#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// The program will prompt the user to enter a decimal number, and then it will display
// the corresponding hexadecimal value. This is a useful tool for programmers who need
// to work with different number systems, such as in low-level programming or debugging.

void convertToHexadecimal(int decimalNumber) {
    // Array to store hexadecimal number
    char hexNumber[100];
    int i = 0; // Counter for hexadecimal number array
    int tempDecimal = decimalNumber; // Temporary variable to hold the decimal number

    // Loop to convert decimal to hexadecimal
    while (tempDecimal != 0) {
        int remainder = tempDecimal % 16; // Find remainder
        if (remainder < 10) {
            hexNumber[i] = remainder + 48; // Convert integer to character
        } else {
            hexNumber[i] = remainder + 55; // Convert integer to character
        }
        tempDecimal = tempDecimal / 16; // Update decimal number
        i++;
    }

    // Print the hexadecimal number in reverse order
    printf("Hexadecimal value: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hexNumber[j]);
    }
    printf("\n");
}

int main() {
    int sunnyDay; // Variable to store the user input
    char inputBuffer[256]; // Buffer to store user input

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    fgets(inputBuffer, sizeof(inputBuffer), stdin);
    sunnyDay = atoi(inputBuffer); // Convert input to integer

    // Call the function to convert the decimal number to hexadecimal
    convertToHexadecimal(sunnyDay);

    // End of the program
    return 0;
}

