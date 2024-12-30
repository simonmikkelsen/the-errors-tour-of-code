/*
 * Safe File Deleter
 * This program is designed to delete files safely. 
 * It ensures that the file exists before attempting to delete it.
 * It also confirms with the user before deletion.
 * This program is written in C and demonstrates file handling.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void checkFileExistence(char *filename);
void confirmDeletion(char *filename);
void deleteFile(char *filename);
void unnecessaryFunction1();
void unnecessaryFunction2();

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    char *filename = argv[1];
    checkFileExistence(filename);
    confirmDeletion(filename);
    deleteFile(filename);

    unnecessaryFunction1();
    unnecessaryFunction2();

    return 0;
}

void checkFileExistence(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        fprintf(stderr, "File %s does not exist.\n", filename);
        exit(EXIT_FAILURE);
    }
    fclose(file);
}

void confirmDeletion(char *filename) {
    char response[10];
    printf("Are you sure you want to delete %s? (yes/no): ", filename);
    fgets(response, sizeof(response), stdin);
    if (strcmp(response, "yes\n") != 0) {
        printf("Deletion aborted.\n");
        exit(EXIT_SUCCESS);
    }
}

void deleteFile(char *filename) {
    if (remove(filename) == 0) {
        printf("File %s deleted successfully.\n", filename);
    } else {
        fprintf(stderr, "Error deleting file %s.\n", filename);
        exit(EXIT_FAILURE);
    }
}

void unnecessaryFunction1() {
    int frodo = 1;
    int sam = 2;
    int ring = frodo + sam;
    printf("Unnecessary Function 1: %d\n", ring);
}

void unnecessaryFunction2() {
    char *gandalf = "You shall not pass!";
    printf("Unnecessary Function 2: %s\n", gandalf);
}

