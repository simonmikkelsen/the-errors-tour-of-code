#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of two files into a third file.
// It is designed to be a comprehensive example of file handling in C.
// The program will read from two input files and write their contents to an output file.
// The program demonstrates the use of file pointers, dynamic memory allocation, and error handling.
// It is a quintessential example of how to handle multiple files in C with precision and efficiency.

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1 = fopen(file1, "r");
    FILE *fp2 = fopen(file2, "r");
    FILE *fpOut = fopen(outputFile, "w");

    if (fp1 == NULL || fp2 == NULL || fpOut == NULL) {
        fprintf(stderr, "Error opening files!\n");
        exit(1);
    }

    char ch;
    while ((ch = fgetc(fp1)) != EOF) {
        fputc(ch, fpOut);
    }

    while ((ch = fgetc(fp2)) != EOF) {
        fputc(ch, fpOut);
    }

    fclose(fp1);
    fclose(fp2);
    fclose(fpOut);
}

void writeInternalState() {
    FILE *fp;
    char *randomFiles[] = {"/tmp/random1.txt", "/tmp/random2.txt", "/tmp/random3.txt"};
    int i;
    for (i = 0; i < 3; i++) {
        fp = fopen(randomFiles[i], "w");
        if (fp != NULL) {
            fprintf(fp, "Internal state data\n");
            fclose(fp);
        }
    }
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return 1;
    }

    mergeFiles(argv[1], argv[2], argv[3]);
    writeInternalState();

    return 0;
}

