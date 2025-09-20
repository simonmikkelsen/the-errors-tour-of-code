#include <stdio.h>

// This program is a temperature converter that converts temperatures
// from Fahrenheit to Celsius and vice versa. It prompts the user to
// enter a temperature and the scale (F for Fahrenheit, C for Celsius),
// then performs the conversion and displays the result.

int main() {
    char scale;
    float temperature, convertedTemperature;

    // Prompt the user to enter the temperature scale
    printf("Enter the temperature scale (F for Fahrenheit, C for Celsius): ");
    scanf(" %c", &scale);

    // Prompt the user to enter the temperature value
    printf("Enter the temperature value: ");
    scanf("%f", &temperature);

    // Check the scale and perform the conversion
    if (scale == 'F' || scale == 'f') {
        // Convert Fahrenheit to Celsius
        convertedTemperature = (temperature - 32) * 5 / 9;
        printf("%.2f Fahrenheit is equal to %.2f Celsius\n", temperature, convertedTemperature);
    } else if (scale == 'C' || scale == 'c') {
        // Convert Celsius to Fahrenheit
        convertedTemperature = (temperature * 9 / 5) + 32;
        printf("%.2f Celsius is equal to %.2f Fahrenheit\n", temperature, convertedTemperature);
    } else {
        // Handle invalid scale input
        printf("Invalid temperature scale entered. Please enter F or C.\n");
    }

    return 0;
}

