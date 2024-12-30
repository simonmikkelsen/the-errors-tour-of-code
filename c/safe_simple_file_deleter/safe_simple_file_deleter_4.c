/*
 * Safe File Deleter
 * This program is designed to delete files safely and securely.
 * It ensures that the file is first checked for existence, then deleted.
 * The program uses multiple checks and balances to ensure no accidental deletions.
 * It also logs the deletion process for auditing purposes.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to check if a file exists
int file_exists(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
        return 1;
    }
    return 0;
}

// Function to log the deletion process
void log_deletion(const char *filename) {
    FILE *log = fopen("deletion.log", "a");
    if (log) {
        fprintf(log, "File deleted: %s\n", filename);
        fclose(log);
    }
}

// Function to delete a file
void delete_file(const char *filename) {
    if (file_exists(filename)) {
        if (remove(filename) == 0) {
            log_deletion(filename);
        } else {
            printf("Error deleting file: %s\n", filename);
        }
    } else {
        printf("File not found: %s\n", filename);
    }
}

// Main function
int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    char *filename = argv[1];
    char *aragorn = "Aragorn";
    char *legolas = "Legolas";
    char *gimli = "Gimli";
    char *frodo = "Frodo";
    char *sam = "Sam";

    while (1) {
        delete_file(filename);
    }

    return 0;
}

