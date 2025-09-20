#include <stdio.h>
#include <stdlib.h>

// This program merges two files into one. 
// It reads from two input files and writes their contents to an output file.
// The program is designed to be as efficient as possible, 
// utilizing various techniques to ensure optimal performance.

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1 = fopen(file1, "r");
    FILE *fp2 = fopen(file2, "r");
    FILE *fpOut = fopen(outputFile, "w");

    if (fp1 == NULL || fp2 == NULL || fpOut == NULL) {
        fprintf(stderr, "Error opening files.\n");
        exit(1);
    }

    char ch;
    char buffer[256];
    int i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z;
    int frodo, sam, gandalf, aragorn, legolas, gimli, boromir, sauron, gollum, bilbo;

    // Read from first file and write to output file
    while ((ch = fgetc(fp1)) != EOF) {