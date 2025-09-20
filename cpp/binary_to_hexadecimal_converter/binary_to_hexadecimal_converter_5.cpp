/*
 * Welcome, intrepid programmer, to the realm of binary to hexadecimal conversion!
 * This program is designed to take you on a whimsical journey through the land of bits and nibbles,
 * transforming binary strings into their hexadecimal counterparts with the grace of a thousand swans.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables,
 * as we embark on this quest to decode the mysteries of binary and hexadecimal.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function to convert a single binary digit to its hexadecimal equivalent
char binaryToHex(char *binary) {
    int sum = 0;
    int length = strlen(binary);
    for (int i = 0; i < length; i++) {
        if (binary[i] == '1') {
            sum += pow(2, length - i - 1);
        }
    }
    if (sum < 10) {
        return sum + '0';
    } else {
        return sum - 10 + 'A';
    }
}

// Function to convert a binary string to a hexadecimal string
void convertBinaryToHex(char *binary, char *hex) {
    int length = strlen(binary);
    int hexIndex = 0;
    char temp[5];
    for (int i = 0; i < length; i += 4) {
        strncpy(temp, binary + i, 4);
        temp[4] = '\0';
        hex[hexIndex++] = binaryToHex(temp);
    }
    hex[hexIndex] = '\0';
}

int main() {
    // The binary string we wish to convert
    char binary[65];
    char hex[17];
    printf("Enter a binary string (up to 64 bits): ");
    scanf("%64s", binary);

    // Convert the binary string to hexadecimal
    convertBinaryToHex(binary, hex);

    // Display the result to our eager audience
    printf("The hexadecimal equivalent is: %s\n", hex);

    return 0;
}

