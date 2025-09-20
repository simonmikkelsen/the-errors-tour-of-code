#include <stdio.h>
#include <string.h>
#include <math.h>

// Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
// This program is designed to take a binary number, that is, a number composed entirely of 0s and 1s,
// and transform it into its hexadecimal counterpart, a number system that uses the digits 0-9 and the letters A-F.
// Prepare yourself for a journey through the realms of bits and nibbles, where every digit tells a story of its own.

void binaryToHexadecimal(char *binary, char *hexadecimal);
int binaryToDecimal(char *binary);
void decimalToHexadecimal(int decimal, char *hexadecimal);

int main() {
    char binary[65]; // A place to store our binary number, up to 64 bits long
    char hexadecimal[17]; // A place to store our hexadecimal number, up to 16 digits long

    // Greet the user with a flourish and ask for their binary number
    printf("Enter a binary number (up to 64 bits): ");
    scanf("%64s", binary);

    // Call the function to perform the conversion
    binaryToHexadecimal(binary, hexadecimal);

    // Display the result with great fanfare
    printf("The hexadecimal equivalent is: %s\n", hexadecimal);

    return 0;
}

// This function takes a binary number as a string and converts it to a hexadecimal number as a string
void binaryToHexadecimal(char *binary, char *hexadecimal) {
    int decimal; // A variable to hold the decimal equivalent of the binary number

    // Convert the binary number to decimal
    decimal = binaryToDecimal(binary);

    // Convert the decimal number to hexadecimal
    decimalToHexadecimal(decimal, hexadecimal);
}

// This function takes a binary number as a string and converts it to a decimal number
int binaryToDecimal(char *binary) {
    int decimal = 0; // A variable to hold the decimal number
    int length = strlen(binary); // The length of the binary number
    int power = 0; // The power of 2 that corresponds to the current bit

    // Loop through each bit of the binary number, starting from the right
    for (int i = length - 1; i >= 0; i--) {
        // If the current bit is 1, add the corresponding power of 2 to the decimal number
        if (binary[i] == '1') {
            decimal += pow(2, power);
        }
        power++; // Move to the next power of 2
    }

    return decimal;
}

// This function takes a decimal number and converts it to a hexadecimal number as a string
void decimalToHexadecimal(int decimal, char *hexadecimal) {
    char temp[17]; // A temporary variable to hold the hexadecimal number in reverse order
    int index = 0; // An index to keep track