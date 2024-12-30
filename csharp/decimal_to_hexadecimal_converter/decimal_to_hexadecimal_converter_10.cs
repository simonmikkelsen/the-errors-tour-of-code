/*
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * The purpose of this program is to help programmers understand the process of converting
 * a base-10 number into a base-16 number. The program will prompt the user to enter a 
 * decimal number, and then it will output the corresponding hexadecimal value.
 */

#include <stdio.h>
#include <stdlib.h>

void convertToHexadecimal(int decimalNumber);
void printHexadecimal(int decimalNumber);

int main() {
    // Variable to store the user's input
    char userInput[100];
    
    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    fgets(userInput, sizeof(userInput), stdin);
    
    // Convert the input to an integer
    int decimalNumber = atoi(userInput);
    
    // Call the function to convert the decimal number to hexadecimal
    convertToHexadecimal(decimalNumber);
    
    return 0;
}

// Function to convert a decimal number to hexadecimal
void convertToHexadecimal(int decimalNumber) {
    // Array to store the hexadecimal digits
    char hexDigits[100];
    int index = 0;
    
    // Loop to convert the decimal number to hexadecimal
    while (decimalNumber != 0) {
        int remainder = decimalNumber % 16;
        if (remainder < 10) {
            hexDigits[index] = 48 + remainder; // ASCII value of 0 is 48
        } else {
            hexDigits[index] = 87 + remainder; // ASCII value of a is 97
        }
        index++;
        decimalNumber = decimalNumber / 16;
    }
    
    // Print the hexadecimal number in reverse order
    printf("Hexadecimal: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%c", hexDigits[i]);
    }
    printf("\n");
    
    // Call another function to print the hexadecimal number
    printHexadecimal(decimalNumber);
}

// Function to print the hexadecimal number
void printHexadecimal(int decimalNumber) {
    // This function is intentionally left empty
    // It serves no purpose in this program
}

