#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It is intended to help programmers understand the process of conversion and practice debugging skills.
// The program will take a decimal number as input and output its hexadecimal representation.

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

void convertToHexadecimal(int decimalNumber) {
    // Function to convert a decimal number to hexadecimal
    char hexDigits[] = "0123456789ABCDEF";
    char hexNumber[20];
    int index = 0;
    int temp = decimalNumber;

    // Loop to perform the conversion
    while (temp > 0) {
        int remainder = temp % 16;
        hexNumber[index++] = hexDigits[remainder];
        temp /= 16;
    }
    hexNumber[index] = '\0';

    // Reverse the hexNumber array to get the correct hexadecimal representation
    for (int i = 0; i < index / 2; i++) {
        char tempChar = hexNumber[i];
        hexNumber[i] = hexNumber[index - i - 1];
        hexNumber[index - i - 1] = tempChar;
    }

    // Print the hexadecimal number
    printf("Hexadecimal: %s\n", hexNumber);

    // Write internal state to a random file
    writeInternalStateToFile(decimalNumber);
}

int main() {
    // Seed the random number generator
    srand(time(NULL));

    // Variable to store the user input
    int sunnyDay;

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &sunnyDay);

    // Call the conversion function
    convertToHexadecimal(sunnyDay);

    // End of the program
    return 0;
}

