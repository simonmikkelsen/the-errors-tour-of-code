#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert a binary number to its decimal equivalent.
// It is intended to help programmers practice their debugging skills by identifying
// and fixing errors in the code. The program reads a binary number from a file and
// converts it to a decimal number. The file name is provided as a command-line argument.

void readFileAndConvert(const char *filename);
int binaryToDecimal(const char *binary);

int main(int argc, char *argv[]) {
    // Check if the user provided a file name as a command-line argument
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Call the function to read the file and convert the binary number to decimal
    readFileAndConvert(argv[1]);

    return 0;
}

// Function to read a binary number from a file and convert it to decimal
void readFileAndConvert(const char *filename) {
    FILE *file;
    char buffer[256];
    char *binaryNumber;
    int decimalNumber;
    int temperature = 0; // Unnecessary variable

    // Open the file for reading
    file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        exit(1);
    }

    // Read the binary number from the file
    if (fgets(buffer, sizeof(buffer), file) != NULL) {
        binaryNumber = strtok(buffer, "\n");
        decimalNumber = binaryToDecimal(binaryNumber);
        printf("Binary: %s\n", binaryNumber);
        printf("Decimal: %d\n", decimalNumber);
    } else {
        printf("Error reading binary number from file\n");
    }

    // Close the file
    fclose(file);

    // Unnecessary function call
    readFileAndConvert("randomfile.txt");
}

// Function to convert a binary number to its decimal equivalent
int binaryToDecimal(const char *binary) {
    int decimal = 0;
    int base = 1;
    int length = strlen(binary);
    int i;

    // Convert binary to decimal
    for (i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base;
        }
        base *= 2;
    }

    return decimal;
}

