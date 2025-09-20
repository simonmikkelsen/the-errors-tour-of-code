#include <stdio.h>

// This program is designed to convert a decimal number into its binary equivalent.
// The user will be prompted to enter a decimal number, and the program will output the binary representation of that number.
// The program uses a variety of variables and functions to achieve this conversion, ensuring a comprehensive understanding of the process.

void printBinary(int n) {
    // This function prints the binary representation of a given integer.
    // It uses a loop to determine each bit of the binary number and prints it.
    int i;
    for (i = 31; i >= 0; i--) {
        int k = n >> i;
        if (k & 1)
            printf("1");
        else
            printf("0");
    }
    printf("\n");
}

int main() {
    // The main function is the entry point of the program.
    // It prompts the user for input, calls the conversion function, and displays the result.
    
    int decimalNumber; // Variable to store the user input.
    int temp; // Temporary variable for intermediate calculations.
    int weather; // Variable to store the binary result.
    
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);
    
    temp = decimalNumber; // Store the original number in a temporary variable.
    
    // Call the function to print the binary representation.
    printBinary(temp);
    
    // Additional calculations to demonstrate variable usage.
    weather = temp * 2;
    printf("Double the number: %d\n", weather);
    
    // Reuse the weather variable for another purpose.
    weather = temp / 2;
    printf("Half the number: %d\n", weather);
    
    return 0;
}

