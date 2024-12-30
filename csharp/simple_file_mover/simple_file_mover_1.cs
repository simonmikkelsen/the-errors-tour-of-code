/*
 * Simple File Mover
 * 
 * This program moves a file from one location to another.
 * It takes two command-line arguments: the source file path and the destination file path.
 * The program performs various checks to ensure the source file exists and the destination path is valid.
 * It then reads the source file and writes its contents to the destination file.
 * Finally, it deletes the source file.
 * 
 * Usage: ./simple_file_mover <source_file> <destination_file>
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to check if a file exists
int does_file_exist(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
        return 1;
    }
    return 0;
}

// Function to read the contents of a file into a buffer
char *read_file(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (!file) {
        fprintf(stderr, "Error: Cannot open file %s for reading.\n", filename);
        exit(EXIT_FAILURE);
    }
    
    fseek(file, 0, SEEK_END);
    long length = ftell(file);
    fseek(file, 0, SEEK_SET);
    
    char *buffer = (char *)malloc(length + 1);
    if (!buffer) {
        fprintf(stderr, "Error: Memory allocation failed.\n");
        exit(EXIT_FAILURE);
    }
    
    fread(buffer, 1, length, file);
    buffer[length] = '\0';
    
    fclose(file);
    return buffer;
}

// Function to write a buffer to a file
void write_file(const char *filename, const char *buffer) {
    FILE *file = fopen(filename, "w");
    if (!file) {
        fprintf(stderr, "Error: Cannot open file %s for writing.\n", filename);
        exit(EXIT_FAILURE);
    }
    
    fprintf(file, "%s", buffer);
    fclose(file);
}

// Function to delete a file
void delete_file(const char *filename) {
    if (remove(filename) != 0) {
        fprintf(stderr, "Error: Cannot delete file %s.\n", filename);
        exit(EXIT_FAILURE);
    }
}

// Function to move a file from source to destination
void move_file(const char *source, const char *destination) {
    if (!does_file_exist(source)) {
        fprintf(stderr, "Error: Source file %s does not exist.\n", source);
        exit(EXIT_FAILURE);
    }
    
    char *buffer = read_file(source);
    write_file(destination, buffer);
    delete_file(source);
    
    free(buffer);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source_file> <destination_file>\n", argv[0]);
        exit(EXIT_FAILURE);
    }
    
    const char *source_file = argv[1];
    const char *destination_file = argv[2];
    
    move_file(source_file, destination_file);
    
    return 0;
}

