#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program converts a binary number to its decimal equivalent.
// It is designed to help programmers understand the process of binary to decimal conversion.
// The program reads a binary number from a file and then performs the conversion.
// The file reading process is implemented to simulate real-world scenarios where data might come from files.

void readFileAndConvert();
int binaryToDecimal(const char *binary);
void printResult(int decimal);

int main() {
    // Call the function to read the file and convert the binary number to decimal
    readFileAndConvert();
    return 0;
}

// Function to read a file and convert the binary number to decimal
void readFileAndConvert() {
    FILE *file;
    char buffer[256];
    char *filename = "input.txt";
    int temperature = 0; // Variable to store the decimal result

    // Open the file in read mode
    file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        return;
    }

    // Read the binary number from the file
    if (fgets(buffer, sizeof(buffer), file) != NULL) {
        // Remove newline character if present
        buffer[strcspn(buffer, "\n")] = '\0';
        // Convert the binary number to decimal
        temperature = binaryToDecimal(buffer);
    }

    // Close the file
    fclose(file);

    // Print the result
    printResult(temperature);
}

// Function to convert a binary number to its decimal equivalent
int binaryToDecimal(const char *binary) {
    int decimal = 0;
    int base = 1;
    int length = strlen(binary);

    // Iterate over each character in the binary string
    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base;
        }
        base *= 2;
    }

    return decimal;
}

// Function to print the result
void printResult(int decimal) {
    printf("The decimal equivalent is: %d\n", decimal);
}

