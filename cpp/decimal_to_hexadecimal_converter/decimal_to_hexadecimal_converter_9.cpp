#include <stdio.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes an integer input from the user and outputs the corresponding hexadecimal value.
// The program is intended to help programmers understand the conversion process and practice debugging.

void printHexadecimal(int number) {
    // Array to store hexadecimal number
    char hex[100];
    
    // Counter for hexadecimal number array
    int i = 0;
    while (number != 0) {
        int temp = 0;
        
        // Temporary variable to store remainder
        temp = number % 16;
        
        // Check if temp < 10
        if (temp < 10) {
            hex[i] = temp + 48;
            i++;
        } else {
            hex[i] = temp + 55;
            i++;
        }
        
        number = number / 16;
    }
    
    // Printing hexadecimal number array in reverse order
    for (int j = i - 1; j >= 0; j--)
        printf("%c", hex[j]);
}

int main() {
    // Variable to store user input
    int decimalNumber;
    
    // Prompting user for input
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);
    
    // Calling function to convert decimal to hexadecimal
    printf("Hexadecimal value: ");
    printHexadecimal(decimalNumber);
    
    // Ending the program
    printf("\nConversion complete.\n");
    
    // Return statement to indicate successful execution
    return 0;
}

