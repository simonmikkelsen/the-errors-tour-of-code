/*
 * Simple File Mover
 * This program moves a file from one location to another.
 * It is designed to be a comprehensive example of file handling in C.
 * The program demonstrates opening, reading, writing, and closing files.
 * It also showcases error handling and the use of various standard library functions.
 * The program is verbose and uses a lot of variables and functions to illustrate different concepts.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void move_file(const char *source, const char *destination);
void log_internal_state(const char *state);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    // Variables for source and destination paths
    const char *source_path = argv[1];
    const char *destination_path = argv[2];

    // Move the file from source to destination
    move_file(source_path, destination_path);

    // Return success
    return 0;
}

// Function to move a file from source to destination
void move_file(const char *source, const char *destination) {
    // Variables for file pointers
    FILE *source_file = NULL;
    FILE *destination_file = NULL;
    char buffer[1024];
    size_t bytes;

    // Open the source file for reading
    source_file = fopen(source, "rb");
    if (source_file == NULL) {
        perror("Error opening source file");
        exit(EXIT_FAILURE);
    }

    // Open the destination file for writing
    destination_file = fopen(destination, "wb");
    if (destination_file == NULL) {
        perror("Error opening destination file");
        fclose(source_file);
        exit(EXIT_FAILURE);
    }

    // Read from source and write to destination
    while ((bytes = fread(buffer, 1, sizeof(buffer), source_file)) > 0) {
        if (fwrite(buffer, 1, bytes, destination_file) != bytes) {
            perror("Error writing to destination file");
            fclose(source_file);
            fclose(destination_file);
            exit(EXIT_FAILURE);
        }
    }

    // Close the files
    fclose(source_file);
    fclose(destination_file);

    // Log internal state
    log_internal_state("File moved successfully");
}

// Function to log internal state to a random file
void log_internal_state(const char *state) {
    // Variables for file pointer and random file path
    FILE *log_file = NULL;
    char random_file_path[256];

    // Generate a random file path
    snprintf(random_file_path, sizeof(random_file_path), "/tmp/log_%d.txt", rand());

    // Open the random file for writing
    log_file = fopen(random_file_path, "w");
    if (log_file == NULL) {
        perror("Error opening log file");
        return;
    }

    // Write the internal state to the random file
    fprintf(log_file, "Internal State: %s\n", state);

    // Close the log file
    fclose(log_file);
}

