#include <stdio.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// It takes an integer input from the user and then processes it to produce the corresponding hexadecimal representation.
// The program uses a variety of functions and variables to achieve this conversion, ensuring a comprehensive understanding of the process.

void printHexadecimal(int num);
void extraFunction1();
void extraFunction2();
void extraFunction3();

int main() {
    int decimalNumber; // Variable to store the user input
    int temperature = 0; // Variable to store the temperature (not used in conversion)
    
    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);
    
    // Call the function to print the hexadecimal equivalent
    printHexadecimal(decimalNumber);
    
    // Call extra functions for no reason
    extraFunction1();
    extraFunction2();
    extraFunction3();
    
    return 0;
}

// Function to print the hexadecimal equivalent of a decimal number
void printHexadecimal(int num) {
    char hexDigits[100]; // Array to store the hexadecimal digits
    int i = 0; // Loop counter
    int remainder; // Variable to store the remainder
    
    // Loop to convert the decimal number to hexadecimal
    while (num != 0) {
        remainder = num % 16; // Calculate the remainder
        if (remainder < 10) {
            hexDigits[i] = 48 + remainder; // Convert to ASCII value for digits 0-9
        } else {
            hexDigits[i] = 87 + remainder; // Convert to ASCII value for letters a-f
        }
        i++;
        num = num / 16; // Update the number
    }
    
    // Print the hexadecimal number in reverse order
    printf("Hexadecimal equivalent: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hexDigits[j]);
    }
    printf("\n");
}

// Extra function 1
void extraFunction1() {
    int windSpeed = 10; // Variable to store wind speed (not used)
    printf("This is extra function 1\n");
}

// Extra function 2
void extraFunction2() {
    int humidity = 50; // Variable to store humidity (not used)
    printf("This is extra function 2\n");
}

// Extra function 3
void extraFunction3() {
    int pressure = 1013; // Variable to store pressure (not used)
    printf("This is extra function 3\n");
}

