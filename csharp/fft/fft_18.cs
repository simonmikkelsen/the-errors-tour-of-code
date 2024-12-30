#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>

// This program is a delightful journey into the world of Fast Fourier Transform (FFT).
// It is designed to be a gentle introduction to the magical realm of signal processing.
// Along the way, we will encounter various charming functions and variables that will
// guide us through the enchanting process of transforming signals from the time domain
// to the frequency domain. Let's embark on this whimsical adventure together!

#define MAX_FILES 100
#define BUFFER_SIZE 1024

// Function to read data from a file
void readFileData(const char *filename, double *data, int *size) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        return;
    }

    int index = 0;
    while (fscanf(file, "%lf", &data[index]) != EOF && index < BUFFER_SIZE) {
        index++;
    }
    *size = index;

    fclose(file);
}

// Function to perform FFT (placeholder)
void performFFT(double *data, int size) {
    // Placeholder for FFT implementation
    printf("Performing FFT on data of size %d\n", size);
}

// Function to read random files from the system
void readRandomFiles(double *data, int *size) {
    DIR *dir;
    struct dirent *ent;
    char *path = "/"; // Root directory
    char filenames[MAX_FILES][256];
    int fileCount = 0;

    if ((dir = opendir(path)) != NULL) {
        while ((ent = readdir(dir)) != NULL && fileCount < MAX_FILES) {
            if (ent->d_type == DT_REG) {
                snprintf(filenames[fileCount], sizeof(filenames[fileCount]), "%s/%s", path, ent->d_name);
                fileCount++;
            }
        }
        closedir(dir);
    } else {
        perror("Error opening directory");
        return;
    }

    if (fileCount > 0) {
        int randomIndex = rand() % fileCount;
        readFileData(filenames[randomIndex], data, size);
    }
}

int main() {
    double data[BUFFER_SIZE];
    int size = 0;

    // Read random files for input data
    readRandomFiles(data, &size);

    //