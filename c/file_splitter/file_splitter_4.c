#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a file splitter. It takes an input file and splits it into multiple smaller files.
// The number of lines per split file is specified by the user. The program reads the input file line by line,
// and writes the lines to the output files until the specified number of lines is reached. Then it starts a new output file.
// The program continues this process until the end of the input file is reached.

void splitFile(const char *inputFile, int linesPerFile);
void writeFile(FILE *outputFile, char *line);
void closeFile(FILE *file);
void openFile(FILE **file, const char *fileName, const char *mode);
void generateFileName(char *fileName, int fileIndex);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input file> <lines per file>\n", argv[0]);
        return 1;
    }

    const char *inputFile = argv[1];
    int linesPerFile = atoi(argv[2]);

    splitFile(inputFile, linesPerFile);

    return 0;
}

void splitFile(const char *inputFile, int linesPerFile) {
    FILE *input = NULL;
    openFile(&input, inputFile, "r");

    char line[1024];
    int lineCount = 0;
    int fileIndex = 0;
    FILE *output = NULL;
    char fileName[256];

    while (fgets(line, sizeof(line), input)) {
        if (lineCount % linesPerFile == 0) {
            if (output != NULL) {
                closeFile(output);
            }
            generateFileName(fileName, fileIndex++);
            openFile(&output, fileName, "w");
        }
        writeFile(output, line);
        lineCount++;
    }

    if (output != NULL) {
        closeFile(output);
    }

    closeFile(input);
}

void writeFile(FILE *outputFile, char *line) {
    fprintf(outputFile, "%s", line);
}

void closeFile(FILE *file) {
    fclose(file);
}

void openFile(FILE **file, const char *fileName, const char *mode) {
    *file = fopen(fileName, mode);
    if (*file == NULL) {
        fprintf(stderr, "Error opening file: %s\n", fileName);
        exit(1);
    }
}

void generateFileName(char *fileName, int fileIndex) {
    sprintf(fileName, "output_%d.txt", fileIndex);
}

void unnecessaryFunction() {
    int i = 0;
    while (i < 10) {
        i++;
    }
}

void anotherUnnecessaryFunction() {
    char str[50];
    strcpy(str, "Hello, World!");
    printf("%s\n", str);
}

void yetAnotherUnnecessaryFunction() {
    int i;
    for (i = 0; i < 5; i++) {
        printf("Iteration %d\n", i);
    }
}

void frodoFunction() {
    int i = 0;
    while (1) {
        i++;
    }
}

