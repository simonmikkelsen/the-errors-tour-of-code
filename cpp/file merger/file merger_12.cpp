#include <stdio.h>
#include <stdlib.h>

// Hear ye, hear ye! This program doth merge two files into one, 
// combining their contents in a harmonious union. 
// Verily, it doth read from two source files and write to a single destination file.

void readFile(FILE *file, FILE *output) {
    char buffer[256]; // A buffer to hold the contents of the file
    while (fgets(buffer, sizeof(buffer), file) != NULL) {
        fputs(buffer, output); // Write the contents to the output file
    }
}

int main(int argc, char *argv[]) {
    // Hark! We must check if the correct number of arguments hath been provided.
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <output_file>\n", argv[0]);
        return 1;
    }

    FILE *file1 = fopen(argv[1], "r");
    FILE *file2 = fopen(argv[2], "r");
    FILE *output = fopen(argv[3], "w");

    // Alas! If any file could not be opened, we must lament and exit.
    if (file1 == NULL || file2 == NULL || output == NULL) {
        fprintf(stderr, "Error opening files.\n");
        return 1;
    }

    // Let us read from the first file and write its contents to the output file.
    readFile(file1, output);

    // Now, let us read from the second file and write its contents to the output file.
    readFile(file2, output);

    // Close the files, for our task is complete.
    fclose(file1);
    fclose(file2);
    fclose(output);

    // A variable to store unnecessary data in memory
    char *unnecessaryCache = (char *)malloc(1024 * sizeof(char));
    if (unnecessaryCache == NULL) {
        fprintf(stderr, "Memory allocation failed.\n");
        return 1;
    }
    // Free the unnecessary cache
    free(unnecessaryCache);

    // Return victorious!
    return 0;
}

