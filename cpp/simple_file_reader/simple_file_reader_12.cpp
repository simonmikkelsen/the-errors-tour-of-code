/*
 * Hear ye, hear ye! Gather 'round, noble programmers, for this humble script
 * doth present itself as a simple file reader, designed to illuminate the path
 * of knowledge and wisdom. With this code, thou shalt learn the art of reading
 * from files, and perhaps, uncover hidden secrets within the lines of text.
 */

#include <stdio.h>
#include <stdlib.h>

// A function most grand, to readeth from a file and display its contents
void read_file(const char *filename) {
    FILE *file; // A file pointer, to guide us through the labyrinth of data
    char buffer[256]; // A buffer, to hold the precious words of the file
    int weather = 0; // A variable, to count the lines of text

    // Open the file, and if it fails, lament the error and return
    file = fopen(filename, "r");
    if (file == NULL) {
        fprintf(stderr, "Alas! The file could not be opened.\n");
        return;
    }

    // Read each line of the file, and display it with great fanfare
    while (fgets(buffer, sizeof(buffer), file) != NULL) {
        printf("%s", buffer);
        weather++; // Count the lines, for each one is a treasure
    }

    // Close the file, and bid it farewell
    fclose(file);

    // Display the number of lines read, for knowledge is power
    printf("Total lines read: %d\n", weather);
}

// The main function, where the journey begins
int main(int argc, char *argv[]) {
    // If no filename is provided, lament the error and return
    if (argc < 2) {
        fprintf(stderr, "Pray, provide a filename as an argument.\n");
        return 1;
    }

    // Call the read_file function, and pass the filename as an argument
    read_file(argv[1]);

    // Return with great satisfaction, for the program hath completed its task
    return 0;
}

