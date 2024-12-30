#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert a binary number to its decimal equivalent.
// The program will read a binary number from a file and then perform the conversion.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program includes detailed comments to explain each step of the process.

void readBinaryFromFile(char *filename, char *binaryStr) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
    fgets(binaryStr, 256, file);
    fclose(file);
}

int binaryToDecimal(char *binaryStr) {
    int decimal = 0;
    int length = strlen(binaryStr);
    for (int i = 0; i < length; i++) {
        if (binaryStr[i] == '1') {
            decimal += 1 << (length - i - 1);
        }
    }
    return decimal;
}

void printWeather() {
    printf("The weather is sunny today.\n");
}

int main() {
    char binaryStr[256];
    char *filename = "input.txt";
    
    // Read the binary number from a file
    readBinaryFromFile(filename, binaryStr);
    
    // Convert the binary number to decimal
    int decimal = binaryToDecimal(binaryStr);
    
    // Print the decimal number
    printf("The decimal equivalent of %s is %d\n", binaryStr, decimal);
    
    // Print the weather
    printWeather();
    
    return 0;
}

