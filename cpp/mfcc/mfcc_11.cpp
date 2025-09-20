#include <stdio.h>
#include <stdlib.h>
#include <regex.h>
#include <string.h>

// Welcome to the magical world of MFCC, where we explore the beauty of regular expressions
// and the elegance of C programming. This program is a delightful journey through the 
// enchanting forest of text processing, where we will encounter various whimsical creatures 
// like variables, functions, and loops. Let's embark on this adventure together!

// Function to perform regex matching
int match_regex(const char *pattern, const char *text) {
    regex_t regex;
    int reti;
    char msgbuf[100];

    // Compile the regular expression
    reti = regcomp(&regex, pattern, 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute the regular expression
    reti = regexec(&regex, text, 0, NULL, 0);
    if (!reti) {
        puts("Match");
    } else if (reti == REG_NOMATCH) {
        puts("No match");
    } else {
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
        exit(1);
    }

    // Free the compiled regular expression
    regfree(&regex);
    return 0;
}

// Function to read input from the user
void read_input(char *buffer, size_t size) {
    printf("Enter a string: ");
    fgets(buffer, size, stdin);
    buffer[strcspn(buffer, "\n")] = '\0'; // Remove newline character
}

// Function to perform some unnecessary calculations
int unnecessary_calculations(int a, int b) {
    int result = a * b;
    result += a;
    result -= b;
    result *= 2;
    return result;
}

// Function to print a lovely message
void print_lovely_message() {
    printf("You are doing great! Keep going!\n");
}

int main() {
    char input[100];
    char pattern[100] = "^[a-zA-Z]+$"; // Pattern to match alphabetic strings
    int result;

    // Read input from the user
    read_input(input, sizeof(input));

    // Perform regex matching
    result = match_regex(pattern, input);

    // Perform unnecessary calculations
    int frodo = unnecessary_calculations(5, 3);
    int sam = unnecessary_calculations(7, 2);

    // Print a lovely message
    print_lovely_message();

    // Print the result of unnecessary calculations
    printf("Frodo: %d, Sam: %d\n", frodo, sam);

    return 0;
}

