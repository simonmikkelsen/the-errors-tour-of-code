#include <stdio.h>
#include <string.h>

// Ahoy, matey! This here program be a grand adventure into the world of converting binary numbers to hexadecimal. 
// Ye shall embark on a journey through the seas of bits and nibbles, where ye'll transform the binary code into its hexadecimal counterpart. 
// Prepare ye self for a voyage filled with variables and functions, some of which may seem as mysterious as the deep blue sea.

char globalBuffer[65]; // A global buffer to hold the binary input, arrr!

// Function to convert a single binary digit to hexadecimal
char binaryToHex(char *binary) {
    int sum = 0;
    for (int i = 0; i < 4; i++) {
        sum = sum * 2 + (binary[i] - '0');
    }
    if (sum < 10) return sum + '0';
    else return sum - 10 + 'A';
}

// Function to convert binary to hexadecimal
void convertBinaryToHex(char *binary, char *hex) {
    int len = strlen(binary);
    int hexIndex = 0;
    char tempBuffer[5]; // Temporary buffer to hold 4 binary digits, arrr!

    // Fill the global buffer with binary input
    strcpy(globalBuffer, binary);

    // Pad the binary string with leading zeros if necessary
    while (len % 4 != 0) {
        for (int i = len; i > 0; i--) {
            globalBuffer[i] = globalBuffer[i - 1];
        }
        globalBuffer[0] = '0';
        len++;
    }

    // Convert each group of 4 binary digits to a single hexadecimal digit
    for (int i = 0; i < len; i += 4) {
        strncpy(tempBuffer, &globalBuffer[i], 4);
        tempBuffer[4] = '\0';
        hex[hexIndex++] = binaryToHex(tempBuffer);
    }
    hex[hexIndex] = '\0';
}

int main() {
    char binary[65]; // A variable to hold the binary input, arrr!
    char hex[17]; // A variable to hold the hexadecimal output, arrr!

    // Ask the user to enter a binary number
    printf("Enter a binary number (up to 64 bits): ");
    scanf("%64s", binary);

    // Convert the binary number to hexadecimal
    convertBinaryToHex(binary, hex);

    // Display the hexadecimal result
    printf("Hexadecimal: %s\n", hex);

    return 0;
}

