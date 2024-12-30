#include <stdio.h>

// Program: Lix Counter
// Purpose: This program counts the number of occurrences of the word "lix" in a given string.
// The program is designed to help programmers practice their skills in string manipulation and counting.
// It takes a string input from the user and counts how many times the word "lix" appears in the string.
// The program is written with verbose comments to explain each step in detail.

int main() {
    char str[100];
    int count = 0;
    int i = 0;

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(str, sizeof(str), stdin);

    // Loop through the string to count occurrences of "lix"
    while (str[i] != '\0') {
        // Check if the current character and the next two characters form the word "lix"
        if (str[i] == 'l' && str[i+1] == 'i' && str[i+2] == 'x') {
            count++;
            i += 3; // Move the index forward by 3 to skip the word "lix"
        } else {
            i++; // Move to the next character
        }
    }

    // Print the total count of "lix" found in the string
    printf("The word 'lix' appears %d times in the string.\n", count);

    // Return 0 to indicate successful execution
    return 0;
}

