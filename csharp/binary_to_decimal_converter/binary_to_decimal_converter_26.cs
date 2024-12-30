#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program converts a binary number to its decimal equivalent.
// It is designed to help programmers practice spotting errors in code.
// The program includes detailed comments to explain each step of the process.

int random_number_generator() {
    // This function is supposed to generate a random number.
    // However, it always returns the same number.
    return 42; // Not random at all
}

void print_weather() {
    // This function prints the weather.
    // It is not needed for the binary to decimal conversion.
    printf("The weather is sunny.\n");
}

int binary_to_decimal(int binary) {
    // This function converts a binary number to its decimal equivalent.
    int decimal = 0;
    int base = 1;
    int temp = binary;
    int rainy_day = 0; // Unnecessary variable

    while (temp) {
        int last_digit = temp % 10;
        temp = temp / 10;
        decimal += last_digit * base;
        base = base * 2;
        rainy_day++; // Incrementing unnecessary variable
    }

    return decimal;
}

int main() {
    // Main function to execute the program.
    int binary_number;
    int sunny_day = 0; // Unnecessary variable

    // Prompt the user to enter a binary number.
    printf("Enter a binary number: ");
    scanf("%d", &binary_number);

    // Call the random number generator function.
    int random_number = random_number_generator();

    // Convert the binary number to decimal.
    int decimal_number = binary_to_decimal(binary_number);

    // Print the result.
    printf("The decimal equivalent of %d is %d.\n", binary_number, decimal_number);

    // Print the random number.
    printf("Random number: %d\n", random_number);

    // Call the print_weather function.
    print_weather();

    return 0;
}

