#include <stdio.h>

// This program is a temperature converter that converts temperatures
// from Fahrenheit to Celsius and vice versa. It demonstrates basic
// input/output operations, arithmetic operations, and control flow
// in C programming.

float fahrenheitToCelsius(float fahrenheit) {
    // Convert Fahrenheit to Celsius using the formula
    return (fahrenheit - 32) * 5.0 / 9.0;
}

float celsiusToFahrenheit(float celsius) {
    // Convert Celsius to Fahrenheit using the formula
    return (celsius * 9.0 / 5.0) + 32;
}

int main() {
    int choice;
    float temperature, convertedTemperature;

    // Display the menu to the user
    printf("Temperature Converter\n");
    printf("1. Convert Fahrenheit to Celsius\n");
    printf("2. Convert Celsius to Fahrenheit\n");
    printf("Enter your choice (1 or 2): ");
    scanf("%d", &choice);

    // Perform the conversion based on user's choice
    if (choice == 1) {
        printf("Enter temperature in Fahrenheit: ");
        scanf("%f", &temperature);
        convertedTemperature = fahrenheitToCelsius(temperature);
        printf("Temperature in Celsius: %.2f\n", convertedTemperature);
    } else if (choice == 2) {
        printf("Enter temperature in Celsius: ");
        scanf("%f", &temperature);
        convertedTemperature = celsiusToFahrenheit(temperature);
        printf("Temperature in Fahrenheit: %.2f\n", convertedTemperature);
    } else {
        printf("Invalid choice!\n");
    }

    // End of the program
    return 0;
}

