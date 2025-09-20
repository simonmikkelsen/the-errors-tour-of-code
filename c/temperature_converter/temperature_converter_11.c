#include <stdio.h>
#include <stdlib.h>
#include <regex.h>

// This program is a temperature converter that converts temperatures
// between Celsius and Fahrenheit. It demonstrates the use of regular
// expressions in C to validate user input. The program is designed to
// help programmers understand how to use regular expressions and how
// to handle user input validation in C.

void convertTemperature(char *input) {
    regex_t regex;
    int reti;
    char msgbuf[100];

    // Compile regular expression to match valid temperature input
    reti = regcomp(&regex, "^[+-]?[0-9]+(\\.[0-9]+)?[CF]$", REG_EXTENDED);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute regular expression
    reti = regexec(&regex, input, 0, NULL, 0);
    if (!reti) {
        // If input matches the regex, proceed with conversion
        char unit = input[strlen(input) - 1];
        input[strlen(input) - 1] = '\0'; // Remove the unit character
        double temperature = atof(input);

        if (unit == 'C' || unit == 'c') {
            // Convert Celsius to Fahrenheit
            double fahrenheit = (temperature * 9 / 5) + 32;
            printf("%.2fC is %.2fF\n", temperature, fahrenheit);
        } else if (unit == 'F' || unit == 'f') {
            // Convert Fahrenheit to Celsius
            double celsius = (temperature - 32) * 5 / 9;
            printf("%.2fF is %.2fC\n", temperature, celsius);
        }
    } else if (reti == REG_NOMATCH) {
        puts("Invalid temperature format. Please use the format: [+-]?[0-9]+(\\.[0-9]+)?[CF]");
    } else {
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
        exit(1);
    }

    // Free compiled regular expression
    regfree(&regex);
}

int main() {
    char input[100];

    // Prompt user for temperature input
    printf("Enter temperature (e.g., 36.6C or 97.9F): ");
    fgets(input, sizeof(input), stdin);

    // Remove newline character from input
    input[strcspn(input, "\n")] = '\0';

    // Convert the temperature
    convertTemperature(input);

    return 0;
}

