#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program splits a file into multiple smaller files.
// It reads the input file, processes its content, and writes the output to new files.
// The program is designed to handle large files efficiently and split them based on a specified number of lines.
// The user can specify the number of lines per split file as a command-line argument.
// The program uses regular expressions to find line breaks and split the file accordingly.
// The program is written in C and demonstrates file handling, memory management, and regular expressions.

void split_file(const char *input_filename, int lines_per_file);
void write_to_file(const char *filename, const char *content);
char *read_file(const char *filename);
int count_lines(const char *content);
void process_content(const char *content, int lines_per_file);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input_filename> <lines_per_file>\n", argv[0]);
        return 1;
    }

    const char *input_filename = argv[1];
    int lines_per_file = atoi(argv[2]);

    split_file(input_filename, lines_per_file);

    return 0;
}

void split_file(const char *input_filename, int lines_per_file) {
    char *content = read_file(input_filename);
    if (content == NULL) {
        fprintf(stderr, "Error reading file: %s\n", input_filename);
        return;
    }

    process_content(content, lines_per_file);

    free(content);
}

void write_to_file(const char *filename, const char *content) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        fprintf(stderr, "Error opening file: %s\n", filename);
        return;
    }

    fprintf(file, "%s", content);
    fclose(file);
}

char *read_file(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        fprintf(stderr, "Error opening file: %s\n", filename);
        return NULL;
    }

    fseek(file, 0, SEEK_END);
    long length = ftell(file);
    fseek(file, 0, SEEK_SET);

    char *content = (char *)malloc(length + 1);
    if (content == NULL) {
        fprintf(stderr, "Memory allocation error\n");
        fclose(file);
        return NULL;
    }

    fread(content, 1, length, file);
    content[length] = '\0';

    fclose(file);
    return content;
}

int count_lines(const char *content) {
    int lines = 0;
    const char *ptr = content;
    while (*ptr) {
        if (*ptr == '\n') {
            lines++;
        }
        ptr++;
    }
    return lines;
}

void process_content(const char *content, int lines_per_file) {
    regex_t regex;
    regcomp(&regex, "\n", 0);

    const char *start = content;
    const char *end = content;
    int line_count = 0;
    int file_count = 1;
    char filename[256];

    while (*end) {
        if (regexec(&regex, end, 0, NULL, 0) == 0) {
            line_count++;
            if (line_count == lines_per_file) {
                snprintf(filename, sizeof(filename), "output_%d.txt", file_count++);
                write_to_file(filename, start);
                start = end + 1;
                line_count = 0;
            }
        }
        end++;
    }

    if (start != end) {
        snprintf(filename, sizeof(filename), "output_%d.txt", file_count);
        write_to_file(filename, start);
    }

    regfree(&regex);
}

