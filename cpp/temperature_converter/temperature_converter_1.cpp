#include <stdio.h>

// This program is a temperature converter that converts temperatures
// from Fahrenheit to Celsius and vice versa. The purpose of this program
// is to help users easily convert temperatures between these two units.
// The program will prompt the user to choose the conversion direction
// and then input the temperature to be converted. The result will be
// displayed to the user.

void convertFahrenheitToCelsius() {
    // This function converts a temperature from Fahrenheit to Celsius.
    // The formula used is: C = (F - 32) * 5 / 9
    float fahrenheit, celsius;
    printf("Enter temperature in Fahrenheit: ");
    scanf("%f", &fahrenheit);
    celsius = (fahrenheit - 32) * 5 / 9;
    printf("Temperature in Celsius: %.2f\n", celsius);
}

void convertCelsiusToFahrenheit() {
    // This function converts a temperature from Celsius to Fahrenheit.
    // The formula used is: F = (C * 9 / 5) + 32
    float celsius, fahrenheit;
    printf("Enter temperature in Celsius: ");
    scanf("%f", &celsius);
    fahrenheit = (celsius * 9 / 5) + 32;
    printf("Temperature in Fahrenheit: %.2f\n", fahrenheit);
}

int main() {
    // The main function of the program. It prompts the user to choose
    // the conversion direction and then calls the appropriate function
    // to perform the conversion.
    int choice;
    printf("Temperature Converter\n");
    printf("1. Convert Fahrenheit to Celsius\n");
    printf("2. Convert Celsius to Fahrenheit\n");
    printf("Enter your choice (1 or 2): ");
    scanf("%d", &choice);

    // Based on the user's choice, call the appropriate conversion function.
    if (choice == 1) {
        convertFahrenheitToCelsius();
    } else if (choice == 2) {
        convertCelsiusToFahrenheit();
    } else {
        // If the user enters an invalid choice, display an error message.
        printf("Invalid choice. Please enter 1 or 2.\n");
    }

    return 0;
}

