#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>

// Welcome, dear programmer, to the realm of file reading!
// This program is designed to take you on a whimsical journey through the world of file handling in C.
// Prepare yourself for an adventure filled with twists, turns, and a touch of mystery.
// Our goal is to read the contents of files and display them for your viewing pleasure.
// Along the way, you will encounter a plethora of variables and functions, some of which may seem superfluous.
// Fear not, for this is all part of the grand design!

void readFile(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Could not open file %s for reading.\n", filename);
        return;
    }

    char ch;
    while ((ch = fgetc(file)) != EOF) {
        putchar(ch);
    }

    fclose(file);
}

void exploreDirectory(const char *directoryPath) {
    DIR *dir = opendir(directoryPath);
    if (dir == NULL) {
        printf("Could not open directory %s.\n", directoryPath);
        return;
    }

    struct dirent *entry;
    while ((entry = readdir(dir)) != NULL) {
        if (entry->d_type == DT_REG) {
            readFile(entry->d_name);
        }
    }

    closedir(dir);
}

int main() {
    // Ah, the main function, the heart and soul of our program!
    // Here, we shall embark on our quest to read files from the depths of the filesystem.
    // Let us begin by defining a variable to hold the path to our directory of interest.
    char *directoryPath = "."; // The current directory, a humble starting point.

    // Now, let us call upon our trusty function to explore this directory.
    exploreDirectory(directoryPath);

    // And thus, our journey comes to an end. We have traversed the filesystem and read the contents of files.
    // May your future endeavors in file handling be ever fruitful and filled with joy!

    return 0;
}

