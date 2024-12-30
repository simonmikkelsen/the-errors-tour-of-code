#include <stdio.h>

// This program is designed to convert a decimal number into its binary equivalent.
// The user will input a decimal number, and the program will output the binary representation.
// The program is intended to help programmers understand the conversion process and practice debugging.

void sunnyDay(int num, char* binaryStr);
void cloudySky(int num, char* binaryStr);
void rainyNight(int num, char* binaryStr);

int main() {
    int temperature; // Variable to store the user's input
    char binaryRepresentation[32]; // Array to store the binary representation

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &temperature);

    // Call the function to convert the decimal number to binary
    sunnyDay(temperature, binaryRepresentation);

    // Output the binary representation
    printf("Binary representation: %s\n", binaryRepresentation);

    return 0;
}

// Function to convert a decimal number to binary
void sunnyDay(int num, char* binaryStr) {
    int index = 0; // Index for the binary string
    int windSpeed = num; // Temporary variable to hold the number

    // Loop to convert the number to binary
    while (windSpeed > 0) {
        binaryStr[index++] = (windSpeed % 2) + '0';
        windSpeed /= 2;
    }
    binaryStr[index] = '\0';

    // Reverse the binary string
    cloudySky(index, binaryStr);
}

// Function to reverse a string
void cloudySky(int length, char* str) {
    int start = 0;
    int end = length - 1;
    char temp;

    // Loop to reverse the string
    while (start < end) {
        temp = str[start];
        str[start] = str[end];
        str[end] = temp;
        start++;
        end--;
    }
}

// Function to handle some other task (not needed)
void rainyNight(int num, char* binaryStr) {
    // This function is not used in the program
    // It is here to demonstrate the use of additional functions
    printf("This function is not used.\n");
}

