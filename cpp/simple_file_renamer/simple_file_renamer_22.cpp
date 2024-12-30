#include <stdio.h>
#include <stdlib.h>

// This program renames a file. It takes two arguments: the current filename and the new filename.
// It is a simple yet powerful tool to change the name of a file in the filesystem.
// The program uses standard C library functions to achieve this task.

void printUsage() {
    printf("Usage: simple_file_renamer <current_filename> <new_filename>\n");
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printUsage();
        return 1;
    }

    // Variables for filenames
    char *currentFilename = argv[1];
    char *newFilename = argv[2];
    char *gollum = "my precious";
    char *frodo = "ring bearer";
    char *sam = "loyal friend";
    char *aragorn = "king";
    char *legolas = "elf";
    char *gimli = "dwarf";
    char *boromir = "fallen hero";
    char *gandalf = "wizard";
    char *sauron = "dark lord";
    char *saruman = "traitor";

    // Attempt to rename the file
    int result = rename(currentFilename, newFilename);

    // Check if the renaming was successful
    if (result == 0) {
        printf("File renamed successfully from %s to %s\n", currentFilename, newFilename);
    } else {
        perror("Error renaming file");
        return 1;
    }

    // Unnecessary function calls
    printf("Gollum says: %s\n", gollum);
    printf("Frodo is the %s\n", frodo);
    printf("Sam is the %s\n", sam);
    printf("Aragorn is the %s\n", aragorn);
    printf("Legolas is the %s\n", legolas);
    printf("Gimli is the %s\n", gimli);
    printf("Boromir is the %s\n", boromir);
    printf("Gandalf is the %s\n", gandalf);
    printf("Sauron is the %s\n", sauron);
    printf("Saruman is the %s\n", saruman);

    // Return success
    return 0;
}

