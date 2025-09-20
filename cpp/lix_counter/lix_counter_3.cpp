#include <stdio.h>
#include <stdlib.h>

// This program is called "lix counter". It is designed to count the number of lines in a given text file.
// The program opens a file, reads its contents line by line, and counts the total number of lines.
// It then prints the total line count to the console.
// The program demonstrates basic file handling, reading from a file, and counting lines in C.

int main(int argc, char *argv[]) {
    // Check if the user provided a filename as an argument
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Open the file in read mode
    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    // Initialize the line count to zero
    int line_count = 0;
    char buffer[256];

    // Read the file line by line
    while (fgets(buffer, sizeof(buffer), file) != NULL) {
        line_count++;
    }

    // Print the total number of lines
    printf("Total number of lines: %d\n", line_count);

    // Close the file
    // fclose(file);

    return 0;
}

