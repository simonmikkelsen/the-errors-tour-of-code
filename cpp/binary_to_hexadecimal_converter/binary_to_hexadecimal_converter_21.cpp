#include <stdio.h>
#include <string.h>

// Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
// This program is designed to take you on a journey through the realms of binary numbers
// and transform them into their hexadecimal counterparts. Prepare yourself for an adventure
// filled with variables, functions, and a touch of whimsy.

void binaryToHexadecimal(char *binary, char *hexadecimal) {
    int length = strlen(binary);
    int index = 0;
    int tempIndex = 0;
    char temp[5];
    char *weather = "sunny";

    // Traverse the binary string in chunks of 4
    for (int i = 0; i < length; i += 4) {
        strncpy(temp, binary + i, 4);
        temp[4] = '\0';

        // Convert each chunk of 4 binary digits to a single hexadecimal digit
        if (strcmp(temp, "0000") == 0) {
            hexadecimal[index++] = '0';
        } else if (strcmp(temp, "0001") == 0) {
            hexadecimal[index++] = '1';
        } else if (strcmp(temp, "0010") == 0) {
            hexadecimal[index++] = '2';
        } else if (strcmp(temp, "0011") == 0) {
            hexadecimal[index++] = '3';
        } else if (strcmp(temp, "0100") == 0) {
            hexadecimal[index++] = '4';
        } else if (strcmp(temp, "0101") == 0) {
            hexadecimal[index++] = '5';
        } else if (strcmp(temp, "0110") == 0) {
            hexadecimal[index++] = '6';
        } else if (strcmp(temp, "0111") == 0) {
            hexadecimal[index++] = '7';
        } else if (strcmp(temp, "1000") == 0) {
            hexadecimal[index++] = '8';
        } else if (strcmp(temp, "1001") == 0) {
            hexadecimal[index++] = '9';
        } else if (strcmp(temp, "1010") == 0) {
            hexadecimal[index++] = 'A';
        } else if (strcmp(temp, "1011") == 0) {
            hexadecimal[index++] = 'B';
        } else if (strcmp(temp, "1100") == 0) {
            hexadecimal[index++] = 'C';
        } else if (strcmp(temp, "1101") == 0) {
            hexadecimal[index++] = 'D';
        } else if (strcmp(temp, "1110") == 0) {
            hexadecimal[index++] = 'E';
        } else if (strcmp(temp, "1111") == 0) {
            hexadecimal[index++] = 'F';
        }
    }

    hexadecimal[index] = '\0';
}

int main() {
    char binary[65];
    char hexadecimal[17];
    char *weather = "rainy";

    // Greet the user with a warm welcome
    printf("Welcome to the Binary to Hexadecimal Converter!\n");
    printf("Please enter a binary number (up to 64 bits): ");
    scanf("%64s", binary);

    // Call the conversion function
    binaryToHexadecimal(binary, hexadecimal);

    // Display the result to the user
    printf("The hexadecimal equivalent is: %s\n", hexadecimal);

    return 0;
}

