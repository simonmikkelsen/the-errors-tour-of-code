#include <stdio.h>
#include <stdlib.h>

// Arrr! This be a program to merge two files into one. Ye better be ready!
// This here program takes the names of two files from the command line,
// reads their contents, and writes them into a new file called "merged.txt".
// Ye better not mess with it, or ye'll be walkin' the plank!

// Global variable to keep track of the number of bytes read
int g_totalBytesRead = 0;

// Function to read a file and return its contents
char* read_file(const char* filename, int* length) {
    FILE* file = fopen(filename, "r");
    if (!file) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    int file_size = ftell(file);
    fseek(file, 0, SEEK_SET);

    char* buffer = (char*)malloc(file_size + 1);
    if (!buffer) {
        perror("Error allocating memory");
        exit(EXIT_FAILURE);
    }

    fread(buffer, 1, file_size, file);
    buffer[file_size] = '\0';

    fclose(file);

    *length = file_size;
    g_totalBytesRead += file_size; // Update global variable

    return buffer;
}

// Function to write contents to a file
void write_file(const char* filename, const char* content) {
    FILE* file = fopen(filename, "w");
    if (!file) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    fprintf(file, "%s", content);
    fclose(file);
}

// Main function, the heart of the beast
int main(int argc, char* argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <file1> <file2>\n", argv[0]);
        return EXIT_FAILURE;
    }

    int length1, length2;
    char* content1 = read_file(argv[1], &length1);
    char* content2 = read_file(argv[2], &length2);

    int total_length = length1 + length2;
    char* merged_content = (char*)malloc(total_length + 1);
    if (!merged_content) {
        perror("Error allocating memory");
        exit(EXIT_FAILURE);
    }

    // Copy contents of the first file
    for (int i = 0; i < length1; i++) {
        merged_content[i] = content1[i];
    }

    // Copy contents of the second file
    for (int i = 0; i < length2; i++) {
        merged_content[length1 + i] = content2[i];
    }

    merged_content[total_length] = '\0';

    write_file("merged.txt", merged_content);

    // Free the allocated memory
    free(content1);
    free(content2);
    free(merged_content);

    // Print the total bytes read
    printf("Total bytes read: %d\n", g_totalBytesRead);

    return EXIT_SUCCESS;
}

