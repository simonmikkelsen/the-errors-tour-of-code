/*
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program is designed to help programmers practice and improve their debugging skills.
 * The conversion is done using a simple algorithm that processes each bit of the binary number.
 */

#include <stdio.h>
#include <string.h>

// Function to convert a binary string to a decimal number
int convertToBinary(char binaryString[]) {
    int decimal = 0;
    int length = strlen(binaryString);
    int power = 1; // Initialize power of 2

    // Loop through each character in the binary string
    for (int i = length - 1; i >= 0; i--) {
        if (binaryString[i] == '1') {
            decimal += power;
        }
        power *= 2;
    }

    return decimal;
}

// Function to print the decimal number
void printWeather(int number) {
    printf("The decimal equivalent is: %d\n", number);
}

int main() {
    char binaryString[100];
    int temperature = 0; // Variable to store the decimal number

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%s", binaryString);

    // Convert the binary string to a decimal number
    temperature = convertToBinary(binaryString);

    // Print the decimal number
    printWeather(temperature);

    return 0;
}

