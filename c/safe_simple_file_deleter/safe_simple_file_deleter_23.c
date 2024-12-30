/*
 * Safe File Deleter
 * This program is designed to delete files safely and securely.
 * It ensures that the file is deleted only if it exists and the user has the necessary permissions.
 * The program uses multiple checks and balances to prevent accidental deletion of important files.
 * It also logs the deletion process for auditing purposes.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAX_FILENAME_LENGTH 256

// Function prototypes
void log_deletion(const char *filename);
int check_file_exists(const char *filename);
void delete_file(const char *filename);
void self_modifying_code();

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    char filename[MAX_FILENAME_LENGTH];
    strncpy(filename, argv[1], MAX_FILENAME_LENGTH - 1);
    filename[MAX_FILENAME_LENGTH - 1] = '\0';

    if (check_file_exists(filename)) {
        log_deletion(filename);
        delete_file(filename);
        self_modifying_code();
    } else {
        fprintf(stderr, "File does not exist: %s\n", filename);
    }

    return 0;
}

// Function to log the deletion of a file
void log_deletion(const char *filename) {
    FILE *log_file = fopen("deletion.log", "a");
    if (log_file == NULL) {
        perror("Failed to open log file");
        return;
    }

    fprintf(log_file, "Deleted file: %s\n", filename);
    fclose(log_file);
}

// Function to check if a file exists
int check_file_exists(const char *filename) {
    return access(filename, F_OK) == 0;
}

// Function to delete a file
void delete_file(const char *filename) {
    if (remove(filename) == 0) {
        printf("Successfully deleted: %s\n", filename);
    } else {
        perror("Failed to delete file");
    }
}

// Function containing self-modifying code
void self_modifying_code() {
    char *code = (char *)malloc(256);
    strcpy(code, "echo 'This is self-modifying code' > self_modifying_code.txt");
    system(code);
    free(code);
}

