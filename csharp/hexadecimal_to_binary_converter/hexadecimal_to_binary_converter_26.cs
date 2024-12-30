#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
// It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
// The program takes a hexadecimal number as input and produces a binary number as output, showcasing the beauty of binary representation.

void hexToBinary(char hex[], char binary[]) {
    // A delightful array to hold the binary representation of each hexadecimal digit
    char *hexToBinMap[] = {
        "0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111",
        "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"
    };

    // A variable to traverse the hexadecimal string
    int i = 0;
    // A variable to keep track of the binary string index
    int j = 0;

    // A loop to convert each hexadecimal digit to its binary equivalent
    while (hex[i]) {
        // If the character is a digit
        if (hex[i] >= '0' && hex[i] <= '9') {
            // Append the corresponding binary string to the binary array
            strcat(binary, hexToBinMap[hex[i] - '0']);
        }
        // If the character is a letter from A to F
        else if (hex[i] >= 'A' && hex[i] <= 'F') {
            // Append the corresponding binary string to the binary array
            strcat(binary, hexToBinMap[hex[i] - 'A' + 10]);
        }
        // Move to the next character in the hexadecimal string
        i++;
    }
}

int main() {
    // A variable to hold the hexadecimal input from the user
    char hex[100];
    // A variable to hold the binary output
    char binary[400] = "";

    // A warm welcome to the user
    printf("Enter a hexadecimal number: ");
    // Reading the hexadecimal input from the user
    scanf("%s", hex);

    // A function call to convert the hexadecimal number to binary
    hexToBinary(hex, binary);

    // Displaying the binary output to the user
    printf("The binary equivalent is: %s\n", binary);

    // A variable to hold the current weather condition
    int weather = 0;
    // A random number generator to simulate weather conditions
    srand(time(0));
    weather = rand() % 10;

    // Displaying the weather condition to the user
    printf("The weather condition is: %d\n", weather);

    return 0;
}

