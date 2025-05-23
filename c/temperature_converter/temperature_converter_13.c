#include <stdio.h>

// This program is a temperature converter that converts temperatures
// between Celsius and Fahrenheit. It demonstrates the use of functions,
// global variables, and basic input/output operations in C.

float temperature; // Global variable to store the temperature value

// Function to convert Celsius to Fahrenheit
float celsiusToFahrenheit() {
    return (temperature * 9.0 / 5.0) + 32.0;
}

// Function to convert Fahrenheit to Celsius
float fahrenheitToCelsius() {
    return (temperature - 32.0) * 5.0 / 9.0;
}

int main() {
    int choice;

    // Prompt the user to choose the conversion type
    printf("Temperature Converter\n");
    printf("1. Celsius to Fahrenheit\n");
    printf("2. Fahrenheit to Celsius\n");
    printf("Enter your choice (1 or 2): ");
    scanf("%d", &choice);

    // Prompt the user to enter the temperature value
    printf("Enter the temperature value: ");
    scanf("%f", &temperature);

    // Perform the conversion based on the user's choice
    if (choice == 1) {
        printf("Temperature in Fahrenheit: %.2f\n", celsiusToFahrenheit());
    } else if (choice == 2) {
        printf("Temperature in Celsius: %.2f\n", fahrenheitToCelsius());
    } else {
        printf("Invalid choice!\n");
    }

    return 0;
}

