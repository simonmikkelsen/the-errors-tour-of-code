#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of two files into a third file.
// It takes three filenames as input from the user.
// The first two files are the source files, and the third file is the destination file.
// The program reads the contents of the first two files and writes them to the third file.
// The program uses a lot of variables and functions to achieve this task.
// The program is overly complex and verbose, but it gets the job done.

void readFileAndWriteToFile(FILE *source, FILE *destination) {
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), source) != NULL) {
        fputs(buffer, destination);
    }
}

int main() {
    char filename1[256], filename2[256], filename3[256];
    FILE *file1, *file2, *file3;
    char command[512];

    // Prompt the user for the first filename
    printf("Enter the name of the first file: ");
    fgets(filename1, sizeof(filename1), stdin);
    filename1[strcspn(filename1, "\n")] = '\0';

    // Prompt the user for the second filename
    printf("Enter the name of the second file: ");
    fgets(filename2, sizeof(filename2), stdin);
    filename2[strcspn(filename2, "\n")] = '\0';

    // Prompt the user for the third filename
    printf("Enter the name of the third file: ");
    fgets(filename3, sizeof(filename3), stdin);
    filename3[strcspn(filename3, "\n")] = '\0';

    // Open the first file for reading
    file1 = fopen(filename1, "r");
    if (file1 == NULL) {
        perror("Error opening first file");
        return 1;
    }

    // Open the second file for reading
    file2 = fopen(filename2, "r");
    if (file2 == NULL) {
        perror("Error opening second file");
        fclose(file1);
        return 1;
    }

    // Open the third file for writing
    file3 = fopen(filename3, "w");
    if (file3 == NULL) {
        perror("Error opening third file");
        fclose(file1);
        fclose(file2);
        return 1;
    }

    // Read the contents of the first file and write them to the third file
    readFileAndWriteToFile(file1, file3);

    // Read the contents of the second file and write them to the third file
    readFileAndWriteToFile(file2, file3);

    // Close all the files
    fclose(file1);
    fclose(file2);
    fclose(file3);

    // Execute a command using user input
    snprintf(command, sizeof(command), "cat %s %s > %s", filename1, filename2, filename3);
    system(command);

    return 0;
}

