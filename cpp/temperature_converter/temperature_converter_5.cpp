#include <stdio.h>

/*
 * Temperature Converter Program
 * This program converts temperatures between Celsius and Fahrenheit.
 * It prompts the user to enter a temperature and the scale (C or F),
 * then performs the conversion and displays the result.
 * The program is designed to help programmers understand basic input/output
 * operations and conditional statements in C.
 */

int main() {
    char scale;
    float temperature, convertedTemperature;

    // Prompt the user to enter the temperature
    printf("Enter the temperature: ");
    scanf("%f", &temperature);

    // Prompt the user to enter the scale (C or F)
    printf("Enter the scale (C for Celsius, F for Fahrenheit): ");
    scanf(" %c", &scale);

    // Check the scale and perform the conversion
    if (scale == 'C' || scale == 'c') {
        // Convert Celsius to Fahrenheit
        convertedTemperature = (temperature * 9 / 5) + 32;
        printf("%.2f Celsius is equal to %.2f Fahrenheit\n", temperature, convertedTemperature);
    } else if (scale == 'F' || scale == 'f') {
        // Convert Fahrenheit to Celsius
        convertedTemperature = (temperature - 32) * 5 / 9;
        printf("%.2f Fahrenheit is equal to %.2f Celsius\n", temperature, convertedTemperature);
    } else {
        // Handle invalid scale input
        printf("Invalid scale entered. Please enter C for Celsius or F for Fahrenheit.\n");
    }

    return 0;
}

/*
 */