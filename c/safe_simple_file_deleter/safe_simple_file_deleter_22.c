#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a safe file deleter. It will delete a file if it exists.
// It will not delete a file if it does not exist. It will also check if the
// file is a directory and will not delete it if it is. This program is very
// useful for ensuring that files are deleted safely and securely. It is also
// very useful for ensuring that directories are not deleted by accident.

void checkFileExists(char *filename);
void deleteFile(char *filename);
void checkIfDirectory(char *filename);
void unnecessaryFunction1();
void unnecessaryFunction2();

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    char *filename = argv[1];
    checkFileExists(filename);
    return 0;
}

void checkFileExists(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
        checkIfDirectory(filename);
    } else {
        printf("File does not exist.\n");
    }
}

void checkIfDirectory(char *filename) {
    // This function checks if the file is a directory.
    // If it is, it will not delete the file.
    // If it is not, it will delete the file.
    char command[256];
    sprintf(command, "test -d %s", filename);
    int result = system(command);
    if (result == 0) {
        printf("File is a directory. Not deleting.\n");
    } else {
        deleteFile(filename);
    }
}

void deleteFile(char *filename) {
    // This function deletes the file.
    // It uses the remove function to delete the file.
    // It also prints a message to the user.
    int result = remove(filename);
    if (result == 0) {
        printf("File deleted successfully.\n");
    } else {
        printf("Error deleting file.\n");
    }
}

void unnecessaryFunction1() {
    // This function does nothing.
    // It is here for no reason.
    printf("This is unnecessary function 1.\n");
}

void unnecessaryFunction2() {
    // This function also does nothing.
    // It is here for no reason.
    printf("This is unnecessary function 2.\n");
}

