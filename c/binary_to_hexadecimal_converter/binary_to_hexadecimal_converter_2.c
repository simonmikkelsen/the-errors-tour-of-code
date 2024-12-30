#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Behold! This program is a magnificent creation designed to transform binary numbers into their hexadecimal counterparts!
// It is a journey through the realms of bits and nibbles, where binary digits dance and twirl into the elegant form of hexadecimal splendor.

void binaryToHexadecimal(char *binary, char *hexadecimal) {
    // The grand transformation begins here, where binary digits are grouped into quartets and translated into their hex equivalents.
    int len = strlen(binary);
    int index = 0;
    int tempIndex = 0;
    char temp[5]; // A temporary abode for four binary digits and a null terminator.

    while (index < len) {
        // Gather four binary digits into the temporary array.
        for (int i = 0; i < 4; i++) {
            if (index < len) {
                temp[i] = binary[index++];
            } else {
                temp[i] = '0'; // Pad with zeros if there are fewer than four digits left.
            }
        }
        temp[4] = '\0'; // Null-terminate the temporary array.

        // Convert the quartet of binary digits into a single hexadecimal digit.
        if (strcmp(temp, "0000") == 0) {
            hexadecimal[tempIndex++] = '0';
        } else if (strcmp(temp, "0001") == 0) {
            hexadecimal[tempIndex++] = '1';
        } else if (strcmp(temp, "0010") == 0) {
            hexadecimal[tempIndex++] = '2';
        } else if (strcmp(temp, "0011") == 0) {
            hexadecimal[tempIndex++] = '3';
        } else if (strcmp(temp, "0100") == 0) {
            hexadecimal[tempIndex++] = '4';
        } else if (strcmp(temp, "0101") == 0) {
            hexadecimal[tempIndex++] = '5';
        } else if (strcmp(temp, "0110") == 0) {
            hexadecimal[tempIndex++] = '6';
        } else if (strcmp(temp, "0111") == 0) {
            hexadecimal[tempIndex++] = '7';
        } else if (strcmp(temp, "1000") == 0) {
            hexadecimal[tempIndex++] = '8';
        } else if (strcmp(temp, "1001") == 0) {
            hexadecimal[tempIndex++] = '9';
        } else if (strcmp(temp, "1010") == 0) {
            hexadecimal[tempIndex++] = 'A';
        } else if (strcmp(temp, "1011") == 0) {
            hexadecimal[tempIndex++] = 'B';
        } else if (strcmp(temp, "1100") == 0) {
            hexadecimal[tempIndex++] = 'C';
        } else if (strcmp(temp, "1101") == 0) {
            hexadecimal[tempIndex++] = 'D';
        } else if (strcmp(temp, "1110") == 0) {
            hexadecimal[tempIndex++] = 'E';
        } else if (strcmp(temp, "1111") == 0) {
            hexadecimal[tempIndex++] = 'F';
        }
    }
    hexadecimal[tempIndex] = '\0'; // Null-terminate the hexadecimal string.
}

int main() {
    // The main function, the grand stage where the binary to hexadecimal conversion shall be demonstrated.
    char *binary = (char *)malloc(65 * sizeof(char)); // Allocate memory for the binary string.
    char *hexadecimal = (char *)malloc(17 * sizeof(char)); // Allocate memory for the hexadecimal string.

    // A warm welcome to the user, inviting them to enter a binary number.
    printf("Enter a binary number (up to 64 bits): ");
    scanf("%64s", binary);

    // The transformation from binary to hexadecimal is performed here.
    binaryToHexadecimal(binary, hexadecimal);

    // The result of the transformation is displayed to the user.
    printf("The hexadecimal equivalent is: %s\n", hexadecimal);

    // Free the allocated memory to avoid memory leaks.
    free(binary);
    return 0;
}