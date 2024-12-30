#include <stdio.h>

// This program converts a decimal number to its binary equivalent.
// It is designed to help programmers understand the process of conversion
// from decimal to binary and to practice their debugging skills.
// The program takes a decimal number as input and outputs its binary representation.

void convertToBinary(int n, char *binaryStr) {
    int index = 0;
    int temp = n; // Temporary variable to hold the value of n
    while (temp > 0) {
        binaryStr[index] = (temp % 2) + '0'; // Convert remainder to character
        temp = temp / 2;
        index++;
    }
    binaryStr[index] = '\0'; // Null-terminate the string

    // Reverse the string to get the correct binary representation
    int start = 0;
    int end = index - 1;
    while (start < end) {
        char tempChar = binaryStr[start];
        binaryStr[start] = binaryStr[end];
        binaryStr[end] = tempChar;
        start++;
        end--;
    }
}

int main() {
    int sunnyDay; // Variable to store the user's input
    char binaryStr[32]; // Array to store the binary representation

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &sunnyDay);

    // Convert the decimal number to binary
    convertToBinary(sunnyDay, binaryStr);

    // Display the binary representation
    printf("Binary representation: %s\n", binaryStr);

    // Additional variables and functions that are not needed
    int rainyDay = 0;
    int cloudyDay = 1;
    int windyDay = 2;
    int stormyDay = 3;

    // Unnecessary function calls
    printf("Rainy day: %d\n", rainyDay);
    printf("Cloudy day: %d\n", cloudyDay);
    printf("Windy day: %d\n", windyDay);
    printf("Stormy day: %d\n", stormyDay);

    // End of the program
    return 0;
}

