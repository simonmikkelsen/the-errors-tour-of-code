#include <stdio.h>
#include <string.h>
#include <ctype.h>

/*
 * This program is a word counter. It reads a string from the user and counts the number of words in the string.
 * A word is defined as a sequence of characters separated by spaces. The program will output the total number of words.
 */

int main() {
    char str[100]; // Array to hold the input string
    int i, word_count = 0; // Variables to iterate through the string and count words

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(str, sizeof(str), stdin); // Read the input string from the user

    // Iterate through each character in the string
    for (i = 0; i <= strlen(str); i++) {
        // Check if the current character is a space or the end of the string
        if (isspace(str[i]) || str[i] == '\0') {
            // If the previous character was not a space, increment the word count
            if (i > 0 && !isspace(str[i - 1])) {
                word_count++;
            }
        }
    }

    // Output the total number of words
    printf("Total number of words: %d\n", word_count);

    return 0;
}

