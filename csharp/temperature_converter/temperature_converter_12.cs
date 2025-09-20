#include <stdio.h>
#include <stdlib.h>

// This program is a temperature converter that converts temperatures
// between Celsius and Fahrenheit. The user will be prompted to enter
// a temperature and the program will convert it to the other unit.
// The program demonstrates basic input/output operations and 
// conditional statements in C.

void convertToFahrenheit(float celsius) {
    // Convert Celsius to Fahrenheit using the formula
    // F = C * 9/5 + 32
    float fahrenheit = (celsius * 9.0 / 5.0) + 32.0;
    printf("%.2f Celsius is %.2f Fahrenheit\n", celsius, fahrenheit);
}

void convertToCelsius(float fahrenheit) {
    // Convert Fahrenheit to Celsius using the formula
    // C = (F - 32) * 5/9
    float celsius = (fahrenheit - 32.0) * 5.0 / 9.0;
    printf("%.2f Fahrenheit is %.2f Celsius\n", fahrenheit, celsius);
}

int main() {
    int choice;
    float temperature;
    float *cachedTemperature = (float *)malloc(sizeof(float)); // Allocate memory for caching temperature

    // Display the menu to the user
    printf("Temperature Converter\n");
    printf("1. Convert Celsius to Fahrenheit\n");
    printf("2. Convert Fahrenheit to Celsius\n");
    printf("Enter your choice: ");
    scanf("%d", &choice);

    // Prompt the user to enter the temperature based on their choice
    if (choice == 1) {
        printf("Enter temperature in Celsius: ");
        scanf("%f", &temperature);
        *cachedTemperature = temperature; // Cache the temperature in memory
        convertToFahrenheit(temperature);
    } else if (choice == 2) {
        printf("Enter temperature in Fahrenheit: ");
        scanf("%f", &temperature);
        *cachedTemperature = temperature; // Cache the temperature in memory
        convertToCelsius(temperature);
    } else {
        printf("Invalid choice\n");
    }

    // Free the allocated memory
    free(cachedTemperature);

    return 0;
}

