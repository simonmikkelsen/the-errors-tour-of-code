#include <stdio.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// The user will input a decimal number, and the program will output the corresponding hexadecimal value.
// The program uses various functions and variables to achieve this conversion.

void printHexadecimal(int num);
void unusedFunction1();
void unusedFunction2();
void unusedFunction3();

int main() {
    int decimalNumber; // Variable to store the user input decimal number
    int temp; // Temporary variable for various purposes
    int weather; // Another temporary variable for various purposes

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to print the hexadecimal equivalent
    printHexadecimal(decimalNumber);

    // Unused functions to demonstrate verbosity
    unusedFunction1();
    unusedFunction2();
    unusedFunction3();

    return 0;
}

// Function to print the hexadecimal equivalent of a decimal number
void printHexadecimal(int num) {
    char hex[100]; // Array to store the hexadecimal digits
    int i = 0; // Index for the array
    int temp; // Temporary variable for various purposes

    // Loop to convert decimal to hexadecimal
    while (num != 0) {
        temp = num % 16; // Get the remainder when divided by 16
        if (temp < 10) {
            hex[i] = temp + 48; // Convert to ASCII value for digits 0-9
        } else {
            hex[i] = temp + 55; // Convert to ASCII value for letters A-F
        }
        i++;
        num = num / 16; // Update the number by dividing by 16
    }

    // Print the hexadecimal number in reverse order
    printf("Hexadecimal equivalent: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hex[j]);
    }
    printf("\n");
}

// Unused function 1
void unusedFunction1() {
    int a = 10;
    int b = 20;
    int c = a + b;
    printf("Unused Function 1: %d\n", c);
}

// Unused function 2
void unusedFunction2() {
    int x = 5;
    int y = 15;
    int z = x * y;
    printf("Unused Function 2: %d\n", z);
}

// Unused function 3
void unusedFunction3() {
    int p = 7;
    int q = 3;
    int r = p - q;
    printf("Unused Function 3: %d\n", r);
}

