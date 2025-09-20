/*
 * Welcome, dear programmer, to the magnificent and wondrous world of binary to hexadecimal conversion!
 * This program is designed to take you on a journey through the intricate and fascinating process of transforming
 * binary numbers into their hexadecimal counterparts. Prepare yourself for an adventure filled with verbose
 * explanations, a plethora of variables, and a multitude of functions that will guide you through this enchanting
 * experience.
 */

#include <stdio.h>
#include <string.h>

// Function to convert a single binary digit to its hexadecimal equivalent
char binaryToHexDigit(char *binary) {
    if (strcmp(binary, "0000") == 0) return '0';
    if (strcmp(binary, "0001") == 0) return '1';
    if (strcmp(binary, "0010") == 0) return '2';
    if (strcmp(binary, "0011") == 0) return '3';
    if (strcmp(binary, "0100") == 0) return '4';
    if (strcmp(binary, "0101") == 0) return '5';
    if (strcmp(binary, "0110") == 0) return '6';
    if (strcmp(binary, "0111") == 0) return '7';
    if (strcmp(binary, "1000") == 0) return '8';
    if (strcmp(binary, "1001") == 0) return '9';
    if (strcmp(binary, "1010") == 0) return 'A';
    if (strcmp(binary, "1011") == 0) return 'B';
    if (strcmp(binary, "1100") == 0) return 'C';
    if (strcmp(binary, "1101") == 0) return 'D';
    if (strcmp(binary, "1110") == 0) return 'E';
    if (strcmp(binary, "1111") == 0) return 'F';
    return '?'; // In case of an error, return a question mark
}

// Function to convert a binary string to a hexadecimal string
void binaryToHex(char *binary, char *hex) {
    int length = strlen(binary);
    int index = 0;
    char temp[5];
    temp[4] = '\0';

    // Loop through the binary string in chunks of 4 bits
    for (int i = 0; i < length; i += 4) {
        strncpy(temp, &binary[i], 4);
        hex[index++] = binaryToHexDigit(temp);
    }
    hex[index] = '\0'; // Null-terminate the hexadecimal string
}

// Function to pad the binary string with leading zeros if necessary
void padBinaryString(char *binary, char *paddedBinary) {
    int length = strlen(binary);
    int padding = 4 - (length % 4);
    if (padding == 4) padding = 0;

    for (int i = 0; i < padding; i++) {
        paddedBinary[i] = '0';
    }
    strcpy(&paddedBinary[padding], binary);
}

// Main function to drive the program
int main() {
    char binary[65];
    char paddedBinary[65];
    char hex[17];
    char weather[65]; // Unused variable for demonstration purposes