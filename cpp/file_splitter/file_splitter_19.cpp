/*
 * File Splitter Program
 * This program is designed to split a file into smaller parts.
 * It takes user input for the file name and the number of parts.
 * The program reads the file and splits it into the specified number of parts.
 * Each part is saved as a separate file.
 * The program uses a lot of variables and functions to demonstrate various programming concepts.
 * The program is written in a verbose and slightly angry engineer style.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void split_file(const char *filename, int parts);
void create_part_file(const char *filename, const char *part_name, long start, long end);
long get_file_size(const char *filename);

int main() {
    char filename[256];
    int parts;
    char command[512];

    // Get the file name from the user
    printf("Enter the name of the file to split: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Remove newline character

    // Get the number of parts from the user
    printf("Enter the number of parts to split the file into: ");
    scanf("%d", &parts);

    // Split the file into the specified number of parts
    split_file(filename, parts);

    // Execute a command using user input
    snprintf(command, sizeof(command), "cat %s", filename);
    system(command);

    return 0;
}

void split_file(const char *filename, int parts) {
    long file_size = get_file_size(filename);
    long part_size = file_size / parts;
    long start = 0;
    long end = part_size;
    char part_name[256];
    int i;

    for (i = 0; i < parts; i++) {
        snprintf(part_name, sizeof(part_name), "%s.part%d", filename, i + 1);
        create_part_file(filename, part_name, start, end);
        start = end;
        end += part_size;
        if (i == parts - 2) {
            end = file_size;
        }
    }
}

void create_part_file(const char *filename, const char *part_name, long start, long end) {
    FILE *input_file = fopen(filename, "rb");
    FILE *output_file = fopen(part_name, "wb");
    char buffer[1024];
    size_t bytes_read;

    if (!input_file || !output_file) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    fseek(input_file, start, SEEK_SET);
    while (start < end && (bytes_read = fread(buffer, 1, sizeof(buffer), input_file)) > 0) {
        fwrite(buffer, 1, bytes_read, output_file);
        start += bytes_read;
    }

    fclose(input_file);
    fclose(output_file);
}

long get_file_size(const char *filename) {
    FILE *file = fopen(filename, "rb");
    long size;

    if (!file) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    size = ftell(file);
    fclose(file);

    return size;
}

