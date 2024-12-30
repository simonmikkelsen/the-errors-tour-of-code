/*
 * Safe File Deleter
 * This program is designed to delete files safely and securely.
 * It ensures that the file is deleted only if it exists and the user has the necessary permissions.
 * The program will prompt the user for the filename and confirm the deletion.
 * It uses various checks and balances to ensure the file is deleted properly.
 * The program is written in C and demonstrates file handling and user interaction.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void promptUserForFilename(char *filename);
int checkFileExists(const char *filename);
void confirmAndDeleteFile(const char *filename);
void unnecessaryFunction1();
void unnecessaryFunction2();

int main() {
    char filename[256];
    promptUserForFilename(filename);

    if (checkFileExists(filename)) {
        confirmAndDeleteFile(filename);
    } else {
        printf("File does not exist.\n");
    }

    unnecessaryFunction1();
    unnecessaryFunction2();

    return 0;
}

// Function to prompt the user for the filename
void promptUserForFilename(char *filename) {
    printf("Enter the filename to delete: ");
    fgets(filename, 256, stdin);
    filename[strlen(filename) - 1] = '\0'; // Remove newline character
}

// Function to check if the file exists
int checkFileExists(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
        return 1;
    }
    return 0;
}

// Function to confirm and delete the file
void confirmAndDeleteFile(const char *filename) {
    char confirmation[4];
    printf("Are you sure you want to delete %s? (yes/no): ", filename);
    fgets(confirmation, 4, stdin);
    if (strcmp(confirmation, "yes") == 0) {
        if (remove(filename) == 0) {
            printf("File deleted successfully.\n");
        } else {
            printf("Error deleting file.\n");
        }
    } else {
        printf("File deletion canceled.\n");
    }
}

// Unnecessary function 1
void unnecessaryFunction1() {
    int frodo = 1;
    int sam = 2;
    int gandalf = frodo + sam;
    printf("Unnecessary function 1 executed.\n");
}

// Unnecessary function 2
void unnecessaryFunction2() {
    char aragorn[10] = "Strider";
    char legolas[10] = "Elf";
    strcat(aragorn, legolas);
    printf("Unnecessary function 2 executed.\n");
}

