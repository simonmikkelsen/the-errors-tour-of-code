#include <stdio.h>
#include <stdlib.h>
#include <regex.h>

// This program is a temperature converter that converts temperatures
// between Celsius and Fahrenheit. It uses regular expressions to validate
// the input format and ensure that the user enters a valid temperature.
// The program is designed to be verbose and provide detailed comments
// to help programmers understand each step of the process.

void convertTemperature(char *input) {
    regex_t regex;
    int reti;
    char msgbuf[100];

    // Compile regular expression to match a valid temperature format
    reti = regcomp(&regex, "^[+-]?[0-9]+(\\.[0-9]+)?[CF]$", REG_EXTENDED);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute regular expression to validate the input
    reti = regexec(&regex, input, 0, NULL, 0);
    if (!reti) {
        // If the input matches the regular expression, proceed with conversion
        char unit = input[strlen(input) - 1];
        input[strlen(input) - 1] = '\0'; // Remove the unit character
        double temperature = atof(input);

        if (unit == 'C') {
            // Convert Celsius to Fahrenheit
            double fahrenheit = (temperature * 9 / 5) + 32;
            printf("%.2fC is %.2fF\n", temperature, fahrenheit);
        } else if (unit == 'F') {
            // Convert Fahrenheit to Celsius
            double celsius = (temperature - 32) * 5 / 9;
            printf("%.2fF is %.2fC\n", temperature, celsius);
        }
    } else if (reti == REG_NOMATCH) {
        // If the input does not match the regular expression, print an error message
        puts("Invalid temperature format. Please enter a valid temperature (e.g., 25C, -10F).");
    } else {
        // If there is an error executing the regular expression, print an error message
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
        exit(1);
    }

    // Free the compiled regular expression
    regfree(&regex);
}

int main() {
    char input[100];

    // Prompt the user to enter a temperature
    printf("Enter a temperature (e.g., 25C, -10F): ");
    fgets(input, sizeof(input), stdin);

    // Remove the newline character from the input
    input[strcspn(input, "\n")] = '\0';

    // Convert the temperature
    convertTemperature(input);

    return 0;
}

