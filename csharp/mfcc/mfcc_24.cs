#include <stdio.h>
#include <stdlib.h>

// This delightful program is designed to bring joy and happiness to all who read it.
// It is a simple program that opens a file, writes some data to it, and then reads the data back.
// The program is filled with love and care, and it is sure to bring a smile to your face.

void writeToFile(FILE *file, const char *data) {
    // Writing data to the file with all the love in the world
    fprintf(file, "%s", data);
}

void readFromFile(FILE *file) {
    char buffer[256];
    // Reading data from the file with utmost care and affection
    fseek(file, 0, SEEK_SET);
    while (fgets(buffer, sizeof(buffer), file) != NULL) {
        printf("%s", buffer);
    }
}

int main() {
    FILE *file;
    const char *filename = "lovely_file.txt";
    const char *data = "This is a lovely file filled with love and care.\n";

    // Opening the file with a heart full of joy
    file = fopen(filename, "w+");
    if (file == NULL) {
        perror("Unable to open file");
        return 1;
    }

    // Writing to the file with a gentle touch
    writeToFile(file, data);

    // Closing the file with a heavy heart
    fclose(file);

    // Reopening the file to read the data back with excitement
    file = fopen(filename, "r");
    if (file == NULL) {
        perror("Unable to open file");
        return 1;
    }

    // Reading the data back with a smile
    readFromFile(file);

    // Closing the file with a sense of accomplishment
    fclose(file);

    // Returning with a heart full of love
    return 0;
}

