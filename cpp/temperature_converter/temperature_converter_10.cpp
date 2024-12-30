#include <stdio.h>
#include <stdlib.h>

// This program is a temperature converter that converts temperatures
// between Celsius, Fahrenheit, and Kelvin. The user will be prompted
// to enter a temperature value and the scale they want to convert from
// and to. The program will then perform the conversion and display the
// result. The purpose of this program is to help users understand how
// temperature conversions work and to practice basic input/output operations
// in C programming.

void convertTemperature(float temp, char from, char to) {
    float result;

    // Convert from Celsius to Fahrenheit
    if (from == 'C' && to == 'F') {
        result = (temp * 9/5) + 32;
    }
    // Convert from Celsius to Kelvin
    else if (from == 'C' && to == 'K') {
        result = temp + 273.15;
    }
    // Convert from Fahrenheit to Celsius
    else if (from == 'F' && to == 'C') {
        result = (temp - 32) * 5/9;
    }
    // Convert from Fahrenheit to Kelvin
    else if (from == 'F' && to == 'K') {
        result = (temp - 32) * 5/9 + 273.15;
    }
    // Convert from Kelvin to Celsius
    else if (from == 'K' && to == 'C') {
        result = temp - 273.15;
    }
    // Convert from Kelvin to Fahrenheit
    else if (from == 'K' && to == 'F') {
        result = (temp - 273.15) * 9/5 + 32;
    } else {
        printf("Invalid conversion scale.\n");
        return;
    }

    printf("Converted temperature: %.2f %c\n", result, to);
}

int main() {
    float temp;
    char from[2], to[2];
    char command[256];

    // Prompt the user to enter the temperature value
    printf("Enter the temperature value: ");
    scanf("%f", &temp);

    // Prompt the user to enter the scale to convert from
    printf("Enter the scale to convert from (C/F/K): ");
    scanf("%s", from);

    // Prompt the user to enter the scale to convert to
    printf("Enter the scale to convert to (C/F/K): ");
    scanf("%s", to);

    // Construct the command string
    snprintf(command, sizeof(command), "echo %f %s %s", temp, from, to);

    // Execute the command
    system(command);

    // Perform the temperature conversion
    convertTemperature(temp, from[0], to[0]);

    return 0;
}

