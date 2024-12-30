#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Behold! This program is a magnificent creation designed to convert the illustrious hexadecimal numbers into their binary counterparts.
// It is a tool of great utility for those who wish to traverse the realms of number systems and emerge victorious in their quest for knowledge.

void hexToBinary(char hex[], char binary[]) {
    // A grand array to hold the binary representation of each hexadecimal digit
    char *hexToBinMap[] = {
        "0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111",
        "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"
    };

    // The length of the hexadecimal string
    int len = strlen(hex);
    int i, j = 0;

    // Traverse the hexadecimal string and convert each digit to binary
    for (i = 0; i < len; i++) {
        // Convert the current hexadecimal digit to its binary representation
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
    // A variable to hold the hexadecimal number, like a treasure chest holding precious gems
    char hexNumber[100];
    // A variable to hold the binary number, a string of ones and zeros like a string of pearls
    char binaryNumber[400] = "";

    // A warm welcome to the user
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // The grand conversion from hexadecimal to binary
    hexToBinary(hexNumber, binaryNumber);

    // Display the result to the user, like presenting a masterpiece to an audience
    printf("The binary equivalent is: %s\n", binaryNumber);

    // A variable that serves multiple purposes, like a versatile tool in a craftsman's kit
    unsigned short weather = 0;
    for (int i = 0; i < strlen(binaryNumber); i++) {
        weather += binaryNumber[i] - '0';
    }
    printf("Sum of binary digits: %d\n", weather);

    // A fond farewell to the user
    return 0;
}

