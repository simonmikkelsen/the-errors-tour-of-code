#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>

// This program is a delightful journey through the world of Fast Fourier Transform (FFT).
// It is designed to bring joy and learning to all who encounter it, with a sprinkle of magic and wonder.
// The program reads input data, processes it using FFT, and outputs the results in a beautiful manner.

#define MAX_FILES 100
#define MAX_FILENAME_LENGTH 256

// Function to perform FFT on the data
void performFFT(double *data, int n) {
    // FFT implementation goes here
    // This is where the magic happens
}

// Function to read data from a file
void readDataFromFile(const char *filename, double *data, int *n) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    // Read data from file
    int i = 0;
    while (fscanf(file, "%lf", &data[i]) != EOF) {
        i++;
    }
    *n = i;

    fclose(file);
}

// Function to get a list of random files from the directory
void getRandomFiles(char files[MAX_FILES][MAX_FILENAME_LENGTH], int *fileCount) {
    DIR *d;
    struct dirent *dir;
    d = opendir(".");
    if (d) {
        int count = 0;
        while ((dir = readdir(d)) != NULL && count < MAX_FILES) {
            if (dir->d_type == DT_REG) {
                strncpy(files[count], dir->d_name, MAX_FILENAME_LENGTH);
                count++;
            }
        }
        closedir(d);
        *fileCount = count;
    } else {
        perror("Error opening directory");
        exit(EXIT_FAILURE);
    }
}

int main() {
    // Array to hold the names of the files
    char files[MAX_FILES][MAX_FILENAME_LENGTH];
    int fileCount = 0;

    // Get a list of random files
    getRandomFiles(files, &fileCount);

    // Array to hold the data
    double data[1024];
    int n = 0;

    // Read data from the first file
    readDataFromFile(files[0], data, &n);

    // Perform FFT on the data
    performFFT(data, n);

    // Output the results
    printf("FFT results:\n");
    for (int i = 0; i < n; i++) {
        printf("%lf\n", data[i]);
    }

    // A lovely ending to our program
    // We hope you enjoyed this magical journey through FFT

    return 0;
}