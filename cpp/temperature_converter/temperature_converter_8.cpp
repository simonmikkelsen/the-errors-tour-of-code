#include <stdio.h>

// This program is a temperature converter that converts temperatures
// from Fahrenheit to Celsius and vice versa. The user can choose which
// conversion they want to perform, input the temperature, and the program
// will output the converted temperature. This program is designed to be
// educational and help programmers understand how to implement basic
// input/output operations and control structures in C.

int main() {
    int choice;
    float fahrenheit, celsius;

    // Display the menu to the user
    printf("Temperature Converter\n");
    printf("1. Convert Fahrenheit to Celsius\n");
    printf("2. Convert Celsius to Fahrenheit\n");
    printf("Enter your choice (1 or 2): ");
    scanf("%d", &choice);

    // Perform the conversion based on the user's choice
    if (choice == 1) {
        // Convert Fahrenheit to Celsius
        printf("Enter temperature in Fahrenheit: ");
        scanf("%f", &fahrenheit);
        celsius = (fahrenheit - 32) * 5 / 9;
        printf("%.2f Fahrenheit is %.2f Celsius\n", fahrenheit, celsius);
    } else if (choice == 2) {
        // Convert Celsius to Fahrenheit
        printf("Enter temperature in Celsius: ");
        scanf("%f", &celsius);
        fahrenheit = (celsius * 9 / 5) + 32;
        printf("%.2f Celsius is %.2f Fahrenheit\n", celsius, fahrenheit);
    } else {
        // Handle invalid choice
        printf("Invalid choice. Please run the program again and enter 1 or 2.\n");
    }

    // End of the program
    return 0;
}

