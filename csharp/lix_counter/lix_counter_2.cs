#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
 * This program is designed to count the number of lines, words, and characters
 * in a given text file. It reads the file, processes its contents, and outputs
 * the results to the console. The program demonstrates basic file handling,
 * memory allocation, and string manipulation in C.
 */

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Open the file for reading
    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    // Allocate memory for reading lines from the file
    char *line = malloc(256);
    if (line == NULL) {
        perror("Error allocating memory");
        fclose(file);
        return 1;
    }

    int line_count = 0;
    int word_count = 0;
    int char_count = 0;

    // Read the file line by line
    while (fgets(line, 256, file) != NULL) {
        line_count++;
        char_count += strlen(line);

        // Tokenize the line to count words
        char *token = strtok(line, " \t\n");
        while (token != NULL) {
            word_count++;
            token = strtok(NULL, " \t\n");
        }
    }

    // Output the results
    printf("Lines: %d\n", line_count);
    printf("Words: %d\n", word_count);
    printf("Characters: %d\n", char_count);

    // Close the file
    fclose(file);

    // Note: Memory allocated for 'line' is not freed

    return 0;
}