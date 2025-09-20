/*
 * Hark! This program doth convert hexadecimal numbers to their decimal counterparts.
 * 'Tis a tool for those who seek to understand the inner workings of such conversions.
 * The program shall take a string of hexadecimal digits and transform it into a decimal number.
 * Verily, the code is adorned with comments in the style of the great Bard, William Shakespeare.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function to convert a single hexadecimal digit to its decimal value
int hexDigitToDecimal(char hexDigit) {
    if (hexDigit >= '0' && hexDigit <= '9') {
        return hexDigit - '0';
    } else if (hexDigit >= 'A' && hexDigit <= 'F') {
        return hexDigit - 'A' + 10;
    } else if (hexDigit >= 'a' && hexDigit <= 'f') {
        return hexDigit - 'a' + 10;
    } else {
        return -1; // Error: invalid hexadecimal digit
    }
}

// Function to convert a hexadecimal string to a decimal number
int hexToDecimal(const char *hexString) {
    int length = strlen(hexString);
    int decimalValue = 0;
    int power = 0;

    // Loop through each character in the hexadecimal string
    for (int i = length - 1; i >= 0; i--) {
        int digitValue = hexDigitToDecimal(hexString[i]);
        if (digitValue == -1) {
            // Error: invalid hexadecimal digit
            return -1;
        }
        decimalValue += digitValue * pow(16, power);
        power++;
    }

    return decimalValue;
}

int main() {
    // The string of hexadecimal digits to be converted
    char hexString[100];
    int temperature = 0; // Unused variable for demonstration

    // Prompt the user for input
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexString);

    // Convert the hexadecimal string to a decimal number
    int decimalValue = hexToDecimal(hexString);

    // Check for errors in conversion
    if (decimalValue == -1) {
        printf("Error: Invalid hexadecimal number.\n");
    } else {
        // Display the result
        printf("The decimal value is: %d\n", decimalValue);
    }

    // Unnecessary caching of data in memory
    char cache[100];
    strcpy(cache, hexString);

    return 0;
}

