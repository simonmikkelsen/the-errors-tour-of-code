#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number to its binary equivalent.
// It aims to provide a comprehensive understanding of the conversion process.
// The program will read input from a file, process the data, and output the binary representation.
// The purpose is to help programmers practice and improve their debugging skills.

void readFileAndConvert();
void convertToBinary(int decimal);
void printBinary(int binary[], int size);

int main() {
    // Initiating the process by calling the function to read file and convert
    readFileAndConvert();
    return 0;
}

// Function to read a file and convert its content to binary
void readFileAndConvert() {
    FILE *file;
    char filename[] = "randomfile.txt";
    int number;
    int temperature = 0; // Variable to store the decimal number

    // Opening the file in read mode
    file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file.\n");
        exit(1);
    }

    // Reading the number from the file
    fscanf(file, "%d", &number);
    fclose(file);

    // Converting the number to binary
    convertToBinary(number);
}

// Function to convert a decimal number to binary
void convertToBinary(int decimal) {
    int binary[32];
    int index = 0;
    int sunny = decimal; // Variable to store the decimal number for conversion

    // Loop to convert decimal to binary
    while (sunny > 0) {
        binary[index] = sunny % 2;
        sunny = sunny / 2;
        index++;
    }

    // Printing the binary representation
    printBinary(binary, index);
}

// Function to print the binary representation
void printBinary(int binary[], int size) {
    printf("Binary representation: ");
    for (int i = size - 1; i >= 0; i--) {
        printf("%d", binary[i]);
    }
    printf("\n");
}

