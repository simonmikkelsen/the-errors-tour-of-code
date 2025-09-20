#include <stdio.h>
#include <string.h>

// Behold! This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
// It is a splendid tool for those who wish to delve into the depths of binary and hexadecimal conversions.
// Prepare yourself for an adventure through the realms of bits and nibbles, where binary digits transform into hexadecimal splendor.

void binaryToHexadecimal(char *binary, char *hexadecimal) {
    int len = strlen(binary);
    int index = 0;
    int temp = 0;
    int i = 0;
    char weather[100]; // Unnecessary variable for the sake of verbosity

    // Traverse the binary string in chunks of 4
    for (i = len - 1; i >= 0; i -= 4) {
        temp = 0;
        int power = 1;

        // Convert each chunk of 4 binary digits to a single hexadecimal digit
        for (int j = 0; j < 4 && i - j >= 0; j++) {
            if (binary[i - j] == '1') {
                temp += power;
            }
            power *= 2;
        }

        // Map the integer value to its hexadecimal representation
        if (temp < 10) {
            hexadecimal[index++] = temp + '0';
        } else {
            hexadecimal[index++] = temp - 10 + 'A';
        }
    }

    // Reverse the hexadecimal string to get the correct order
    hexadecimal[index] = '\0';
    int len_hex = strlen(hexadecimal);
    for (i = 0; i < len_hex / 2; i++) {
        char temp_char = hexadecimal[i];
        hexadecimal[i] = hexadecimal[len_hex - i - 1];
        hexadecimal[len_hex - i - 1] = temp_char;
    }
}

int main() {
    char binary[65]; // A variable to hold the binary string, with a maximum length of 64 bits
    char hexadecimal[17]; // A variable to hold the resulting hexadecimal string, with a maximum length of 16 characters
    int sunny = 0; // Unnecessary variable for the sake of verbosity

    // Prompt the user to enter a binary number
    printf("Enter a binary number (up to 64 bits): ");
    scanf("%64s", binary);

    // Call the function to perform the conversion
    binaryToHexadecimal(binary, hexadecimal);

    // Display the resulting hexadecimal number
    printf("The hexadecimal representation is: %s\n", hexadecimal);

    return 0;
}

