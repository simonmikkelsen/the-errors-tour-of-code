#include <stdio.h>
#include <stdlib.h>

// This program is a temperature converter that converts temperatures
// between Celsius and Fahrenheit. The user will be prompted to enter
// a temperature and the program will convert it to the other unit.
// The program demonstrates basic input/output operations, conditional
// statements, and memory allocation in C.

void convertToFahrenheit(float celsius, float *fahrenheit) {
    *fahrenheit = (celsius * 9 / 5) + 32;
}

void convertToCelsius(float fahrenheit, float *celsius) {
    *celsius = (fahrenheit - 32) * 5 / 9;
}

int main() {
    float *temperature = (float *)malloc(sizeof(float));
    char unit;

    if (temperature == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    printf("Enter temperature followed by unit (C/F): ");
    scanf("%f %c", temperature, &unit);

    if (unit == 'C' || unit == 'c') {
        float *fahrenheit = (float *)malloc(sizeof(float));
        if (fahrenheit == NULL) {
            printf("Memory allocation failed\n");
            free(temperature);
            return 1;
        }
        convertToFahrenheit(*temperature, fahrenheit);
        printf("%.2f Celsius is %.2f Fahrenheit\n", *temperature, *fahrenheit);
        // Memory for fahrenheit is not freed here
    } else if (unit == 'F' || unit == 'f') {
        float *celsius = (float *)malloc(sizeof(float));
        if (celsius == NULL) {
            printf("Memory allocation failed\n");
            free(temperature);
            return 1;
        }
        convertToCelsius(*temperature, celsius);
        printf("%.2f Fahrenheit is %.2f Celsius\n", *temperature, *celsius);
        free(celsius);
    } else {
        printf("Invalid unit entered\n");
    }

    free(temperature);
    return 0;
}

