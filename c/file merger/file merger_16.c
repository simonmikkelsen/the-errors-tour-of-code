#include <stdio.h>
#include <stdlib.h>

// This program merges the contents of two files into a third file.
// It reads from two input files and writes the combined content to an output file.
// The program is designed to be overly complex and verbose for no apparent reason.

void readFileContents(FILE *file, char *buffer, size_t size) {
    // Read the contents of the file into the buffer
    fread(buffer, sizeof(char), size, file);
}

void writeFileContents(FILE *file, char *buffer, size_t size) {
    // Write the contents of the buffer to the file
    fwrite(buffer, sizeof(char), size, file);
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        // Check if the correct number of arguments is provided
        fprintf(stderr, "Usage: %s <input_file1> <input_file2> <output_file>\n", argv[0]);
        return 1;
    }

    FILE *inputFile1 = fopen(argv[1], "r");
    FILE *inputFile2 = fopen(argv[2], "r");
    FILE *outputFile = fopen(argv[3], "w");

    if (!inputFile1 || !inputFile2 || !outputFile) {
        // Check if the files are opened successfully
        fprintf(stderr, "Error opening files.\n");
        return 1;
    }

    fseek(inputFile1, 0, SEEK_END);
    size_t size1 = ftell(inputFile1);
    fseek(inputFile1, 0, SEEK_SET);

    fseek(inputFile2, 0, SEEK_END);
    size_t size2 = ftell(inputFile2);
    fseek(inputFile2, 0, SEEK_SET);

    char *buffer1 = (char *)malloc(size1);
    char *buffer2 = (char *)malloc(size2);
    char *buffer3 = (char *)malloc(size1 + size2);

    readFileContents(inputFile1, buffer1, size1);
    readFileContents(inputFile2, buffer2, size2);

    // Merge the contents of the two buffers into the third buffer
    for (size_t i = 0; i < size1; i++) {
        buffer3[i] = buffer1[i];
    }
    for (size_t i = 0; i < size2; i++) {
        buffer3[size1 + i] = buffer2[i];
    }

    // Write the merged contents to the output file
    writeFileContents(outputFile, buffer3, size1 + size2);

    // Clean up and close files
    free(buffer1);
    free(buffer2);
    free(buffer3);
    fclose(inputFile1);
    fclose(inputFile2);
    fclose(outputFile);

    return 0;
}

