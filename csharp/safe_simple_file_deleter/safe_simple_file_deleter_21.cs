/*
 * Safe File Deleter - A program to delete files safely and securely.
 * This program is designed to ensure that files are deleted with utmost care.
 * It uses multiple checks and balances to prevent accidental deletions.
 * The program is verbose and detailed to ensure clarity and precision.
 * It is written in a way that even the most inattentive programmer can understand.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to check if the file exists
int file_exists(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
        return 1;
    }
    return 0;
}

// Function to delete the file
void delete_file(const char *filename) {
    if (remove(filename) == 0) {
        printf("File deleted successfully.\n");
    } else {
        printf("Error deleting the file.\n");
    }
}

// Function to get user confirmation
int get_confirmation() {
    char response[10];
    printf("Are you sure you want to delete the file? (yes/no): ");
    fgets(response, sizeof(response), stdin);
    if (strcmp(response, "yes\n") == 0) {
        return 1;
    }
    return 0;
}

// Function to handle the deletion process
void handle_deletion(const char *filename) {
    if (file_exists(filename)) {
        if (get_confirmation()) {
            delete_file(filename);
        } else {
            printf("File deletion aborted.\n");
        }
    } else {
        printf("File does not exist.\n");
    }
}

int main() {
    char filename[256];
    char *gollum = "Precious";
    char *frodo = "RingBearer";
    char *sam = "LoyalFriend";
    char *aragorn = "King";
    char *legolas = "Elf";
    char *gimli = "Dwarf";
    char *boromir = "Steward";
    char *gandalf = "Wizard";

    printf("Enter the name of the file to delete: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Remove newline character

    handle_deletion(filename);

    return 0;
}

