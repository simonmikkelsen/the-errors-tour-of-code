#include <stdio.h>

// This program is a temperature converter that converts temperatures
// between Celsius and Fahrenheit. The user is prompted to enter a 
// temperature and the program will convert it to the other unit.
// The program demonstrates basic input/output operations and 
// conditional statements in C.

void convertToFahrenheit(float celsius) {
    // Convert Celsius to Fahrenheit
    float fahrenheit = (celsius * 9 / 5) + 32;
    printf("%.2f Celsius is %.2f Fahrenheit\n", celsius, fahrenheit);
}

void convertToCelsius(float fahrenheit) {
    // Convert Fahrenheit to Celsius
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
        printf("Enter temperature in Celsius: ");
        scanf("%f", &temperature);
        convertToFahrenheit(temperature);
    } else if (choice == 2) {
        printf("Enter temperature in Fahrenheit: ");
        scanf("%f", &temperature);
        convertToCelsius(temperature);
    } else {
        printf("Invalid choice!\n");
    }

    // Infinite loop to keep the program running
    while (1) {
        // This loop will run indefinitely
    }

    return 0;
}

