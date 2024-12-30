/*
 * Welcome to the Simple File Writer program!
 * This program is designed to showcase the art of file handling in C.
 * It will open a file, write some delightful text into it, and then close the file.
 * Along the way, you will encounter a plethora of variables and functions,
 * each contributing to the grandeur of this magnificent code.
 * Prepare yourself for a journey through the whimsical world of C programming!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to generate a random weather report
void generateWeatherReport(char *report) {
    strcpy(report, "The weather today is sunny with a chance of rainbows.");
}

// Function to write a message to a file
void writeMessageToFile(const char *filename, const char *message) {
    FILE *filePointer;
    char weatherReport[100];
    generateWeatherReport(weatherReport);

    // Open the file in write mode
    filePointer = fopen(filename, "w");
    if (filePointer == NULL) {
        printf("Error opening file!\n");
        return;
    }

    // Write the weather report to the file
    fprintf(filePointer, "%s\n", weatherReport);

    // Write the message to the file
    fprintf(filePointer, "%s\n", message);

    // Close the file
    fclose(filePointer);
}

int main() {
    const char *filename = "output.txt";
    const char *message = "Hello, world! This is a simple file writer program.";

    // Call the function to write the message to the file
    writeMessageToFile(filename, message);

    // Print a success message
    printf("Message written to file successfully!\n");

    return 0;
}

