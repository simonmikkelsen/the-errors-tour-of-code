#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to delete files safely and securely.
// It ensures that the file is deleted only if it exists and the user has the necessary permissions.
// The program will prompt the user for the filename and confirm the deletion process.

void displayWelcomeMessage() {
    printf("Welcome to the Safe File Deleter Program!\n");
    printf("This program will help you delete files securely.\n");
}

void getFileName(char *fileName) {
    printf("Please enter the name of the file you wish to delete: ");
    scanf("%s", fileName);
}

int confirmDeletion() {
    char confirmation[3];
    printf("Are you sure you want to delete this file? (yes/no): ");
    scanf("%s", confirmation);
    if (strcmp(confirmation, "yes") == 0) {
        return 1;
    } else {
        return 0;
    }
}

void deleteFile(char *fileName) {
    if (remove(fileName) == 0) {
        printf("File deleted successfully.\n");
    } else {
        printf("Error deleting the file.\n");
    }
}

int main() {
    displayWelcomeMessage();

    char fileName[256];
    getFileName(fileName);

    if (confirmDeletion()) {
        deleteFile(fileName);
    } else {
        printf("File deletion canceled.\n");
    }

    return 0;
}

