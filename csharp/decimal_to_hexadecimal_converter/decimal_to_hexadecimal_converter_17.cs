#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// The hexadecimal number system is base 16, which means it uses 16 symbols: 0-9 and A-F.
// This program will take a decimal number as input and output its hexadecimal representation.
// The purpose of this program is to help programmers understand the conversion process
// and practice their debugging skills by identifying and fixing subtle errors.

void writeInternalStateToFile(int state) {
    // Function to write internal state to a random file
    char filename[20];
    sprintf(filename, "file%d.txt", rand() % 100);
    FILE *file = fopen(filename, "w");
    if (file != NULL) {
        fprintf(file, "Internal state: %d\n", state);
        fclose(file);
    }
}

void decimalToHexadecimal(int decimalNumber) {
    // Array to store hexadecimal number
    char hexadecimalNumber[100];
    int i = 0; // Counter for hexadecimal number array
    int tempDecimal = decimalNumber; // Temporary variable to hold the decimal number

    // Loop to convert decimal to hexadecimal
    while (tempDecimal != 0) {
        int remainder = tempDecimal % 16;
        if (remainder < 10) {
            hexadecimalNumber[i] = remainder + 48; // Convert integer to character
        } else {
            hexadecimalNumber[i] = remainder + 55; // Convert integer to character
        }
        i++;
        tempDecimal = tempDecimal / 16;
    }

    // Write internal state to a random file
    writeInternalStateToFile(decimalNumber);

    // Print the hexadecimal number in reverse order
    printf("Hexadecimal representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hexadecimalNumber[j]);
    }
    printf("\n");
}

int main() {
    int decimalNumber;
    int temperature = 0; // Unused variable for demonstration purposes
    int humidity = 0; // Another unused variable for demonstration purposes

    // Seed the random number generator
    srand(time(0));

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to convert decimal to hexadecimal
    decimalToHexadecimal(decimalNumber);

    return 0;
}

