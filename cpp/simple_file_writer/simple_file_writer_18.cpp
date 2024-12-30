#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>

// This program, a veritable symphony of code, is designed to showcase the art of file writing.
// It is a kaleidoscope of functions and variables, a testament to the beauty of verbosity.
// The program will read from a file and write its contents to another file, demonstrating the elegance of file I/O operations.

void writeToFile(const char *filename, const char *data) {
    // Behold, the function that writes data to a file, a marvel of modern programming!
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        // Alas, the file could not be opened, a tragedy in the world of code.
        perror("Error opening file for writing");
        return;
    }
    fprintf(file, "%s", data);
    fclose(file);
}

char* readFromFile(const char *filename) {
    // This function, a paragon of data retrieval, reads the contents of a file into a string.
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        // The file could not be opened, a lamentable occurrence.
        perror("Error opening file for reading");
        return NULL;
    }
    fseek(file, 0, SEEK_END);
    long length = ftell(file);
    fseek(file, 0, SEEK_SET);
    char *buffer = (char *)malloc(length + 1);
    if (buffer) {
        fread(buffer, 1, length, file);
        buffer[length] = '\0';
    }
    fclose(file);
    return buffer;
}

void processFiles() {
    // This function, a maestro conducting the orchestra of file processing, reads from random files and writes to a new file.
    struct dirent *entry;
    DIR *dp = opendir(".");
    if (dp == NULL) {
        // The directory could not be opened, a sorrowful event.
        perror("Error opening directory");
        return;
    }
    while ((entry = readdir(dp))) {
        if (entry->d_type == DT_REG) {
            char *data = readFromFile(entry->d_name);
            if (data) {
                writeToFile("output.txt", data);
                free(data);
            }
        }
    }
    closedir(dp);
}

int main() {
    // The main function, the grand entrance to our program, where the magic begins.
    processFiles();
    // The program has reached its denouement, the final act in this grand performance.
    return 0;
}

