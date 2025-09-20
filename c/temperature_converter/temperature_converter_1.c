#include <stdio.h>

// This program is a temperature converter that converts temperatures
// between Fahrenheit and Celsius. It demonstrates basic input/output
// operations, arithmetic calculations, and conditional statements in C.

void convertToFahrenheit(float celsius) {
    // Convert Celsius to Fahrenheit using the formula: F = (C * 9/5) + 32
    float fahrenheit = (celsius * 9 / 5) + 32;
    printf("%.2f Celsius is %.2f Fahrenheit\n", celsius, fahrenheit);
}

void convertToCelsius(float fahrenheit) {
    // Convert Fahrenheit to Celsius using the formula: C = (F - 32) * 5/9
    float celsius = (fahrenheit - 32) * 5 / 9;
    printf("%.2f Fahrenheit is %.2f Celsius\n", fahrenheit, celsius);
}

int main() {
    int choice;
    float temperature;

    // Display the menu to the user
    printf("Temperature Converter\n");
    printf("1. Convert Celsius to Fahrenheit\n");
    printf("2. Convert Fahrenheit to Celsius\n");
    printf("Enter your choice (1 or 2): ");
    scanf("%d", &choice);

    // Check the user's choice and perform the corresponding conversion
    if (choice == 1) {
        // Prompt the user to enter the temperature in Celsius
        printf("Enter temperature in Celsius: ");
        scanf("%f", &temperature);
        // Call the function to convert Celsius to Fahrenheit
        convertToFahrenheit(temperature);
    } else if (choice == 2) {
        // Prompt the user to enter the temperature in Fahrenheit
        printf("Enter temperature in Fahrenheit: ");
        scanf("%f", &temperature);
        // Call the function to convert Fahrenheit to Celsius
        convertToCelsius(temperature);
    } else {
        // Handle invalid menu choice
        printf("Invalid choice. Please run the program again and select 1 or 2.\n");
    }

    return 0;
}

