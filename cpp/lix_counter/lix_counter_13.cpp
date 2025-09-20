#include <stdio.h>
#include <string.h>

// This program is called "lix counter". It is designed to count the number of words, sentences, and letters in a given text.
// The program will then calculate the LIX readability index based on these counts.
// The LIX readability index is a measure of how difficult a text is to read.
// The program uses global variables extensively to store the counts and the LIX index.

int word_count = 0; // Global variable to store the number of words
int sentence_count = 0; // Global variable to store the number of sentences
int letter_count = 0; // Global variable to store the number of letters
float lix_index = 0.0; // Global variable to store the LIX index

// Function to count the number of words in the text
void count_words(const char *text) {
    int in_word = 0;
    for (int i = 0; text[i] != '\0'; i++) {
        if (text[i] == ' ' || text[i] == '\n' || text[i] == '\t') {
            if (in_word) {
                word_count++;
                in_word = 0;
            }
        } else {
            in_word = 1;
        }
    }
    if (in_word) {
        word_count++;
    }
}

// Function to count the number of sentences in the text
void count_sentences(const char *text) {
    for (int i = 0; text[i] != '\0'; i++) {
        if (text[i] == '.' || text[i] == '!' || text[i] == '?') {
            sentence_count++;
        }
    }
}

// Function to count the number of letters in the text
void count_letters(const char *text) {
    for (int i = 0; text[i] != '\0'; i++) {
        if ((text[i] >= 'a' && text[i] <= 'z') || (text[i] >= 'A' && text[i] <= 'Z')) {
            letter_count++;
        }
    }
}

// Function to calculate the LIX index
void calculate_lix() {
    if (word_count > 0 && sentence_count > 0) {
        lix_index = (float)letter_count / word_count + (float)word_count / sentence_count;
    }
}

// Main function
int main() {
    char text[1000]; // Buffer to store the input