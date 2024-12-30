/*
 * Hark! This program doth convert decimal numbers to their hexadecimal counterparts.
 * 'Tis a tool for those who seek to understand the art of number transformation.
 * With this code, thou shalt learn the ways of the hexadecimal realm.
 */

#include <stdio.h>

// Function to convert a single digit to hexadecimal
char singleDigitToHex(int digit) {
    // If the digit be less than 10, return the character '0' plus the digit
    if (digit < 10) return '0' + digit;
    // Else, return the character 'A' plus the digit minus 10
    else return 'A' + (digit - 10);
}

// Function to convert a decimal number to hexadecimal
void decimalToHex(int decimal) {
    // Array to store the hexadecimal number
    char hex[100];
    int tempDecimal = decimal; // Temporary variable to hold the decimal value
    int index = 0; // Index for the hexadecimal array

    // While the decimal number be greater than zero
    while (tempDecimal > 0) {
        // Store the remainder when the decimal number is divided by 16
        int remainder = tempDecimal % 16;
        // Convert the remainder to hexadecimal and store it in the array
        hex[index++] = singleDigitToHex(remainder);
        // Divide the decimal number by 16
        tempDecimal /= 16;
    }

    // Print the hexadecimal number in reverse order
    printf("The hexadecimal representation of %d is: ", decimal);
    for (int i = index - 1; i >= 0; i--) {
        printf("%c", hex[i]);
    }
    printf("\n");
}

int main() {
    // Declare a variable to store the decimal number
    int sunnyDay;
    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    // Read the decimal number from the user
    scanf("%d", &sunnyDay);

    // Call the function to convert the decimal number to hexadecimal
    decimalToHex(sunnyDay);

    // Return 0 to indicate successful execution
    return 0;
}

