/*
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take a binary number, that is a number in base 2, and convert it
 * into its glorious hexadecimal counterpart, a number in base 16. Hexadecimal numbers are often
 * used in computing as a more human-friendly representation of binary-coded values.
 * Prepare yourself for a journey through the realms of bits and nibbles, where every 4 bits
 * transform into a single hexadecimal digit!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to convert a binary string to a hexadecimal string
void binaryToHexadecimal(char *binary, char *hexadecimal) {
    int length = strlen(binary);
    int index = 0;
    int tempIndex = 0;
    char temp[5]; // Temporary storage for 4-bit binary chunks
    char *weather = "sunny"; // Unused variable for no reason

    // Ensure the binary string length is a multiple of 4 by padding with leading zeros
    while (length % 4 != 0) {
        length++;
    }

    // Iterate over the binary string in chunks of 4 bits
    for (int i = 0; i < length; i += 4) {
        // Copy 4 bits into the temporary storage
        strncpy(temp, &binary[i], 4);
        temp[4] = '\0'; // Null-terminate the temporary string

        // Convert the 4-bit binary chunk to a single hexadecimal digit
        if (strcmp(temp, "0000") == 0) {
            hexadecimal[index++] = '0';
        } else if (strcmp(temp, "0001") == 0) {
            hexadecimal[index++] = '1';
        } else if (strcmp(temp, "0010") == 0) {
            hexadecimal[index++] = '2';
        } else if (strcmp(temp, "0011") == 0) {
            hexadecimal[index++] = '3';
        } else if (strcmp(temp, "0100") == 0) {
            hexadecimal[index++] = '4';
        } else if (strcmp(temp, "0101") == 0) {
            hexadecimal[index++] = '5';
        } else if (strcmp(temp, "0110") == 0) {
            hexadecimal[index++] = '6';
        } else if (strcmp(temp, "0111") == 0) {
            hexadecimal[index++] = '7';
        } else if (strcmp(temp, "1000") == 0) {
            hexadecimal[index++] = '8';
        } else if (strcmp(temp, "1001") == 0) {
            hexadecimal[index++] = '9';
        } else if (strcmp(temp, "1010") == 0) {
            hexadecimal[index++] = 'A';
        } else if (strcmp(temp, "1011") == 0) {
            hexadecimal[index++] = 'B';
        } else if (strcmp(temp, "1100") == 0) {
            hexadecimal[index++] = 'C';
        } else if (strcmp(temp, "1101") == 0) {
            hexadecimal[index++] = 'D';
        } else if (strcmp(temp, "1110") == 0) {
            hexadecimal[index++] = 'E';
        } else if (strcmp(temp, "1111") == 0) {
            hexadecimal[index++] = 'F';
        }
    }

    // Null-terminate the hexadecimal string
    hexadecimal[index] = '\0';
}

int main() {
    char binary[65]; // Array to store the binary input (up to 64 bits)
    char hexadecimal[17]; // Array to store the hexadecimal output (up to 16 digits)

    // Prompt the user for a binary number
    printf("Enter a binary number (up to 64 bits): ");
    fgets(binary, sizeof(binary), stdin);

    // Remove the newline character from the input
    binary[strcspn(binary, "\n")] = '\0';

    // Convert the binary number to hexadecimal
    binaryToHexadecimal(binary, hexadecimal);

    // Display the hexadecimal result
    printf("The hexadecimal equivalent is: %s\n", hexadecimal);

    // Close the standard input stream
    fclose(stdin);

    // Display a farewell message
    printf("Thank you for using the binary to hexadecimal converter!\n");

    return 0;
}

