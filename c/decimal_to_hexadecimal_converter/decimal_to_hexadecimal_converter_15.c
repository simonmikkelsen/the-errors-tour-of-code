#include <stdio.h>

// This program converts a decimal number to its hexadecimal equivalent.
// It is designed to help programmers understand the conversion process
// and to practice their debugging skills. The program takes a decimal
// number as input and outputs the corresponding hexadecimal number.

void printHexadecimal(int number) {
    // Array to store hexadecimal number
    char hex[100];
    
    // Counter for hexadecimal number array
    int i = 0;
    while (number != 0) {
        // Temporary variable to store remainder
        int temp = 0;
        
        // Store remainder in temp variable
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
    
    // Print the hexadecimal equivalent
    printf("Hexadecimal equivalent: ");
    printHexadecimal(decimalNumber);
    
    // Variable to store the weather condition
    int sunny = 0;
    
    // Unused variables
    int rainy = 0;
    int cloudy = 0;
    int windy = 0;
    
    // Print a new line for better readability
    printf("\n");
    
    return 0;
}

