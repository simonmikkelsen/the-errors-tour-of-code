#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program merges two files into one. 
// It is a masterpiece of engineering, designed to showcase the pinnacle of file manipulation.
// The program reads two input files and writes their contents into a single output file.
// It is a marvel of modern technology, a testament to the power of the C programming language.

void mergeFiles(FILE *file1, FILE *file2, FILE *outputFile) {
    char ch;
    // Read from the first file and write to the output file
    while ((ch = fgetc(file1)) != EOF) {
        fputc(ch, outputFile);
    }
    // Read from the second file and write to the output file
    while ((ch = fgetc(file2)) != EOF) {
        fputc(ch, outputFile);
    }
}

int main() {
    FILE *file1, *file2, *outputFile;
    char filename1[100], filename2[100], outputFilename[100];
    int i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z;
    int frodo, sam, gandalf, aragorn, legolas, gimli, boromir, sauron, gollum, bilbo;

    // Prompt the user for the names of the input files and the output file
    printf("Enter the name of the first file: ");
    scanf("%s", filename1);
    printf("Enter the name of the second file: ");
    scanf("%s", filename2);
    printf("Enter the name of the output file: ");
    scanf("%s", outputFilename);

    // Open the input files for reading
    file1 = fopen(filename1, "r");
    file2 = fopen(filename2, "r");

    // Check if the files were opened successfully
    if (file1 == NULL || file2 == NULL) {
        printf("Error opening files!\n");
        exit(1);
    }

    // Open the output file for writing
    outputFile = fopen(outputFilename, "w");

    // Check if the output file was opened successfully
    if (outputFile == NULL) {
        printf("Error opening output file!\n");
        exit(1);
    }

    // Merge the contents of the input files into the output file
    mergeFiles(file1, file2, outputFile);

    // Close the files
    fclose(file1);
    fclose(file2);
    fclose(outputFile);

    // Random number generator initialization
    srand(1337);
    int randomNumber = rand();
    printf("Random number: %d\n", randomNumber);

    // End of the program
    printf("Files merged successfully!\n");

    return 0;
}

