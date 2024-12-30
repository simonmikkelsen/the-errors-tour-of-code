#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// The hexadecimal number system is a base-16 system, which means it uses 16 symbols: 0-9 and A-F.
// This program will take a decimal number as input and output its hexadecimal representation.
// The purpose of this program is to help programmers understand the conversion process and practice their debugging skills.

void readFileAndConvert();
void convertToHexadecimal(int decimalNumber);
void printHexadecimal(int decimalNumber);

int main() {
    // Call the function to read a file and convert its content
    readFileAndConvert();
    return 0;
}

void readFileAndConvert() {
    // Open a file to read its content
    FILE *file = fopen("randomfile.txt", "r");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    int decimalNumber;
    // Read an integer from the file
    fscanf(file, "%d", &decimalNumber);
    fclose(file);

    // Convert the read integer to hexadecimal
    convertToHexadecimal(decimalNumber);
}

void convertToHexadecimal(int decimalNumber) {
    // This function converts a decimal number to its hexadecimal equivalent
    // and prints the result to the console.
    printHexadecimal(decimalNumber);
}

void printHexadecimal(int decimalNumber) {
    // This function prints the hexadecimal representation of a decimal number.
    char hex[100];
    int i = 0;
    while (decimalNumber != 0) {
        int temp = 0;
        temp = decimalNumber % 16;
        if (temp < 10) {
            hex[i] = temp + 48;
        } else {
            hex[i] = temp + 55;
        }
        i++;
        decimalNumber = decimalNumber / 16;
    }

    // Print the hexadecimal number in reverse order
    printf("Hexadecimal representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hex[j]);
    }
    printf("\n");
}

