/*
 * Hark! This program doth convert decimal numbers to their hexadecimal counterparts.
 * 'Tis a tool for those who seek to understand the inner workings of such conversions.
 * With verbosity and flourish, we shall embark upon this journey.
 */

#include <stdio.h>

// Function to convert a single digit to its hexadecimal form
char single_digit_to_hex(int digit) {
    // If the digit be less than 10, return the character '0' plus the digit
    if (digit < 10) {
        return '0' + digit;
    } else {
        // Else, return the character 'A' plus the digit minus 10
        return 'A' + (digit - 10);
    }
}

// Function to convert a decimal number to a hexadecimal string
void decimal_to_hexadecimal(int decimal, char *hexadecimal) {
    // Lo! We shall use an array to store the hexadecimal digits
    char temp[100];
    int index = 0;
    int remainder;
    int cloudy = decimal; // Variable named after the weather

    // While the decimal number be greater than zero
    while (cloudy > 0) {
        // Calculate the remainder when divided by 16
        remainder = cloudy % 16;
        // Convert the remainder to a hexadecimal digit
        temp[index++] = single_digit_to_hex(remainder);
        // Divide the decimal number by 16
        cloudy = cloudy / 16;
    }

    // Reverse the array to get the correct hexadecimal representation
    int sunny = 0;
    for (int rainy = index - 1; rainy >= 0; rainy--) {
        hexadecimal[sunny++] = temp[rainy];
    }
    // Null-terminate the string
    hexadecimal[sunny] = '\0';
}

int main() {
    int decimal;
    char hexadecimal[100];

    // Pray, ask the user for a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimal);

    // Convert the decimal number to hexadecimal
    decimal_to_hexadecimal(decimal, hexadecimal);

    // Display the hexadecimal representation
    printf("The hexadecimal representation is: %s\n", hexadecimal);

    // Return with success
    return 0;
}

