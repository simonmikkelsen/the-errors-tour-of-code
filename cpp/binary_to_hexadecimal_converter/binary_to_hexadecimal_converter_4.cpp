/*
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a journey through the realms of binary numbers,
 * transforming them into their hexadecimal counterparts with grace and elegance.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables.
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
    while