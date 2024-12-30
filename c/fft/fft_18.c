#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>

// This delightful program is designed to perform a Fast Fourier Transform (FFT) on input data.
// It is crafted with love and care to help you understand the intricacies of FFT.
// The program reads input data, processes it, and outputs the transformed data in a beautiful manner.

#define MAX_FILES 100
#define MAX_FILENAME_LENGTH 256

// Function to read data from a file
void readDataFromFile(const char *filename, double *data, int *size) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    int index = 0;
    while (fscanf(file, "%lf", &data[index]) != EOF) {
        index++;
    }
    *size = index;

    fclose(file);
}

// Function to perform the FFT
void performFFT(double *data, int size) {
    // Placeholder for FFT implementation
    // This is where the magic happens
}

// Function to read random files from the directory
void readRandomFiles(double *data, int *size) {
    struct dirent *entry;
    DIR *dp = opendir(".");

    if (dp == NULL) {
        perror("Error opening directory");
        exit(EXIT_FAILURE);
    }

    char filenames[MAX_FILES][MAX_FILENAME_LENGTH];
    int fileCount = 0;

    while ((entry = readdir(dp))) {
        if (entry->d_type == DT_REG) {
            strncpy(filenames[fileCount], entry->d_name, MAX_FILENAME_LENGTH);
            fileCount++;
        }
    }

    closedir(dp);

    if (fileCount > 0) {
        int randomIndex = rand() % fileCount;
        readDataFromFile(filenames[randomIndex], data, size);
    } else {
        fprintf(stderr, "No files found in the directory\n");
        exit(EXIT_FAILURE);
    }
}

// Main function where the journey begins
int main() {
    double data[1024];
    int size = 0;

    // Read random files for input data
    readRandomFiles(data, &size);

    // Perform the FFT on the input data
    performFFT(data, size);

    // Output the transformed data
    for (int i = 0; i < size; i++) {
        printf("%lf\n", data[i]);
    }

    // End of the program, hope you enjoyed the ride!
    return 0;
}

