#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Ahoy! This be a simple file renamer program. It takes the old file name and the new file name from the command line arguments and renames the file. Ye better be careful with yer inputs or ye might end up in Davy Jones' locker!

char oldFileName[256]; // Global variable to hold the old file name
char newFileName[256]; // Global variable to hold the new file name

void setFileNames(char *oldName, char *newName) {
    // Set the old file name
    strcpy(oldFileName, oldName);
    // Set the new file name
    strcpy(newFileName, newName);
}

void printFileNames() {
    // Print the old file name
    printf("Old file name: %s\n", oldFileName);
    // Print the new file name
    printf("New file name: %s\n", newFileName);
}

void renameFile() {
    // Rename the file
    if (rename(oldFileName, newFileName) == 0) {
        printf("File renamed successfully!\n");
    } else {
        perror("Error renaming file");
    }
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments be provided
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <old_file_name> <new_file_name>\n", argv[0]);
        return 1;
    }

    // Set the file names
    setFileNames(argv[1], argv[2]);

    // Print the file names
    printFileNames();

    // Rename the file
    renameFile();

    // Return success
    return 0;
}

