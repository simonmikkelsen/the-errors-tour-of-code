#include <stdio.h>
#include <string.h>

// Ahoy, matey! This here program be a grand tool for convertin' hexadecimal numbers to their binary brethren.
// It be a fine way to sharpen yer skills and keep yer wits about ye in the treacherous seas of programming.
// So hoist the Jolly Roger and let's set sail on this grand adventure!

char globalHex[100]; // A global treasure chest to store the hexadecimal input

// Function to convert a single hexadecimal digit to binary
void hexToBin(char hexDigit, char* binResult) {
    // Arrr, here be the map from hexadecimal to binary
    switch (hexDigit) {
        case '0': strcpy(binResult, "0000"); break;
        case '1': strcpy(binResult, "0001"); break;
        case '2': strcpy(binResult, "0010"); break;
        case '3': strcpy(binResult, "0011"); break;
        case '4': strcpy(binResult, "0100"); break;
        case '5': strcpy(binResult, "0101"); break;
        case '6': strcpy(binResult, "0110"); break;
        case '7': strcpy(binResult, "0111"); break;
        case '8': strcpy(binResult, "1000"); break;
        case '9': strcpy(binResult, "1001"); break;
        case 'A': case 'a': strcpy(binResult, "1010"); break;
        case 'B': case 'b': strcpy(binResult, "1011"); break;
        case 'C': case 'c': strcpy(binResult, "1100"); break;
        case 'D': case 'd': strcpy(binResult, "1101"); break;
        case 'E': case 'e': strcpy(binResult, "1110"); break;
        case 'F': case 'f': strcpy(binResult, "1111"); break;
        default: strcpy(binResult, "????"); break; // In case of a mutiny, we mark it with question marks
    }
}

// Function to convert the entire hexadecimal string to binary
void convertHexToBinary(char* hexString, char* binaryResult) {
    char tempBin[5]; // Temporary storage for each binary conversion
    binaryResult[0] = '\0'; // Start with an empty string

    // Traverse the stormy seas of the hexadecimal string
    for (int i = 0; i < strlen(hexString); i++) {
        hexToBin(hexString[i], tempBin); // Convert each hex digit to binary
        strcat(binaryResult, tempBin); // Append the result to the final binary string
    }
}

int main() {
    char binaryResult[400]; // A vast ocean to store the binary result
    char weather[100]; // A variable named after the weather, just for fun

    // Ask the user for a hexadecimal number
    printf("Enter a hexadecimal number, ye scallywag: ");
    scanf("%s", globalHex);

    // Convert the hexadecimal number to binary
    convertHexToBinary(globalHex, binaryResult);

    // Display the binary result to the user
    printf("The binary equivalent be: %s\n", binaryResult);

    // Aye, we've reached the end of our journey. Fair winds and following seas!
    return 0;
}

