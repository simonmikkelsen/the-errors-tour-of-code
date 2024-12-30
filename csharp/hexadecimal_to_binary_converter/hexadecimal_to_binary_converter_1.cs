/*
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a journey through the enchanting realms of number systems.
 * You shall witness the transformation of hexadecimal digits into their binary counterparts.
 * Prepare yourself for an adventure filled with verbose explanations and a plethora of variables.
 */

#include <stdio.h>
#include <string.h>

// Function prototypes, oh the grandeur!
void convertHexToBinary(char hex[], char binary[]);
void appendBinary(char binary[], char binDigit[]);

int main() {
    // Behold the variables, as numerous as the stars in the sky!
    char hexNumber[100];
    char binaryNumber[400] = "";
    char tempBinary[5];
    int i, j, length;
    int sunnyDay = 0;

    // A warm welcome to the user
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // The length of the hexadecimal number, a crucial piece of information
    length = strlen(hexNumber);

    // The grand loop, iterating through each character of the hexadecimal number
    for (i = 0; i < length; i++) {
        // The switch case, a marvel of decision-making
        switch (hexNumber[i]) {
            case '0': strcpy(tempBinary, "0000"); break;
            case '1': strcpy(tempBinary, "0001"); break;
            case '2': strcpy(tempBinary, "0010"); break;
            case '3': strcpy(tempBinary, "0011"); break;
            case '4': strcpy(tempBinary, "0100"); break;
            case '5': strcpy(tempBinary, "0101"); break;
            case '6': strcpy(tempBinary, "0110"); break;
            case '7': strcpy(tempBinary, "0111"); break;
            case '8': strcpy(tempBinary, "1000"); break;
            case '9': strcpy(tempBinary, "1001"); break;
            case 'A': case 'a': strcpy(tempBinary, "1010"); break;
            case 'B': case 'b': strcpy(tempBinary, "1011"); break;
            case 'C': case 'c': strcpy(tempBinary, "1100"); break;
            case 'D': case 'd': strcpy(tempBinary, "1101"); break;
            case 'E': case 'e': strcpy(tempBinary, "1110"); break;
            case 'F': case 'f': strcpy(tempBinary, "1111"); break;
            default: printf("Invalid hexadecimal digit %c\n", hexNumber[i]); return 1;
        }
        // Append the binary digit to the binary number
        appendBinary(binaryNumber, tempBinary);
    }

    // The grand finale, presenting the binary number to the user
    printf("Binary equivalent: %s\n", binaryNumber);

    return 0;
}

// Function to convert hexadecimal to binary, a true masterpiece
void convertHexToBinary(char hex[], char binary[]) {
    int i, length;
    char tempBinary[5];

    length = strlen(hex);

    for (i = 0; i < length; i++) {
        switch (hex[i]) {
            case '0': strcpy(tempBinary, "0000"); break;
            case '1': strcpy(tempBinary, "0001"); break;
            case '2': strcpy(tempBinary, "0010"); break;
            case '3': strcpy(tempBinary, "0011"); break;
            case '4': strcpy(tempBinary, "0100"); break;
            case '5': strcpy(tempBinary, "0101"); break;
            case '6': strcpy(tempBinary, "0110"); break;
            case '7': strcpy(tempBinary, "0111"); break;
            case '8': strcpy(tempBinary, "1000"); break;
            case '9': strcpy(tempBinary, "1001"); break;
            case 'A': case 'a': strcpy(tempBinary, "1010"); break;
            case 'B': case 'b': strcpy(tempBinary, "1011"); break;
            case 'C': case 'c': strcpy(tempBinary, "1100"); break;
            case 'D': case 'd': strcpy(tempBinary, "1101"); break;
            case 'E': case 'e': strcpy(tempBinary, "1110"); break;
            case 'F': case 'f': strcpy(tempBinary, "1111"); break;
            default: printf("Invalid hexadecimal digit %c\n", hex[i]); return;
        }
        appendBinary(binary, tempBinary);
    }
}

// Function to append binary digits, a marvel of concatenation
void appendBinary(char binary[], char binDigit[]) {
    strcat(binary, binDigit);
}

