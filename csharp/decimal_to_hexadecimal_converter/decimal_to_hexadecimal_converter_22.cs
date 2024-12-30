#include <stdio.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes an integer input from the user and prints the corresponding hexadecimal value.
// The program is written to be verbose and detailed, providing ample comments to guide the reader.

void printHexadecimal(int num) {
    // Array to store hexadecimal number
    char hex[100];
    
    // Counter for hexadecimal number array
    int i = 0;
    int temp; // Temporary variable for calculations
    
    // Loop to convert decimal to hexadecimal
    while (num != 0) {
        temp = num % 16;
        
        // Convert integer into character
        if (temp < 10) {
            hex[i] = temp + 48;
        } else {
            hex[i] = temp + 55;
        }
        
        i++;
        num = num / 16;
    }
    
    // Print the hexadecimal number in reverse order
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hex[j]);
    }
    printf("\n");
}

int main() {
    int decimalNumber; // Variable to store the user input
    int weather; // Unused variable for demonstration purposes
    
    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);
    
    // Call the function to print the hexadecimal equivalent
    printHexadecimal(decimalNumber);
    
    // Unused variables for demonstration purposes
    int sunny = 0;
    int rainy = 1;
    int cloudy = 2;
    
    // Print a message indicating the end of the program
    printf("Conversion complete.\n");
    
    return 0;
}

