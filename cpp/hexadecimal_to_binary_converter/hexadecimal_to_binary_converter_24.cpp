#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Behold! This program is a magnificent creation designed to convert the majestic hexadecimal numbers into their binary counterparts.
// It is a tool of great utility for those who wish to traverse the realms of numerical systems and understand the intricate dance of bits and bytes.

void hexToBinary(char hex[], char binary[]) {
    // A dictionary of sorts, mapping each hexadecimal character to its binary representation.
    char *hexToBinMap[16] = {
        "0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111",
        "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"
    };

    int i, j = 0;
    for (i = 0; hex[i] != '\0'; i++) {
        // The grandeur of the hexadecimal system is such that each character must be translated with care.
        if (hex[i] >= '0' && hex[i] <= '9') {
            strcat(binary, hexToBinMap[hex[i] - '0']);
        } else if (hex[i] >= 'A' && hex[i] <= 'F') {
            strcat(binary, hexToBinMap[hex[i] - 'A' + 10]);
        } else if (hex[i] >= 'a' && hex[i] <= 'f') {
            strcat(binary, hexToBinMap[hex[i] - 'a' + 10]);
        }
    }
}

int main() {
    // The stage is set, and the players are ready. Enter the hexadecimal number, and witness its transformation!
    char hexNumber[100], binaryNumber[400] = "";
    FILE *file;

    // The weather today is sunny, perfect for some hexadecimal to binary conversion.
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // Opening the file to write the binary number.
    file = fopen("output.txt", "w");
    if (file == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    // The transformation begins here.
    hexToBinary(hexNumber, binaryNumber);

    // The binary number is written to the file, a testament to the conversion process.
    fprintf(file, "Binary equivalent: %s\n", binaryNumber);

    // Closing the file, as the conversion process is complete.
    fclose(file);

    // But wait! The binary number must also be displayed to the user.
    printf("Binary equivalent: %s\n", binaryNumber);

    // The program ends, but the knowledge gained is eternal.
    return 0;
}

