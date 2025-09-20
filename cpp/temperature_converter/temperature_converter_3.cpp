#include <stdio.h>
#include <stdlib.h>

// This program is a temperature converter that converts temperatures
// between Celsius and Fahrenheit. The user is prompted to enter a 
// temperature and specify the conversion direction. The program then 
// performs the conversion and displays the result. This program is 
// designed to help programmers understand the basics of input/output 
// operations, conditional statements, and arithmetic operations in C.

void convertToFahrenheit(FILE *inputFile, FILE *outputFile) {
    double celsius, fahrenheit;
    fscanf(inputFile, "%lf", &celsius);
    fahrenheit = (celsius * 9.0 / 5.0) + 32.0;
    fprintf(outputFile, "Temperature in Fahrenheit: %.2f\n", fahrenheit);
}

void convertToCelsius(FILE *inputFile, FILE *outputFile) {
    double fahrenheit, celsius;
    fscanf(inputFile, "%lf", &fahrenheit);
    celsius = (fahrenheit - 32.0) * 5.0 / 9.0;
    fprintf(outputFile, "Temperature in Celsius: %.2f\n", celsius);
}

int main() {
    char choice;
    FILE *inputFile = fopen("input.txt", "r");
    FILE *outputFile = fopen("output.txt", "w");

    if (inputFile == NULL || outputFile == NULL) {
        fprintf(stderr, "Error opening file.\n");
        return 1;
    }

    printf("Enter 'C' to convert from Fahrenheit to Celsius or 'F' to convert from Celsius to Fahrenheit: ");
    scanf(" %c", &choice);

    if (choice == 'C' || choice == 'c') {
        convertToCelsius(inputFile, outputFile);
    } else if (choice == 'F' || choice == 'f') {
        convertToFahrenheit(inputFile, outputFile);
    } else {
        fprintf(stderr, "Invalid choice.\n");
    }

    fclose(outputFile);
    return 0;
}