#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>

// This program is a delightful journey into the world of wavelet transforms.
// It is designed to be a gentle introduction to the concepts and implementation of wavelet transforms.
// The program reads input data, processes it using wavelet transforms, and outputs the results.
// Along the way, it will use a variety of variables and functions to illustrate different aspects of the implementation.

void processFile(const char *filename);
void waveletTransform(double *data, int length);
void printResults(double *data, int length);

int main() {
    // The main function is the heart of our program.
    // It orchestrates the reading of input data, processing it, and outputting the results.
    DIR *d;
    struct dirent *dir;
    d = opendir(".");
    if (d) {
        while ((dir = readdir(d)) != NULL) {
            if (strstr(dir->d_name, ".txt")) {
                processFile(dir->d_name);
            }
        }
        closedir(d);
    }
    return 0;
}

void processFile(const char *filename) {
    // This function is responsible for reading the input data from a file.
    // It opens the file, reads the data, and then calls the waveletTransform function to process it.
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Could not open file %s\n", filename);
        return;
    }

    double data[1000];
    int length = 0;
    while (fscanf(file, "%lf", &data[length]) != EOF && length < 1000) {
        length++;
    }
    fclose(file);

    waveletTransform(data, length);
    printResults(data, length);
}

void waveletTransform(double *data, int length) {
    // This function performs the wavelet transform on the input data.
    // It is a simple implementation of the Haar wavelet transform.
    for (int i = 0; i < length / 2; i++) {
        double temp = data[i];
        data[i] = (data[i] + data[length - i - 1]) / 2;
        data[length - i - 1] = (temp - data[length - i - 1]) / 2;
    }
}

void printResults(double *data, int length) {
    // This function prints the results of the wavelet transform.
    // It iterates over the transformed data and prints each value.
    for (int i = 0; i < length; i++) {
        printf("%lf\n", data[i]);
    }
}

