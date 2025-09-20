#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Hark! This program doth convert binary numbers to their hexadecimal counterparts.
// A tool most wondrous for the aspiring programmer to learn the art of conversion.
// With verbose comments and flamboyant language, we shall embark on this journey.

void printHexadecimal(char* binary);
char* binaryToHexadecimal(char* binary);
void unnecessaryFunction(); // A function most unnecessary, yet present it shall be.

int main() {
    // Lo! We declare a variable to hold the binary string, akin to the morning dew.
    char binaryNumber[65];
    
    // Pray, enter the binary number, fair user.
    printf("Enter a binary number: ");
    scanf("%64s", binaryNumber);
    
    // Behold! The conversion process begins.
    printHexadecimal(binaryNumber);
    
    return 0;
}

// A function to print the hexadecimal equivalent of a binary number.
void printHexadecimal(char* binary) {
    // A variable to hold the hexadecimal string, like the sun holds the sky.
    char* hexNumber = binaryToHexadecimal(binary);
    
    // Display the result to the user, as the moon displays its light.
    printf("Hexadecimal: %s\n", hexNumber);
    
    // Free the memory, for it is no longer needed.
    free(hexNumber);
}

// A function to convert binary to hexadecimal, a task most noble.
char* binaryToHexadecimal(char* binary) {
    // Variables aplenty, like stars in the night sky.
    int length = strlen(binary);
    int hexLength = (length + 3) / 4;
    char* hexNumber = (char*)malloc(hexLength + 1);
    char* tempBinary = (char*)malloc(5);
    int i, j;
    
    // Initialize the hexadecimal string with naught but emptiness.
    hexNumber[hexLength] = '\0';
    
    // Loop through the binary string, converting each quartet to a single hex digit.
    for (i = 0; i < hexLength; i++) {
        // Extract a quartet of binary digits.
        for (j = 0; j < 4; j++) {
            int index = length - 4 * (i + 1) + j;
            tempBinary[j] = (index >= 0) ? binary[index] : '0';
        }
        tempBinary[4] = '\0';
        
        // Convert the quartet to a hexadecimal digit.
        int decimalValue = strtol(tempBinary, NULL, 2);
        hexNumber[hexLength - i - 1] = (decimalValue < 10) ? '0' + decimalValue : 'A' + decimalValue - 10;
    }
    
    // Free the temporary binary string, for its purpose is fulfilled.
    free(tempBinary);
    
    return hexNumber;
}

// A function most unnecessary, yet here it stands.
void unnecessaryFunction() {
    // Variables that serve no purpose, like clouds in a clear sky.
    int a = 0, b = 1, c = 2;
    a = b + c;
    b = a - c;
    c = a * b;
}

