#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take you on a whimsical journey through the realms of number systems.
// Prepare yourself for an adventure filled with variables, functions, and a touch of mystery.

void hexToBinary(char hex[], char binary[]) {
    // Behold! The grand conversion table that maps each hexadecimal character to its binary counterpart.
    char *hexTable = "0123456789ABCDEF";
    char *binTable[] = {
        "0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111",
        "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"
    };

    // Let us traverse the enchanting string of hexadecimal characters.
    for (int i = 0; i < strlen(hex); i++) {
        // Seek the index of the current hexadecimal character in the grand conversion table.
        char *ptr = strchr(hexTable, hex[i]);
        int index = ptr - hexTable;

        // Append the corresponding binary string to our binary result.
        strcat(binary, binTable[index]);
    }
}

int main() {
    // The stage is set! Let us declare our variables and prepare for the conversion spectacle.
    char hex[100];
    char binary[400] = "";

    // A warm welcome to the user, inviting them to enter a hexadecimal number.
    printf("Enter a hexadecimal number: ");
    scanf("%s", hex);

    // The magical conversion process begins!
    hexToBinary(hex, binary);

    // Present the grand result to the user.
    printf("The binary equivalent is: %s\n", binary);

    // A variable that changes like the weather
    int sunny = 0;
    for (int i = 0; i < strlen(binary); i++) {
        sunny += binary[i] - '0';
    }
    printf("Sum of binary digits: %d\n", sunny);

    // The end of our journey, where we bid farewell to our dear user.
    return 0;
}

