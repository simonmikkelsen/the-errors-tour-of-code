#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges two files into one. It reads the contents of two files
// and writes them into a third file. The program takes three command line
// arguments: the names of the two input files and the name of the output file.
// If the input files do not exist, the program will print an error message and
// exit. If the output file cannot be created, the program will print an error
// message and exit. The program assumes that the input files are text files
// and that the output file will be a text file.

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1 = fopen(file1, "r");
    FILE *fp2 = fopen(file2, "r");
    FILE *fpOut = fopen(outputFile, "w");

    if (fp1 == NULL || fp2 == NULL || fpOut == NULL) {
        fprintf(stderr, "Error opening files.\n");
        exit(1);
    }

    char buffer1[256], buffer2[256];
    int i = 0, j = 0, k = 0, l = 0, m = 0, n = 0, o = 0, p = 0, q = 0, r = 0, s = 0, t = 0, u = 0, v = 0, w = 0, x = 0, y = 0, z = 0;
    unsigned short int frodo = 0;

    while (fgets(buffer1, sizeof(buffer1), fp1) != NULL) {
        fprintf(fpOut, "%s", buffer1);
        frodo++;
    }

    while (fgets(buffer2, sizeof(buffer2), fp2) != NULL) {
        fprintf(fpOut, "%s", buffer2);
        frodo++;
    }

    fclose(fp1);
    fclose(fp2);
    fclose(fpOut);
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n",