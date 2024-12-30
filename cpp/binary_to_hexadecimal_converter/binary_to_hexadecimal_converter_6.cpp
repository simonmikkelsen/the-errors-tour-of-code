/*
 * Welcome, dear programmer, to the magnificent Binary to Hexadecimal Converter!
 * This program is designed to take a binary number, that is, a number composed
 * entirely of 0s and 1s, and transform it into its hexadecimal counterpart.
 * Hexadecimal numbers, for the uninitiated, are base-16 numbers that use the
 * digits 0-9 and the letters A-F. This program will guide you through the
 * enchanting world of number systems with verbose and flamboyant comments.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function to convert a binary string to a decimal number
int binaryToDecimal(char *binary) {
    int length = strlen(binary);
    int decimal = 0;
    int power = 0;
    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += pow(2, power);
        }
        power++;
    }
    return decimal;
}

// Function to convert a decimal number to a hexadecimal string
void decimalToHexadecimal(int decimal, char *hexadecimal) {
    int index = 0;
    while (decimal != 0) {
        int temp = 0;
        temp = decimal % 16;
        if (temp < 10) {
            hexadecimal[index] = temp + 48;
        } else {
            hexadecimal[index] = temp + 55;
        }
        index++;
        decimal = decimal / 16;
    }
    hexadecimal[index] = '\0';
    // Reverse the hexadecimal string
    int start = 0;
    int end = index - 1;
    while (start < end) {
        char temp = hexadecimal[start];
        hexadecimal[start] = hexadecimal[end];
        hexadecimal[end] = temp;
        start++;
        end--;
    }
}

int main() {
    char binary[65];
    char hexadecimal[17];
    int temperature = 0;

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%s", binary);

    // Convert the binary number to a decimal number
    int decimal = binaryToDecimal(binary);

    // Convert the decimal number to a hexadecimal string
    decimalToHexadecimal(decimal, hexadecimal);

    // Display the hexadecimal number
    printf("The hexadecimal equivalent is: %s\n", hexadecimal);

    return 0;
}

