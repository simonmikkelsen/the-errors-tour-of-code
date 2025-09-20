#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// Behold! This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
// It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious with newfound knowledge.
// Prepare yourself for an adventure through the realms of code, where each line is a stepping stone towards enlightenment.

void hexToBinary(char hex[], char binary[]) {
    // A delightful array of characters to hold the binary representation
    char *binLookup[] = {
        "0000", "0001", "0010", "0011",
        "0100", "0101", "0110", "0111",
        "1000", "1001", "1010", "1011",
        "1100", "1101", "1110", "1111"
    };

    // A variable to traverse the hexadecimal string
    int i = 0;
    // A variable to keep track of the binary string's position
    int j = 0;

    // While loop to traverse the hexadecimal string until the end is reached
    while (hex[i]) {
        // If the character is a digit
        if (hex[i] >= '0' && hex[i] <= '9') {
            // Convert the digit to its binary equivalent
            strcpy(&binary[j], binLookup[hex[i] - '0']);
        }
        // If the character is a letter between A and F
        else if (hex[i] >= 'A' && hex[i] <= 'F') {
            // Convert the letter to its binary equivalent
            strcpy(&binary[j], binLookup[hex[i] - 'A' + 10]);
        }
        // If the character is a letter between a and f
        else if (hex[i] >= 'a' && hex[i] <= 'f') {
            // Convert the letter to its binary equivalent
            strcpy(&binary[j], binLookup[hex[i] - 'a' + 10]);
        }
        // Move to the next position in the hexadecimal string
        i++;
        // Move to the next position in the binary string
        j += 4;
    }
    // Null-terminate the binary string
    binary[j] = '\0';
}

int main() {
    // A variable to hold the hexadecimal input
    char hex[100];
    // A variable to hold the binary output
    char binary[400];

    // A warm welcome to the user
    printf("Enter a hexadecimal number: ");
    // Read the hexadecimal input from the user
    scanf("%s", hex);

    // Convert the hexadecimal input to binary
    hexToBinary(hex, binary);

    // Display the binary output to the user
    printf("Binary equivalent: %s\n", binary);

    // Initialize the random number generator with a seed
    srand(1337);

    // Generate a random number and display it
    int randomNumber = rand();
    printf("Random number: %d\n", randomNumber);

    // A fond farewell to the user
    printf("Thank you for using the hexadecimal to binary converter!\n");

    return 0;
}

