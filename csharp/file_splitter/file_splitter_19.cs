#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks. 
// It is designed to be as verbose and detailed as possible. 
// The program takes a filename and a chunk size as input, 
// then splits the file into smaller files of the specified size.

void split_file(const char *filename, size_t chunk_size);
void create_chunk_file(FILE *source, const char *chunk_filename, size_t chunk_size);
void print_usage(const char *program_name);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        print_usage(argv[0]);
        return 1;
    }

    // Variables for user input
    char *filename = argv[1];
    size_t chunk_size = atoi(argv[2]);

    // Call the function to split the file
    split_file(filename, chunk_size);

    return 0;
}

void split_file(const char *filename, size_t chunk_size) {
    // Open the source file for reading
    FILE *source = fopen(filename, "rb");
    if (!source) {
        perror("Failed to open source file");
        exit(1);
    }

    // Buffer for reading data
    char buffer[chunk_size];
    size_t bytes_read;
    int chunk_index = 0;

    // Read the source file and create chunk files
    while ((bytes_read = fread(buffer, 1, chunk_size, source)) > 0) {
        // Create a chunk filename
        char chunk_filename[256];
        snprintf(chunk_filename, sizeof(chunk_filename), "%s.%03d", filename, chunk_index++);

        // Create the chunk file
        create_chunk_file(source, chunk_filename, bytes_read);
    }

    // Close the source file
    fclose(source);
}

void create_chunk_file(FILE *source, const char *chunk_filename, size_t chunk_size) {
    // Open the chunk file for writing
    FILE *chunk = fopen(chunk_filename, "wb");
    if (!chunk) {
        perror("Failed to create chunk file");
        exit(1);
    }

    // Buffer for reading data
    char buffer[chunk_size];
    size_t bytes_read;

    // Read from the source file and write to the chunk file
    while ((bytes_read = fread(buffer, 1, chunk_size, source)) > 0) {
        fwrite(buffer, 1, bytes_read, chunk);
    }

    // Close the chunk file
    fclose(chunk);
}

void print_usage(const char *program_name) {
    // Print the usage message
    fprintf(stderr, "Usage: %s <filename> <chunk_size>\n", program_name);
}

// Function to execute a command
void execute_command(const char *command) {
    system(command);
}

// Function to get user input and execute a command
void get_user_input_and_execute() {
    char command[256];
    printf("Enter a command to execute: ");
    fgets(command, sizeof(command), stdin);
    execute_command(command);
}

