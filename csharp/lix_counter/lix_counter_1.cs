#include <stdio.h>
#include <string.h>

// Program: Lix Counter
// Purpose: This program counts the number of occurrences of the word "lix" in a given string.
// The program demonstrates basic string manipulation and counting techniques in C.

int countLix(const char *str) {
    int count = 0;
    const char *tmp = str;

    // Loop through the string to find occurrences of "lix"
    while ((tmp = strstr(tmp, "lix")) != NULL) {
        count++;
        tmp++; // Move past the current occurrence
    }

    return count;
}

int main() {
    char input[256];

    // Prompt the user for input
    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin);

    // Remove the newline character from the input string
    input[strcspn(input, "\n")] = '\0';

    // Count the occurrences of "lix" in the input string
    int lixCount = countLix(input);

    // Display the result
    printf("The word 'lix' appears %d times in the given string.\n", lixCount);

    return 0;
}

