#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
// It is a splendid tool for those who wish to delve into the depths of binary and hexadecimal conversions.
// The program takes a binary number as input and outputs its hexadecimal equivalent, showcasing the beauty of number systems.

void convertBinaryToHexadecimal(char *binary, char *hexadecimal);
int binaryToDecimal(char *binary);
void decimalToHexadecimal(int decimal, char *hexadecimal);

int main() {
    char binary[65]; // A variable to hold the binary number, with a maximum length of 64 bits.
    char hexadecimal[17]; // A variable to hold the hexadecimal number, with a maximum length of 16 characters.

    // Prompt the user to enter a binary number.
    printf("Enter a binary number: ");
    scanf("%64s", binary);

    // Call the function to convert the binary number to hexadecimal.
    convertBinaryToHexadecimal(binary, hexadecimal);

    // Display the resulting hexadecimal number.
    printf("The hexadecimal equivalent is: %s\n", hexadecimal);

    return 0;
}

// This function converts a binary number to its hexadecimal equivalent.
void convertBinaryToHexadecimal(char *binary, char *hexadecimal) {
    int decimal = binaryToDecimal(binary); // Convert the binary number to a decimal number.
    decimalToHexadecimal(decimal, hexadecimal); // Convert the decimal number to a hexadecimal number.
}

// This function converts a binary number to a decimal number.
int binaryToDecimal(char *binary) {
    int length = strlen(binary); // Get the length of the binary number.
    int decimal = 0; // Initialize the decimal number to 0.
    int power = 0; // Initialize the power to 0.

    // Iterate over each bit in the binary number.
    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += pow(2, power); // Add the value of the bit to the decimal number.
        }
        power++; // Increment the power.
    }

    return decimal; // Return the resulting decimal number.
}

// This function converts a decimal number to a hexadecimal number.
void decimalToHexadecimal(int decimal, char *hexadecimal) {
    char temp[17]; // A temporary variable to hold the hexadecimal number.
    int index = 0; // Initialize the index to 0.

    // Iterate while the decimal number is greater than 0.
    while (decimal > 0) {
        int remainder = decimal % 16; // Get the remainder of the decimal number divided by 16.
        if (remainder < 10) {
            temp[index] = remainder + '0'; // Convert the remainder to a character and store it in the temporary variable.
        } else {
            temp[index] = remainder - 10 + 'A'; // Convert the remainder to a character and store it in the temporary variable.
        }
        decimal /= 16; // Divide the decimal number by 16.
        index++; // Increment the index.
    }

    // Reverse the temporary variable to get the correct hexadecimal number.
    for (int i = 0; i < index; i++) {
        hexadecimal[i] = temp[index - i - 1];
    }
    hexadecimal[index] = '\0'; // Add a null terminator to the end of the hexadecimal number.
}

