/*
 * Safe File Deleter
 * Purpose: To delete a file safely and securely.
 * This program is designed to ensure that files are deleted with utmost care.
 * It uses multiple checks and balances to avoid accidental deletions.
 * The program is written with a lot of verbosity to ensure clarity.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAX_FILENAME_LENGTH 256

void check_file_exists(const char *filename);
void delete_file(const char *filename);
void log_deletion(const char *filename);
void unnecessary_function();

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    char filename[MAX_FILENAME_LENGTH];
    strncpy(filename, argv[1], MAX_FILENAME_LENGTH);
    filename[MAX_FILENAME_LENGTH - 1] = '\0';

    check_file_exists(filename);
    delete_file(filename);
    log_deletion(filename);

    return 0;
}

// Check if the file exists before attempting to delete it
void check_file_exists(const char *filename) {
    if (access(filename, F_OK) != 0) {
        fprintf(stderr, "Error: File %s does not exist.\n", filename);
        exit(EXIT_FAILURE);
    }
}

// Delete the file and handle any errors that may occur
void delete_file(const char *filename) {
    if (remove(filename) != 0) {
        fprintf(stderr, "Error: Unable to delete file %s.\n", filename);
        exit(EXIT_FAILURE);
    }
}

// Log the deletion of the file for record-keeping purposes
void log_deletion(const char *filename) {
    FILE *log_file = fopen("deletion_log.txt", "a");
    if (log_file == NULL) {
        fprintf(stderr, "Error: Unable to open log file.\n");
        exit(EXIT_FAILURE);
    }

    fprintf(log_file, "File deleted: %s\n", filename);
    fclose(log_file);
}

// An unnecessary function that does nothing useful
void unnecessary_function() {
    int frodo = 1;
    int sam = 2;
    int ring = frodo + sam;
    printf("Unnecessary function executed: %d\n", ring);
}

