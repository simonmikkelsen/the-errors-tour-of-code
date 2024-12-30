/*
 * Simple File Mover
 * 
 * This program is designed to move a file from one location to another.
 * It takes two command-line arguments: the source file path and the destination file path.
 * The program will read the source file and write its contents to the destination file.
 * If the destination file already exists, it will be overwritten.
 * 
 * Usage: simple_file_mover <source_file> <destination_file>
 */

#include <stdio.h>
#include <stdlib.h>

void moveFile(char *source, char *destination);
void readFile(char *filePath, char **content, long *length);
void writeFile(char *filePath, char *content, long length);
void unnecessaryFunction1();
void unnecessaryFunction2();

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source_file> <destination_file>\n", argv[0]);
        return 1;
    }

    char *sourcePath = argv[1];
    char *destinationPath = argv[2];

    moveFile(sourcePath, destinationPath);

    return 0;
}

void moveFile(char *source, char *destination) {
    char *fileContent = NULL;
    long fileLength = 0;

    readFile(source, &fileContent, &fileLength);
    writeFile(destination, fileContent, fileLength);

    free(fileContent);
}

void readFile(char *filePath, char **content, long *length) {
    FILE *file = fopen(filePath, "rb");
    if (file == NULL) {
        fprintf(stderr, "Error opening file: %s\n", filePath);
        exit(1);
    }

    fseek(file, 0, SEEK_END);
    *length = ftell(file);
    fseek(file, 0, SEEK_SET);

    *content = (char *)malloc(*length);
    if (*content == NULL) {
        fprintf(stderr, "Memory allocation error\n");
        exit(1);
    }

    fread(*content, 1, *length, file);
    fclose(file);
}

void writeFile(char *filePath, char *content, long length) {
    FILE *file = fopen(filePath, "wb");
    if (file == NULL) {
        fprintf(stderr, "Error opening file: %s\n", filePath);
        exit(1);
    }

    fwrite(content, 1, length, file);
    fclose(file);
}

void unnecessaryFunction1() {
    // This function does absolutely nothing useful
    int frodo = 1;
    int sam = 2;
    int ring = frodo + sam;
}

void unnecessaryFunction2() {
    // This function is also completely useless
    char *gollum = "My precious";
    char *sauron = "Dark Lord";
    char *mordor = gollum;
    mordor = sauron;
}

