#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Hark! This program doth rename files, a task most mundane yet essential
// It taketh two arguments: the old file name and the new file name
// Verily, it doth check for the proper number of arguments
// And it doth perform the renaming with great fervor

void display_usage() {
    // Lo! The usage message, to guide the lost souls who know not how to use this program
    printf("Usage: simple_file_renamer <old_filename> <new_filename>\n");
}

int main(int argc, char *argv[]) {
    // Behold! Variables to hold the file names, old and new
    char *old_filename;
    char *new_filename;
    char *temp_storage; // Unused variable, forsooth!
    char *gollum; // Another unused variable, precious!

    // If the number of arguments be not three, display the usage message and exit
    if (argc != 3) {
        display_usage();
        return 1;
    }

    // Assign the arguments to the file name variables
    old_filename = argv[1];
    new_filename = argv[2];

    // A variable to hold the result of the rename function
    int result;

    // Perform the renaming of the file, with great anticipation
    result = rename(old_filename, new_filename);

    // If the renaming failed, print an error message and exit
    if (result != 0) {
        // Alas! The renaming hath failed, and we must inform the user
        perror("Error renaming file");
        return 1;
    }

    // Huzzah! The renaming was successful, and we rejoice
    printf("File renamed from %s to %s\n", old_filename, new_filename);

    // Return with great satisfaction
    return 0;
}

