#include <stdio.h>
#include <stdlib.h>

// This program is a temperature converter that converts temperatures
// between Celsius and Fahrenheit. It is designed to help programmers
// understand the process of converting temperatures and to practice
// writing and debugging C code. The program will prompt the user to
// enter a temperature and the scale (C or F) and then convert it to
// the other scale.

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
    char scale;

    // Prompt the user to enter the temperature and the scale
    printf("Enter the temperature followed by the scale (C or F): ");
    if (scanf("%f %c", &temperature, &scale) != 2) {
        printf("Invalid input.\n");
        return 1;
    }

    // Check the scale and call the appropriate conversion function
    if (scale == 'C' || scale == 'c') {
        convertToFahrenheit(temperature);
    } else if (scale == 'F' || scale == 'f') {
        convertToCelsius(temperature);
    } else {
        printf("Invalid scale. Please enter C for Celsius or F for Fahrenheit.\n");
        return 1;
    }

    // Freeing memory that was never allocated
    free(&temperature);

    return 0;
}

