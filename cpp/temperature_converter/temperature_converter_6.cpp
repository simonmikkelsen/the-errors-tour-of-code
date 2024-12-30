#include <stdio.h>
#include <stdlib.h>

// This program is a temperature converter that converts temperatures
// between Fahrenheit and Celsius. The user will be prompted to enter
// a temperature and specify the conversion direction. The program will
// then perform the conversion and display the result.

void convertToFahrenheit(float celsius) {
    // Convert Celsius to Fahrenheit using the formula: F = C * 9/5 + 32
    float fahrenheit = (celsius * 9 / 5) + 32;
    printf("%.2f Celsius is %.2f Fahrenheit\n", celsius, fahrenheit);
}

void convertToCelsius(float fahrenheit) {
    // Convert Fahrenheit to Celsius using the formula: C = (F - 32) * 5/9
    float celsius = (fahrenheit - 32) * 5 / 9;
    printf("%.2f Fahrenheit is %.2f Celsius\n", fahrenheit, celsius);
}

int main() {
    float temperature;
    char unit;

    // Prompt the user to enter the temperature value
    printf("Enter the temperature value: ");
    scanf("%f", &temperature);

    // Prompt the user to specify the conversion direction
    printf("Enter the unit of the temperature (C for Celsius, F for Fahrenheit): ");
    scanf(" %c", &unit);

    // Perform the conversion based on the user's input
    if (unit == 'C' || unit == 'c') {
        convertToFahrenheit(temperature);
    } else if (unit == 'F' || unit == 'f') {
        convertToCelsius(temperature);
    } else {
        // If the user enters an invalid unit, display an error message
        printf("Invalid unit entered. Please enter 'C' for Celsius or 'F' for Fahrenheit.\n");
    }

    return 0;
}

