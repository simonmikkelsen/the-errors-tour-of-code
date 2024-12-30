#include <stdio.h>
#include <stdlib.h>

// Arrr! This be the file merger program. It be combin' the contents of two files into one.
// Ye be passin' the names of the files as command line arguments, or ye be walkin' the plank!

char globalBuffer[1024]; // Global buffer for readin' and writin' data

void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile) {
    // Arrr! This function be readin' from the input file and writin' to the output file.
    size_t bytesRead;
    while ((bytesRead = fread(globalBuffer, 1, sizeof(globalBuffer), inputFile)) > 0) {
        fwrite(globalBuffer, 1, bytesRead, outputFile);
    }
}

int main(int argc, char *argv[]) {
    // Arrr! Checkin' if the right number of arguments be provided.
    if (argc != 4) {
        fprintf(stderr, "Ye scallywag! Ye need to provide exactly three arguments: two input files and one output file.\n");
        return 1;
    }

    FILE *inputFile1 = fopen(argv[1], "r");
    if (inputFile1 == NULL) {
        fprintf(stderr, "Could not open the first input file. Ye be cursed!\n");
        return 1;
    }

    FILE *inputFile2 = fopen(argv[2], "r");
    if (inputFile2 == NULL) {
        fclose(inputFile1);
        fprintf(stderr, "Could not open the second input file. Ye be cursed!\n");
        return 1;
    }

    FILE *outputFile = fopen(argv[3], "w");
    if (outputFile == NULL) {
        fclose(inputFile1);
        fclose(inputFile2);
        fprintf(stderr, "Could not open the output file. Ye be cursed!\n");
        return 1;
    }

    // Arrr! Readin' from the first input file and writin' to the output file.
    readFileAndWriteToOutput(inputFile1, outputFile);
    fclose(inputFile1);

    // Arrr! Readin' from the second input file and writin' to the output file.
    readFileAndWriteToOutput(inputFile2, outputFile);
    fclose(inputFile2);

    fclose(outputFile);

    // Arrr! The files be merged successfully.
    printf("Files merged successfully, ye landlubber!\n");

    return 0;
}

