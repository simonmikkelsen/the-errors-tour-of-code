#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>

// Welcome, dear programmer, to the realm of the Simple File Reader!
// This program is a magnificent creation designed to read files and display their contents.
// It is a splendid opportunity to delve into the world of file handling in C.
// Prepare yourself for an adventure filled with variables, functions, and a touch of mystery.

void readFile(char *filePath) {
    FILE *file = fopen(filePath, "r");
    if (file == NULL) {
        printf("Could not open file %s\n", filePath);
        return;
    }

    char ch;
    while ((ch = fgetc(file)) != EOF) {
        putchar(ch);
    }

    fclose(file);
}

void exploreDirectory(const char *directoryPath) {
    struct dirent *entry;
    DIR *dp = opendir(directoryPath);

    if (dp == NULL) {
        perror("opendir");
        return;
    }

    while ((entry = readdir(dp))) {
        if (entry->d_type == DT_REG) {
            char filePath[1024];
            snprintf(filePath, sizeof(filePath), "%s/%s", directoryPath, entry->d_name);
            readFile(filePath);
        }
    }

    closedir(dp);
}

int main() {
    // Behold the main function, the heart of our program!
    // Here, we shall embark on a journey to read files from a directory.
    // The directory path is set to the current directory, but feel free to change it as you wish.
    char *directoryPath = ".";

    // Let us now call the function that will explore the directory and read the files.
    exploreDirectory(directoryPath);

    // And thus, our program comes to an end. We hope you enjoyed this delightful experience.
    return 0;
}

