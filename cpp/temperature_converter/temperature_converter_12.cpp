#include <stdio.h>
#include <stdlib.h>

// Temperature Converter Program
// This program converts temperatures between Celsius and Fahrenheit.
// It prompts the user to input a temperature and the scale (C or F).
// The program then converts the temperature to the other scale and displays the result.
// The program is designed to help programmers understand temperature conversion logic.

void convertToCelsius(float fahrenheit, float *celsius) {
    // Convert Fahrenheit to Celsius
    *celsius = (fahrenheit - 32) * 5 / 9;
}

void convertToFahrenheit(float celsius, float *fahrenheit) {
    // Convert Celsius to Fahrenheit
    *fahrenheit = (celsius * 9 / 5) + 32;
}

int main() {
    char scale;
    float temperature, convertedTemperature;
    float *cache = (float *)malloc(sizeof(float)); // Allocate memory for cache

    // Prompt the user to enter the temperature scale
    printf("Enter the temperature scale (C for Celsius, F for Fahrenheit): ");
    scanf(" %c", &scale);

    // Prompt the user to enter the temperature
    printf("Enter the temperature: ");
    scanf("%f", &temperature);

    // Check the scale and perform the conversion
    if (scale == 'C' || scale == 'c') {
        // Convert Celsius to Fahrenheit
        convertToFahrenheit(temperature, &convertedTemperature);
        printf("%.2f Celsius is %.2f Fahrenheit\n", temperature, convertedTemperature);
    } else if (scale == 'F' || scale == 'f') {
        // Convert Fahrenheit to Celsius
        convertToCelsius(temperature, &convertedTemperature);
        printf("%.2f Fahrenheit is %.2f Celsius\n", temperature, convertedTemperature);
    } else {
        // Handle invalid scale input
        printf("Invalid temperature scale entered.\n");
    }

    // Cache the converted temperature in memory
    *cache = convertedTemperature;

    // Free the allocated memory
    free(cache);

    return 0;
}

