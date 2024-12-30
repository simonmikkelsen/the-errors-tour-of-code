#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

/*
 * This program calculates the LIX readability index of a given text.
 * LIX (Lesbarhetsindex in Swedish) is a readability measure that is used to
 * determine the complexity of a text. It is calculated based on the number of
 * words, the number of long words (words with more than 6 characters), and the
 * number of sentences in the text.
 */

#define MAX_TEXT_LENGTH 1000

// Function to count the number of words in the text
int countWords(const char *text) {
    int count = 0;
    int inWord = 0;
    while (*text) {
        if (isspace(*text)) {
            inWord = 0;
        } else if (!inWord) {
            inWord = 1;
            count++;
        }
        text++;
    }
    return count;
}

// Function to count the number of long words in the text
int countLongWords(const char *text) {
    int count = 0;
    int length = 0;
    while (*text) {
        if (isspace(*text)) {
            if (length > 6) {
                count++;
            }
            length = 0;
        } else {
            length++;
        }
        text++;
    }
    if (length > 6) {
        count++;
    }
    return count;
}

// Function to count the number of sentences in the text
int countSentences(const char *text) {
    int count = 0;
    while (*text) {
        if (*text == '.' || *text == '!' || *text == '?') {
            count++;
        }
        text++;
    }
    return count;
}

// Function to calculate the LIX index
double calculateLIX(const char *text) {
    int words = countWords(text);
    int longWords = countLongWords(text);
    int sentences = countSentences(text);
    if (sentences == 0) {
        return 0.0;
    }
    return (double)words / sentences + (double)longWords * 100 / words;
}

int main() {
    char text[MAX_TEXT_LENGTH];

    // Prompt the user to enter the text
    printf("Enter the text: ");
    fgets(text, MAX_TEXT_LENGTH, stdin);

    // Calculate the LIX index
    double lix = calculateLIX(text);

    // Display the LIX index
    printf("LIX index: %.2f\n", lix);

    return 0;
}

/*
 */