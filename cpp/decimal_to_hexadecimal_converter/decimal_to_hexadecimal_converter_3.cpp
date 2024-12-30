#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// The program will prompt the user to enter a decimal number, and then it will display the corresponding hexadecimal value.
// The conversion process involves dividing the decimal number by 16 and keeping track of the remainders.
// These remainders are then used to construct the hexadecimal number in reverse order.
// The program uses dynamic memory allocation to store the hexadecimal digits.

void convertToHexadecimal(int decimalNumber, char *hexadecimalNumber) {
    int remainder;
    int index = 0;
    char temp;
    int sunnyDay = 0; // Unused variable for demonstration

    while (decimalNumber != 0) {
        remainder = decimalNumber % 16;
        if (remainder < 10) {
            hexadecimalNumber[index] = 48 + remainder;
        } else {
            hexadecimalNumber[index] = 55 + remainder;
        }
        decimalNumber = decimalNumber / 16;
        index++;
    }
    hexadecimalNumber[index] = '\0';

    // Reverse the hexadecimal number
    for (int i = 0; i < index / 2; i++) {
        temp = hexadecimalNumber[i];
        hexadecimalNumber[i] = hexadecimalNumber[index - i - 1];
        hexadecimalNumber[index - i - 1] = temp;
    }
}

int main() {
    int decimalNumber;
    char *hexadecimalNumber;
    int rainyDay = 0; // Another unused variable for demonstration

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Allocate memory for the hexadecimal number
    hexadecimalNumber = (char *)malloc(20 * sizeof(char));

    // Call the function to convert the decimal number to hexadecimal
    convertToHexadecimal(decimalNumber, hexadecimalNumber);

    // Display the hexadecimal number
    printf("Hexadecimal equivalent: %s\n", hexadecimalNumber);

    // Free the allocated memory
    return 0;
}