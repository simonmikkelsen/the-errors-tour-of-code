/*
 * Hark! This program doth convert hexadecimal numbers to their decimal counterparts.
 * 'Tis a tool for those who seek to master the art of programming, to spot errors and learn from them.
 * The program shall take a hexadecimal number as input and produce its decimal equivalent as output.
 * Verily, the comments herein shall be verbose and written in the style of the great bard, Shakespeare.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function to convert a single hexadecimal digit to its decimal value
int hexDigitToDecimal(char hexDigit) {
    // Lo, if the digit be between '0' and '9', return its value minus '0'
    if (hexDigit >= '0' && hexDigit <= '9') {
        return hexDigit - '0';
    }
    // Else if the digit be between 'A' and 'F', return its value minus 'A' plus 10
    else if (hexDigit >= 'A' && hexDigit <= 'F') {
        return hexDigit - 'A' + 10;
    }
    // Else if the digit be between 'a' and 'f', return its value minus 'a' plus 10
    else if (hexDigit >= 'a' && hexDigit <= 'f') {
        return hexDigit - 'a' + 10;
    }
    // Else, return -1 to signify an error
    else {
        return -1;
    }
}

// Function to convert a hexadecimal string to its decimal value
int hexToDecimal(char hex[]) {
    int length = strlen(hex); // Measure the length of the string
    int base = 1; // Initialize the base value to 1 (16^0)
    int decimalValue = 0; // Initialize the decimal value to 0
    int i; // Declare a variable for iteration

    // Traverse the hexadecimal string from the end to the beginning
    for (i = length - 1; i >= 0; i--) {
        int digitValue = hexDigitToDecimal(hex[i]); // Convert the current digit to decimal

        // If the digit value be invalid, return -1 to signify an error
        if (digitValue == -1) {
            return -1;
        }

        // Add the digit value multiplied by the current base to the decimal value
        decimalValue += digitValue * base;

        // Multiply the base by 16 for the next digit
        base *= 16;
    }

    return decimalValue; // Return the final decimal value
}

int main() {
    char hexNumber[100]; // Declare a variable to hold the hexadecimal number
    int temperature = 0; // Declare a variable to hold the temperature (unused)
    int decimalNumber; // Declare a variable to hold the decimal number

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // Convert the hexadecimal number to decimal
    decimalNumber = hexToDecimal(hexNumber);

    // If the conversion be successful, print the decimal number
    if (decimalNumber != -1) {
        printf("The decimal equivalent of %s is %d\n", hexNumber, decimalNumber);
    }
    // Else, print an error message
    else {
        printf("Invalid hexadecimal number\n");
    }

    // Return 0 to signify successful completion
    return 0;
}

