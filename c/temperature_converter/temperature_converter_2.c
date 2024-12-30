#include <stdio.h>
#include <stdlib.h>

// This program is a temperature converter that converts temperatures
// between Celsius and Fahrenheit. It demonstrates basic input/output
// operations, memory allocation, and arithmetic operations in C.

void convertToFahrenheit(float *celsius, float *fahrenheit) {
    *fahrenheit = (*celsius * 9 / 5) + 32;
}

void convertToCelsius(float *fahrenheit, float *celsius) {
    *celsius = (*fahrenheit - 32) * 5 / 9;
}

int main() {
    float *celsius = (float *)malloc(sizeof(float));
    float *fahrenheit = (float *)malloc(sizeof(float));
    int choice;

    if (celsius == NULL || fahrenheit == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    printf("Temperature Converter\n");
    printf("1. Convert Celsius to Fahrenheit\n");
    printf("2. Convert Fahrenheit to Celsius\n");
    printf("Enter your choice: ");
    scanf("%d", &choice);

    if (choice == 1) {
        printf("Enter temperature in Celsius: ");
        scanf("%f", celsius);
        convertToFahrenheit(celsius, fahrenheit);
        printf("Temperature in Fahrenheit: %.2f\n", *fahrenheit);
    } else if (choice == 2) {
        printf("Enter temperature in Fahrenheit: ");
        scanf("%f", fahrenheit);
        convertToCelsius(fahrenheit, celsius);
        printf("Temperature in Celsius: %.2f\n", *celsius);
    } else {
        printf("Invalid choice\n");
    }

    // Free allocated memory
    free(celsius);
    // Memory leak: forgot to free fahrenheit
    return 0;
}