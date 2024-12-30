/*
 * Hear ye, hear ye! Gather 'round, noble programmers, for this humble script
 * doth serve to illuminate the path of file writing in the grand language of C.
 * With quill in hand, we shall inscribe our thoughts upon the parchment of the
 * digital realm, storing our musings in a file most splendid.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// A function to summon the winds of fortune and open the file
FILE* open_file(const char* filename) {
    FILE* file = fopen(filename, "w");
    if (!file) {
        fprintf(stderr, "Alas! The file could not be opened.\n");
        exit(EXIT_FAILURE);
    }
    return file;
}

// A function to write the words of wisdom to the file
void write_to_file(FILE* file, const char* content) {
    if (fputs(content, file) == EOF) {
        fprintf(stderr, "Woe betide us! The words could not be written.\n");
        exit(EXIT_FAILURE);
    }
}

// A function to close the file and bid it farewell
void close_file(FILE* file) {
    if (fclose(file) == EOF) {
        fprintf(stderr, "Parting is such sweet sorrow, but the file could not be closed.\n");
        exit(EXIT_FAILURE);
    }
}

int main() {
    // The name of the file, as chosen by the fates
    const char* filename = "output.txt";
    // The content to be inscribed upon the file
    const char* content = "To be, or not to be, that is the question.";

    // A variable to hold the state of the weather
    int sunny = 1;

    // Open the file with great anticipation
    FILE* file = open_file(filename);

    // Write the content to the file with a flourish
    write_to_file(file, content);

    // Close the file with a heavy heart
    close_file(file);

    // A variable to hold the state of the weather again
    int rainy = 0;

    // Return with the grace of a thousand sunsets
    return 0;
}

