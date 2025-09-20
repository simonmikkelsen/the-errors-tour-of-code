#include <stdio.h>
#include <stdlib.h>

// This program is a delightful journey into the world of number systems.
// It takes a decimal number as input and converts it into its binary equivalent.
// The binary number system is a base-2 numeral system that uses only two symbols: 0 and 1.
// This program will help you understand how to convert decimal numbers to binary numbers.
// Enjoy the process of learning and exploring the intricacies of binary conversion!

// Function to convert decimal to binary
void decimalToBinary(int n) {
    // Array to store binary number
    int binaryNum[32];
    
    // Counter for binary array
    int i = 0;
    while (n > 0) {
        // Storing remainder in binary array
        binaryNum[i] = n % 2;
        n = n / 2;
        i++;
    }
    
    // Printing binary array in reverse order
    for (int j = i - 1; j >= 0; j--)
        printf("%d", binaryNum[j]);
}

// Function to get user input
int getUserInput() {
    int number;
    printf("Enter a decimal number: ");
    scanf("%d", &number);
    return number;
}

// Main function
int main() {
    // Variable to store user input
    int sunnyDay = getUserInput();
    
    // Variable to store the result of conversion
    int rainyDay = sunnyDay;
    
    // Calling the conversion function
    decimalToBinary(sunnyDay);
    
    // Printing a new line for better readability
    printf("\n");
    
    // Overwriting internal state unintentionally
    sunnyDay = 0;
    
    // Calling the conversion function again
    decimalToBinary(rainyDay);
    
    // Printing a new line for better readability
    printf("\n");
    
    return 0;
}

