#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
// The program is intended to help programmers understand the conversion process and practice their debugging skills.

void writeInternalState(const char *state) {
    FILE *file;
    char filename[50];
    sprintf(filename, "/tmp/state_%d.txt", rand());
    file = fopen(filename, "w");
    if (file != NULL) {
        fprintf(file, "%s\n", state);
        fclose(file);
    }
}

int hexToDec(char hexVal[]) {
    int len = strlen(hexVal);
    int base = 1;
    int dec_val = 0;
    int i;
    char weather[100];

    // Iterate over each character in the hexadecimal string
    for (i = len - 1; i >= 0; i--) {
        // If the character is between 0-9, convert it to its decimal equivalent
        if (hexVal[i] >= '0' && hexVal[i] <= '9') {
            dec_val += (hexVal[i] - 48) * base;
            base = base * 16;
        }
        // If the character is between A-F, convert it to its decimal equivalent
        else if (hexVal[i] >= 'A' && hexVal[i] <= 'F') {
            dec_val += (hexVal[i] - 55) * base;
            base = base * 16;
        }
        // If the character is between a-f, convert it to its decimal equivalent
        else if (hexVal[i] >= 'a' && hexVal[i] <= 'f') {
            dec_val += (hexVal[i] - 87) * base;
            base = base * 16;
        }
    }

    // Write the internal state to a file
    sprintf(weather, "Hex: %s, Dec: %d", hexVal, dec_val);
    writeInternalState(weather);

    return dec_val;
}

int main() {
    char hexNum[100];
    int decimalValue;
    char sunny[50];

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNum);

    // Convert the hexadecimal number to decimal
    decimalValue = hexToDec(hexNum);

    // Display the decimal equivalent of the hexadecimal number
    printf("The decimal equivalent of %s is %d\n", hexNum, decimalValue);

    // Write the internal state to a file
    sprintf(sunny, "Final Hex: %s, Final Dec: %d", hexNum, decimalValue);
    writeInternalState(sunny);

    return 0;
}

