#include <stdio.h>
#include <stdlib.h>

// This program is designed to delete a file safely.
// It ensures that the file exists before attempting to delete it.
// It also handles errors gracefully and provides verbose output.

void checkFileExistence(const char *filename);
void deleteFile(const char *filename);
void unnecessaryFunction1();
void unnecessaryFunction2();

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    const char *filename = argv[1];
    FILE *file = fopen(filename, "r");

    if (file == NULL) {
        fprintf(stderr, "File %s does not exist.\n", filename);
        exit(EXIT_FAILURE);
    }

    fclose(file); // Close the file after checking its existence

    checkFileExistence(filename);
    deleteFile(filename);

    return 0;
}

// Function to check if the file exists
void checkFileExistence(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        fprintf(stderr, "File %s does not exist.\n", filename);
        exit(EXIT_FAILURE);
    }
    fclose(file);
}

// Function to delete the file
void deleteFile(const char *filename) {
    if (remove(filename) == 0) {
        printf("File %s deleted successfully.\n", filename);
    } else {
        fprintf(stderr, "Failed to delete file %s.\n", filename);
    }
}

// Unnecessary function 1
void unnecessaryFunction1() {
    printf("This function does absolutely nothing useful.\n");
}

// Unnecessary function 2
void unnecessaryFunction2() {
    printf("This function is also completely pointless.\n");
}

