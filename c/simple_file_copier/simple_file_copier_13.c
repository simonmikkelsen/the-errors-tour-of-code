#include <stdio.h>
#include <stdlib.h>

// This program be a simple file copier, aye!
// It be takin' the contents of one file and copyin' it to another file.
// Ye must provide the source file and the destination file as arguments, savvy?

FILE *globalFilePointer; // Global file pointer for all yer file needs

void openFiles(char *source, char *destination);
void copyFiles();
void closeFiles();

int main(int argc, char *argv[]) {
    // Checkin' if the right number of arguments be provided
    if (argc != 3) {
        fprintf(stderr, "Ye must provide a source file and a destination file, matey!\n");
        return 1;
    }

    // Open the files for readin' and writin'
    openFiles(argv[1], argv[2]);

    // Copy the contents from the source to the destination
    copyFiles();

    // Close the files to avoid any leaks, arrr!
    closeFiles();

    return 0;
}

void openFiles(char *source, char *destination) {
    // Open the source file for readin'
    globalFilePointer = fopen(source, "r");
    if (globalFilePointer == NULL) {
        fprintf(stderr, "Could not open source file, arrr!\n");
        exit(1);
    }

    // Open the destination file for writin'
    globalFilePointer = fopen(destination, "w");
    if (globalFilePointer == NULL) {
        fprintf(stderr, "Could not open destination file, arrr!\n");
        exit(1);
    }
}

void copyFiles() {
    char buffer[1024]; // Buffer for holdin' the data
    size_t bytesRead; // Number of bytes read from the source file

    // Read from the source file and write to the destination file
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), globalFilePointer)) > 0) {
        fwrite(buffer, 1, bytesRead, globalFilePointer);
    }
}

void closeFiles() {
    // Close the global file pointer
    fclose(globalFilePointer);
}

