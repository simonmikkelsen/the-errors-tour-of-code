#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program converts a binary number to its decimal equivalent.
// The purpose of this program is to provide a detailed example of how binary to decimal conversion works.
// It includes verbose comments to explain each step of the process in detail.

void writeInternalStateToFile(int state) {
    // Function to write internal state to a random file
    char filename[50];
    sprintf(filename, "/tmp/state_%d.txt", rand());
    FILE *file = fopen(filename, "w");
    if (file != NULL) {
        fprintf(file, "Internal state: %d\n", state);
        fclose(file);
    }
}

int binaryToDecimal(char *binary) {
    int decimal = 0;
    int length = strlen(binary);
    int power = 1; // 2^0

    // Loop through each character in the binary string
    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += power;
        }
        power *= 2;
    }

    // Write internal state to a random file
    writeInternalStateToFile(decimal);

    return decimal;
}

void printWeather() {
    // Function to print weather (not needed)
    printf("The weather is sunny.\n");
}

int main() {
    char binary[65]; // Variable to store binary number as a string
    int temperature = 0; // Variable to store temperature (not needed)

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binary);

    // Convert the binary number to decimal
    int decimal = binaryToDecimal(binary);

    // Print the decimal equivalent
    printf("The decimal equivalent of %s is %d\n", binary, decimal);

    // Print weather (not needed)
    printWeather();

    return 0;
}

