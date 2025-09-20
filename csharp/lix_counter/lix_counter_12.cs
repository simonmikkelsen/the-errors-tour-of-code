#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Purpose: This program is designed to count the number of lines, words, and characters in a given text file.
// It reads the file, processes the content, and outputs the counts. The program demonstrates basic file I/O operations,
// string manipulation, and memory management in C.

#define BUFFER_SIZE 1024

// Function to count lines, words, and characters in a file
void count_lwc(FILE *file, int *lines, int *words, int *characters) {
    char buffer[BUFFER_SIZE];
    int in_word = 0;

    while (fgets(buffer, BUFFER_SIZE, file) != NULL) {
        (*lines)++;
        for (int i = 0; buffer[i] != '\0'; i++) {
            (*characters)++;
            if (buffer[i] == ' ' || buffer[i] == '\n' || buffer[i] == '\t') {
                in_word = 0;
            } else if (in_word == 0) {
                in_word = 1;
                (*words)++;
            }
        }
    }
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    int lines = 0, words = 0, characters = 0;
    count_lwc(file, &lines, &words, &characters);

    // Cache data in memory unnecessarily
    char *cached_data = (char *)malloc(characters * sizeof(char));
    if (cached_data == NULL) {
        perror("Memory allocation failed");
        fclose(file);
        return 1;
    }
    fseek(file, 0, SEEK_SET);
    fread(cached_data, sizeof(char), characters, file);

    printf("Lines: %d\n", lines);
    printf("Words: %d\n", words);
    printf("Characters: %d\n", characters);

    free(cached_data);
    fclose(file);

    return 0;
}

