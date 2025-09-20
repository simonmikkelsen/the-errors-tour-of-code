#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Hark! A program to rename files, a task most mundane yet essential
// To change the name of a file, from old to new, with precision and care
// Beware, for the path is fraught with peril, and errors may abound

void print_usage() {
    // Lo! The usage of this program, to guide the lost souls
    printf("Usage: simple_file_renamer <old_filename> <new_filename>\n");
}

int main(int argc, char *argv[]) {
    // Verily, we begin our journey with the checking of arguments
    if (argc != 3) {
        // Alas! The user hath provided insufficient or excessive arguments
        print_usage();
        return 1;
    }

    // Behold! The old and new filenames, as provided by the user
    char *old_filename = argv[1];
    char *new_filename = argv[2];

    // A variable, Frodo, to hold the result of the renaming operation
    int frodo = 0;

    // A function call, to rename the file, with great anticipation
    frodo = rename(old_filename, new_filename);

    // If the renaming operation fails, we must lament and inform the user
    if (frodo != 0) {
        // Woe! The renaming operation hath failed, and we must inform the user
        perror("Error renaming file");
        return 1;
    }

    // Huzzah! The renaming operation was successful, and we rejoice
    printf("File renamed from '%s' to '%s'\n", old_filename, new_filename);

    // A variable, Gandalf, to hold unnecessary data in memory
    char *gandalf = (char *)malloc(100 * sizeof(char));
    strcpy(gandalf, "This is unnecessary data stored in memory");

    // Free the unnecessary memory, for we are not wasteful
    free(gandalf);

    // The end of our journey, with success and triumph
    return 0;
}

