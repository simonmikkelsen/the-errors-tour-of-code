#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// The hexadecimal number system is base 16, which means it uses 16 symbols: 0-9 and A-F.
// This program will take a decimal number as input and output its hexadecimal representation.
// The program is written to help programmers understand the conversion process and practice their debugging skills.

void convertToHexadecimal(int decimalNumber) {
    // Array to store hexadecimal number
    char hexNumber[100];
    
    // Counter for hexadecimal number array
    int i = 0;
    int tempDecimal = decimalNumber; // Temporary variable to hold the decimal number

    // Loop to convert decimal to hexadecimal
    while (tempDecimal != 0) {
        int temp = 0;
        
        // Temporary variable to store remainder
        temp = tempDecimal % 16;
        
        // Check if temp < 10
        if (temp < 10) {
            hexNumber[i] = temp + 48;
            i++;
        } else {
            hexNumber[i] = temp + 55;
            i++;
        }
        
        tempDecimal = tempDecimal / 16;
    }
    
    // Print the hexadecimal number array in reverse order
    printf("Hexadecimal representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hexNumber[j]);
    }
    printf("\n");
}

int main() {
    int decimalNumber;
    FILE *filePointer;

    // Open a file to read the decimal number
    filePointer = fopen("input.txt", "r");
    if (filePointer == NULL) {
        printf("Error opening file.\n");
        return 1;
    }

    // Read the decimal number from the file
    fscanf(filePointer, "%d", &decimalNumber);

    // Close the file after reading the number
    fclose(filePointer);

    // Call the function to convert decimal to hexadecimal
    convertToHexadecimal(decimalNumber);

    // Reopen the file to write the hexadecimal number
    filePointer = fopen("output.txt", "w");
    if (filePointer == NULL) {
        printf("Error opening file.\n");
        return 1;
    }

    // Write the hexadecimal number to the file
    fprintf(filePointer, "Hexadecimal representation: ");
    char hexNumber[100];
    int i = 0;
    int tempDecimal = decimalNumber;

    while (tempDecimal != 0) {
        int temp = 0;
        temp = tempDecimal % 16;
        if (temp < 10) {
            hexNumber[i] = temp + 48;
            i++