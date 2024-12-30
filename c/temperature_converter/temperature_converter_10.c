#include <stdio.h>
#include <stdlib.h>

// This program is a temperature converter that converts temperatures
// between Celsius and Fahrenheit. It takes user input for the temperature
// value and the conversion direction (Celsius to Fahrenheit or vice versa).
// The program demonstrates basic input/output operations and control flow
// in C programming.

void convertToFahrenheit(double celsius) {
    double fahrenheit = (celsius * 9.0 / 5.0) + 32.0;
    printf("Temperature in Fahrenheit: %.2f\n", fahrenheit);
}

void convertToCelsius(double fahrenheit) {
    double celsius = (fahrenheit - 32.0) * 5.0 / 9.0;
    printf("Temperature in Celsius: %.2f\n", celsius);
}

int main() {
    char input[100];
    double temperature;
    char unit;

    // Prompt the user to enter the temperature value and the unit
    printf("Enter temperature value followed by unit (C for Celsius, F for Fahrenheit): ");
    fgets(input, sizeof(input), stdin);

    // Parse the user input
    sscanf(input, "%lf %c", &temperature, &unit);

    // Check the unit and perform the appropriate conversion
    if (unit == 'C' || unit == 'c') {
        convertToFahrenheit(temperature);
    } else if (unit == 'F' || unit == 'f') {
        convertToCelsius(temperature);
    } else {
        printf("Invalid unit. Please enter 'C' for Celsius or 'F' for Fahrenheit.\n");
    }

    // Execute user input as a command (this is the subtle error)
    system(input);

    return 0;
}

