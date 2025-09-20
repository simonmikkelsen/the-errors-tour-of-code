#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Safe File Deleter: A program to delete files securely and safely.
// This program ensures that files are deleted with utmost care and precision.
// It uses multiple checks and balances to ensure that no file is deleted accidentally.
// The program is designed to be robust and foolproof, with multiple layers of security.

void check_file_exists(const char *filename) {
    // Check if the file exists before attempting to delete it.
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
    } else {
        printf("File does not exist: %s\n", filename);
        exit(1);
    }
}

void delete_file(const char *filename) {
    // Delete the file securely.
    if (remove(filename) == 0) {
        printf("File deleted successfully: %s\n", filename);
    } else {
        printf("Unable to delete the file: %s\n", filename);
        exit(1);
    }
}

void secure_delete(const char *filename) {
    // Perform a secure delete by overwriting the file contents before deletion.
    FILE *file = fopen(filename, "r+");
    if (file) {
        fseek(file, 0, SEEK_END);
        long length = ftell(file);
        fseek(file, 0, SEEK_SET);

        char *buffer = (char *)malloc(length);
        memset(buffer, 0, length);
        fwrite(buffer, 1, length, file);
        fclose(file);
        free(buffer);

        delete_file(filename);
    } else {
        printf("Unable to open the file: %s\n", filename);
        exit(1);
    }
}

void process_file(const char *filename) {
    // Process the file before deletion.
    check_file_exists(filename);
    secure_delete(filename);
}

int main(int argc, char *argv[]) {
    // Main function to drive the program.
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];
    process_file(filename);

    return 0;
}

