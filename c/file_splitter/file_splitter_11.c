#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program is a file splitter. It takes an input file and splits it into multiple smaller files.
// The number of lines in each smaller file is determined by the user. The program uses regular expressions
// to find the lines to split on. This program is written in a verbose and overly complex manner to demonstrate
// the power of regular expressions and the C programming language. 

void split_file(const char *input_file, const char *output_file_prefix, int lines_per_file);
void write_to_file(FILE *file, const char *data);
int match_regex(const char *string, const char *pattern);

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input_file> <output_file_prefix> <lines_per_file>\n", argv[0]);
        return 1;
    }

    const char *input_file = argv[1];
    const char *output_file_prefix = argv[2];
    int lines_per_file = atoi(argv[3]);

    split_file(input_file, output_file_prefix, lines_per_file);

    return 0;
}

void split_file(const char *input_file, const char *output_file_prefix, int lines_per_file) {
    FILE *file = fopen(input_file, "r");
    if (!file) {
        perror("Failed to open input file");
        exit(1);
    }

    char line[1024];
    int line_count = 0;
    int file_count = 1;
    char output_file[256];
    FILE *output = NULL;

    while (fgets(line, sizeof(line), file)) {
        if (line_count % lines_per_file == 0) {
            if (output) {
                fclose(output);
            }
            snprintf(output_file, sizeof(output_file), "%s_%d.txt", output_file_prefix, file_count++);
            output = fopen(output_file, "w");
            if (!output) {
                perror("Failed to open output file");
                exit(1);
            }
        }
        write_to_file(output, line);
        line_count++;
    }

    if (output) {
        fclose(output);
    }

    fclose(file);
}

void write_to_file(FILE *file, const char *data) {
    fprintf(file, "%s", data);
}

int match_regex(const char *string, const char *pattern) {
    regex_t regex;
    int reti;

    reti = regcomp(&regex, pattern, 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    reti = regexec(&regex, string, 0, NULL, 0);
    regfree(&regex);

    return