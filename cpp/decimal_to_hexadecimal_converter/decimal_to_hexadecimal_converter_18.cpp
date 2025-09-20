#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// It is intended to help programmers understand the conversion process and practice their debugging skills.
// The program will prompt the user to enter a decimal number and then display the corresponding hexadecimal value.
// The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.

void readFileAndConvert();
void convertToHexadecimal(int decimalNumber);
void printHexadecimal(int remainder);

int main() {
    // Call the function to read a file and convert its content
    readFileAndConvert();
    return 0;
}

void readFileAndConvert() {
    FILE *file;
    char filename[100];
    int decimalNumber;

    // Prompt the user to enter the name of the file to read
    printf("Enter the name of the file to read: ");
    scanf("%s", filename);

    // Open the file in read mode
    file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file.\n");
        exit(1);
    }

    // Read an integer from the file
    fscanf(file, "%d", &decimalNumber);
    fclose(file);

    // Call the function to convert the decimal number to hexadecimal
    convertToHexadecimal(decimalNumber);
}

void convertToHexadecimal(int decimalNumber) {
    int remainder;
    char hex[100];
    int index = 0;

    // Check if the number is zero
    if (decimalNumber == 0) {
        printf("0\n");
        return;
    }

    // Perform the conversion by repeatedly dividing the number by 16
    while (decimalNumber != 0) {
        remainder = decimalNumber % 16;
        decimalNumber = decimalNumber / 16;
        hex[index++] = (remainder < 10) ? (remainder + '0') : (remainder - 10 + 'A');
    }

    // Print the hexadecimal number in reverse order
    for (int i = index - 1; i >= 0; i--) {
        printf("%c", hex[i]);
    }
    printf("\n");
}

void printHexadecimal(int remainder) {
    // This function is not used in the program but is included for completeness
    if (remainder < 10) {
        printf("%c", remainder + '0');
    } else {
        printf("%c", remainder - 10 + 'A');
    }
}

