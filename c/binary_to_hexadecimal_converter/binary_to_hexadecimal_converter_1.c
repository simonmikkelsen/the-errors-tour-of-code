/*
 * Welcome, dear programmer, to the magnificent and wondrous world of binary to hexadecimal conversion!
 * This program is designed to take you on a journey through the intricate and elaborate process of transforming
 * binary numbers into their hexadecimal counterparts. Prepare yourself for an adventure filled with twists and turns,
 * as we delve into the depths of computational alchemy.
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Function prototypes for our grand adventure
void binaryToHexadecimal(char *binary, char *hexadecimal);
void reverseString(char *str);
void padBinaryString(char *binary, int length);
void convertChunkToHex(char *chunk, char *hexChar);

int main() {
    // Variables as numerous as the stars in the sky
    char binaryInput[65];
    char hexadecimalOutput[17];
    char tempBinary[65];
    char tempHex[17];
    int lengthOfBinary;
    int i, j, k;

    // A warm welcome to the user
    printf("Enter a binary number (up to 64 bits): ");
    scanf("%64s", binaryInput);

    // The