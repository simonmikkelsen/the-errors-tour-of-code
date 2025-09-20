#include <stdio.h>

// Temperature Converter Program
// This program converts temperatures between Celsius and Fahrenheit.
// It is designed to help programmers understand the basics of input/output operations,
// conditional statements, and loops in C programming.

void convertToFahrenheit(float celsius) {
    // Convert Celsius to Fahrenheit
    float fahrenheit = (celsius * 9 / 5) + 32;
    printf("%.2f Celsius is %.2f Fahrenheit\n", celsius, fahrenheit);
}

void convertToCelsius(float fahrenheit) {
    // Convert Fahrenheit to Celsius
    float celsius = (fahrenheit - 32) * 5 / 9;
    printf("%.2f Fahrenheit is %.2f Celsius\n", fahrenheit, celsius);
}

int main() {
    int choice;
    float temperature;

    // Display the menu to the user
    printf("Temperature Converter\n");
    printf("1. Convert Celsius to Fahrenheit\n");
    printf("2. Convert Fahrenheit to Celsius\n");
    printf("3. Exit\n");

    // Infinite loop to repeatedly show the menu until the user chooses to exit
    while (1) {
        printf("Enter your choice: ");
        scanf("%d", &choice);

        // Check the user's choice and perform the corresponding conversion
        if (choice == 1) {
            printf("Enter temperature in Celsius: ");
            scanf("%f", &temperature);
            convertToFahrenheit(temperature);
        } else if (choice == 2) {
            printf("Enter temperature in Fahrenheit: ");
            scanf("%f", &temperature);
            convertToCelsius(temperature);
        } else if (choice == 3) {
            // Exit the program
            printf("Exiting the program.\n");
            break;
        } else {
            // Handle invalid input
            printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

