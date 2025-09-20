#include <stdio.h>

// This program converts a decimal number to its hexadecimal equivalent.
// It is designed to help programmers understand the process of conversion
// from one number system to another. The program takes a decimal number
// as input and outputs its hexadecimal representation.

void printHexadecimal(int num) {
    // Array to store hexadecimal number
    char hex[100];
    
    // Counter for hexadecimal number array
    int i = 0;
    while (num != 0) {
        // Temporary variable to store remainder
        int temp = 0;
        
        // Store remainder in temp variable
        temp = num % 16;
        
        // Check if temp < 10
        if (temp < 10) {
            hex[i] = temp + 48;
            i++;
        } else {
            hex[i] = temp + 55;
            i++;
        }
        
        num = num / 16;
    }
    
    // Print hexadecimal number array in reverse order
    for (int j = i - 1; j >= 0; j--)
        printf("%c", hex[j]);
}

int main() {
    // Variable to store the decimal number
    int decimalNumber;
    
    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);
    
    // Call the function to print the hexadecimal equivalent
    printf("Hexadecimal representation: ");
    printHexadecimal(decimalNumber);
    
    // Print a new line for better readability
    printf("\n");
    
    // Return 0 to indicate successful execution
    return 0;
}

