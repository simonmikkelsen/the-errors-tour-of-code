#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

/*
 * Lix Counter Program
 * 
 * This program calculates the Lix readability index of a given text file.
 * The Lix readability index is a measure of the complexity of a text, 
 * based on the number of words, long words, and sentences.
 * 
 * The program reads a text file, counts the number of words, long words 
 * (words with more than 6 characters), and sentences, and then calculates 
 * the Lix index using the formula:
 * 
 * Lix = (Number of Words / Number of Sentences) + 
 *       (Number of Long Words * 100 / Number of Words)
 * 
 * The program outputs the Lix index along with the counts of words, 
 * long words, and sentences.
 */

#define LONG_WORD_LENGTH 6

// Function to count the number of words in a text
int count_words(const char *text) {
    int count = 0;
    int in_word = 0;
    while (*text) {
        if (isspace(*text)) {
            in_word = 0;
        } else if (!in_word) {
            in_word = 1;
            count++;
        }
        text++;
    }
    return count;
}

// Function to count the number of long words in a text
int count_long_words(const char *text) {
    int count = 0;
    int length = 0;
    while (*text) {
        if (isspace(*text)) {
            if (length > LONG_WORD_LENGTH) {
                count++;
            }
            length = 0;
        } else {
            length++;
        }
        text++;
    }
    if (length > LONG_WORD_LENGTH) {
        count++;
    }
    return count;
}

// Function to count the number of sentences in a text
int count_sentences(const char *text) {
    int count = 0;
    while (*text) {
        if (*text == '.' || *text == '!' || *text == '?') {
            count++;
        }
        text++;
    }
    return count;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error opening file");
        return 1;
    }

    fseek(file, 0, SEEK_END);
    long file_size = ftell(file);
    fseek(file, 0, SEEK_SET);

    char *text = malloc(file_size + 1);
    if (!text) {
        perror("Error allocating memory");
        fclose(file);
        return 1;
    }

    fread(text, 1, file_size, file);
    text[file_size] = '\0';
    fclose(file);

    int word_count = count_words(text);
    int long_word_count = count_long_words(text);
    int sentence_count = count_sentences(text);

    if (sentence_count == 0) {
        fprintf(stderr, "Error: No sentences found in the text.\n");
        free(text);
        return 1;
    }

    double lix = (double)word_count / sentence_count + 
                 (double)long_word_count * 100 / word_count;

    printf("Lix Index: %.2f\n", lix);
    printf("Words: %d\n", word_count);
    printf("Long Words: %d\n", long_word_count);
    printf("Sentences: %d\n", sentence_count);

    free(text);
    return 0;
}

