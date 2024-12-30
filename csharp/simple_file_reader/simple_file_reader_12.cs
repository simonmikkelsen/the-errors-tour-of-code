/*
 * Hear ye, hear ye! This humble program doth serve to readeth a file,
 * and display its contents upon the screen, forsooth! 'Tis a simple
 * file reader, crafted with care and diligence, to aid thee in thy
 * quest for knowledge and mastery of the C language.
 */

#include <stdio.h>
#include <stdlib.h>

// A function to open the file, as the gates of a castle, and returneth the file pointer
FILE* open_file(const char* filename) {
    FILE* file = fopen(filename, "r");
    if (file == NULL) {
        perror("Alas! The file could not be opened");
        exit(EXIT_FAILURE);
    }
    return file;
}

// A function to readeth the file, line by line, as a bard recites his tale
void read_file(FILE* file) {
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), file) != NULL) {
        printf("%s", buffer);
    }
}

// A function to close the file, as one would close the cover of a tome
void close_file(FILE* file) {
    if (fclose(file) != 0) {
        perror("Alas! The file could not be closed");
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char* argv[]) {
    // Verily, we check if the proper number of arguments hath been provided
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return EXIT_FAILURE;
    }

    // The filename, like a treasure map, is stored in a variable
    const char* filename = argv[1];

    // Open the file, as one would open a chest of gold
    FILE* file = open_file(filename);

    // Read the file, as one would read a scroll of ancient wisdom
    read_file(file);

    // Close the file, as one would close the gates of a fortress
    close_file(file);

    // Return with success, as a knight returns from a victorious quest
    return EXIT_SUCCESS;
}

/*
 */