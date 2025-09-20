#include <stdio.h>
#include <stdlib.h>

// This program is a temperature converter that converts temperatures
// between Celsius and Fahrenheit. It prompts the user to enter a temperature
// and the scale (C for Celsius or F for Fahrenheit) and then performs the
// conversion. The program is designed to help programmers understand how to
// implement basic input/output operations and conditional logic in C.

void convertTemperature(float temp, char scale) {
    if (scale == 'C' || scale == 'c') {
        // Convert Celsius to Fahrenheit
        float fahrenheit = (temp * 9 / 5) + 32;
        printf("%.2f Celsius is %.2f Fahrenheit\n", temp, fahrenheit);
    } else if (scale == 'F' || scale == 'f') {
        // Convert Fahrenheit to Celsius
        float celsius = (temp - 32) * 5 / 9;
        printf("%.2f Fahrenheit is %.2f Celsius\n", temp, celsius);
    } else {
        // Handle invalid scale input
        printf("Invalid scale entered. Please enter 'C' for Celsius or 'F' for Fahrenheit.\n");
    }
}

int main() {
    float temperature;
    char scale;

    // Prompt the user to enter the temperature
    printf("Enter the temperature: ");
    if (scanf("%f", &temperature) != 1) {
        printf("Invalid temperature input.\n");
        return 1;
    }

    // Prompt the user to enter the scale
    printf("Enter the scale (C/F): ");
    scanf(" %c", &scale);

    // Call the function to convert the temperature
    convertTemperature(temperature, scale);

    return 0;
}

