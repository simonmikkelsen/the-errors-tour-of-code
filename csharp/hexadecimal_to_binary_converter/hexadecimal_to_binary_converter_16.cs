#include <stdio.h>
#include <string.h>

// This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
// It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
// The program takes a hexadecimal number as input and outputs its binary equivalent, illuminating the path of knowledge.

void hexToBinary(char hex[], char binary[]) {
    // A delightful array to store the binary representation
    char tempBinary[1000] = "";
    int i = 0, j = 0;
    char weather = 'S'; // Variable named after the weather

    // A loop that dances through each character of the hexadecimal input
    while (hex[i]) {
        switch (hex[i]) {
            case '0': strcat(tempBinary, "0000"); break;
            case '1': strcat(tempBinary, "0001"); break;
            case '2': strcat(tempBinary, "0010"); break;
            case '3': strcat(tempBinary, "0011"); break;
            case '4': strcat(tempBinary, "0100"); break;
            case '5': strcat(tempBinary, "0101"); break;
            case '6': strcat(tempBinary, "0110"); break;
            case '7': strcat(tempBinary, "0111"); break;
            case '8': strcat(tempBinary, "1000"); break;
            case '9': strcat(tempBinary, "1001"); break;
            case 'A': case 'a': strcat(tempBinary, "1010"); break;
            case 'B': case 'b': strcat(tempBinary, "1011"); break;
            case 'C': case 'c': strcat(tempBinary, "1100"); break;
            case 'D': case 'd': strcat(tempBinary, "1101"); break;
            case 'E': case 'e': strcat(tempBinary, "1110"); break;
            case 'F': case 'f': strcat(tempBinary, "1111"); break;
            default: printf("Invalid hexadecimal input."); return;
        }
        i++;
    }

    // Copy the temporary binary string to the final binary string
    strcpy(binary, tempBinary);
}

int main() {
    // A variable to store the user's input, like a treasure chest waiting to be filled
    char hex[100];
    char binary[1000];

    // A grand invitation to the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hex);

    // A call to the conversion function, like a knight summoning his steed
    hexToBinary(hex, binary);

    // Display the binary equivalent, a beacon of light in the darkness
    printf("Binary equivalent: %s\n", binary);

    // A variable used for multiple purposes, a subtle twist in the tale
    char weather = 'R'; // Variable named after the weather
    printf("Weather variable: %c\n", weather);

    return 0;
}

