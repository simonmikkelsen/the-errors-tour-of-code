#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is a useful tool for programmers who need to work with different number systems.
// The program reads a hexadecimal number from a file and converts it to a decimal number.
// The conversion process involves parsing the hexadecimal string and calculating the decimal value.
// The program demonstrates the use of various C programming concepts such as file handling, string manipulation, and arithmetic operations.

void readHexFromFile(char *filename, char *hexString) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file.\n");
        exit(1);
    }
    fscanf(file, "%s", hexString);
    fclose(file);
}

int hexToDecimal(char *hexString) {
    int length = strlen(hexString);
    int base = 1;
    int decimalValue = 0;
    int i;

    for (i = length - 1; i >= 0; i--) {
        if (hexString[i] >= '0' && hexString[i] <= '9') {
            decimalValue += (hexString[i] - 48) * base;
            base = base * 16;
        } else if (hexString[i] >= 'A' && hexString[i] <= 'F') {
            decimalValue += (hexString[i] - 55) * base;
            base = base * 16;
        } else if (hexString[i] >= 'a' && hexString[i] <= 'f') {
            decimalValue += (hexString[i] - 87) * base;
            base = base * 16;
        }
    }
    return decimalValue;
}

int main() {
    // Variable declarations
    char hexString[100];
    int decimalValue;
    char *filename = "input.txt";

    // Read the hexadecimal number from a file
    readHexFromFile(filename, hexString);

    // Convert the hexadecimal number to a decimal number
    decimalValue = hexToDecimal(hexString);

    // Print the decimal value
    printf("The decimal value of %s is %d\n", hexString, decimalValue);

    // End of the program
    // The program has successfully converted the hexadecimal number to a decimal number.
    // This demonstrates the ability to work with different number systems and perform conversions.
    // The program also shows how to handle files and perform string manipulations in C.
    // Thank you for using this program. We hope it has been helpful in understanding hexadecimal to decimal conversions.

    return 0;
}

