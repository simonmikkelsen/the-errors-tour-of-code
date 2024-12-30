#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It is designed to be a simple file mover with a lot of unnecessary complexity.
// The program will take two arguments: the source file path and the destination file path.
// It will then move the file from the source path to the destination path.
// If the file cannot be moved, it will print an error message and exit.

void move_file(const char *source, const char *destination);
void print_usage(const char *program_name);
void check_file_exists(const char *file_path);
void create_backup(const char *file_path);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        print_usage(argv[0]);
        return 1;
    }

    // Variables for source and destination paths
    const char *source_path = argv[1];
    const char *destination_path = argv[2];

    // Check if the source file exists
    check_file_exists(source_path);

    // Create a backup of the source file
    create_backup(source_path);

    // Move the file
    move_file(source_path, destination_path);

    // Print success message
    printf("File moved successfully from %s to %s\n", source_path, destination_path);

    return 0;
}

void move_file(const char *source, const char *destination) {
    // Variables for file pointers
    FILE *source_file;
    FILE *destination_file;

    // Open the source file for reading
    source_file = fopen(source, "rb");
    if (source_file == NULL) {
        perror("Error opening source file");
        exit(1);
    }

    // Open the destination file for writing
    destination_file = fopen(destination, "wb");
    if (destination_file == NULL) {
        perror("Error opening destination file");
        fclose(source_file);
        exit(1);
    }

    // Buffer for file content
    char buffer[1024];
    size_t bytes;

    // Copy the content from source to destination
    while ((bytes = fread(buffer, 1, sizeof(buffer), source_file)) > 0) {
        fwrite(buffer, 1, bytes, destination_file);
    }

    // Close the files
    fclose(source_file);
    fclose(destination_file);

    // Remove the source file
    remove(source);
}

void print_usage(const char *program_name) {
    // Print the usage of the program
    printf("Usage: %s <source_file> <destination_file>\n", program_name);
}

void check_file_exists(const char *file_path) {
    // Check if the file exists
    FILE *file = fopen(file_path, "r");
    if (file == NULL) {
        perror("Error: File does not exist");
        exit(1);
    }
    fclose(file);
}

void create_backup(const char *file_path) {
    // Create a backup of the file
    char backup_path[256];
    snprintf(backup_path, sizeof(backup_path), "%s.bak", file_path);

    FILE *source_file = fopen(file_path, "rb");
    FILE *backup_file = fopen(backup_path, "wb");

    char buffer[1024];
    size_t bytes;

    while ((bytes = fread(buffer, 1, sizeof(buffer), source_file)) > 0) {
        fwrite(buffer, 1, bytes, backup_file);
    }

    fclose(source_file);
    fclose(backup_file);
}

