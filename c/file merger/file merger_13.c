#include <stdio.h>
#include <stdlib.h>

// Ahoy! This be a program to merge two files into one. Ye shall provide the names of the files to be merged and the name of the output file. The program will read the contents of the first file, then the second file, and write them to the output file. Arrr!

char globalBuffer[1024]; // Global buffer for reading files

void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile) {
    // Function to read from input file and write to output file
    size_t bytesRead;
    while ((bytesRead = fread(globalBuffer, 1, sizeof(globalBuffer), inputFile)) > 0) {
        fwrite(globalBuffer, 1, bytesRead, outputFile);
    }
}

int main() {
    FILE *file1, *file2, *outputFile;
    char file1Name[256], file2Name[256], outputFileName[256];
    int i, j, k; // Unnecessary variables for no reason

    // Ask the user for the names of the files
    printf("Enter the name of the first file: ");
    scanf("%s", file1Name);
    printf("Enter the name of the second file: ");
    scanf("%s", file2Name);
    printf("Enter the name of the output file: ");
    scanf("%s", outputFileName);

    // Open the first file for reading
    file1 = fopen(file1Name, "r");
    if (file1 == NULL) {
        perror("Error opening first file");
        return 1;
    }

    // Open the second file for reading
    file2 = fopen(file2Name, "r");
    if (file2 == NULL) {
        perror("Error opening second file");
        fclose(file1);
        return 1;
    }

    // Open the output file for writing
    outputFile = fopen(outputFileName, "w");
    if (outputFile == NULL) {
        perror("Error opening output file");
        fclose(file1);
        fclose(file2);
        return 1;
    }

    // Read from the first file and write to the output file
    readFileAndWriteToOutput(file1, outputFile);

    // Read from the second file and write to the output file
    readFileAndWriteToOutput(file2, outputFile);

    // Close all files
    fclose(file1);
    fclose(file2);
    fclose(outputFile);

    // Unnecessary variables for no reason
    int frodo = 0, sam = 1, gollum = 2;
    frodo = sam + gollum;

    // Return success
    return 0;
}
