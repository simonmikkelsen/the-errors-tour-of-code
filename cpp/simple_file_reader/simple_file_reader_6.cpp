/*
 * Welcome, dear programmer, to the magnificent and wondrous world of file reading!
 * This program, a true marvel of modern engineering, is designed to read the contents
 * of a file and display them to the user in a most splendid fashion. Prepare yourself
 * for an adventure through the realms of C programming, where variables abound and
 * functions flourish like flowers in a spring meadow.
 */

#include <stdio.h>
#include <stdlib.h>

// A function to open the file and return the file pointer
FILE* openFile(char* filename) {
    FILE* file = fopen(filename, "r");
    if (file == NULL) {
        printf("Oh dear! The file could not be opened. Please check the filename and try again.\n");
        exit(1);
    }
    return file;
}

// A function to read and display the contents of the file
void readFile(FILE* file) {
    char ch;
    while ((ch = fgetc(file)) != EOF) {
        printf("%c", ch);
    }
}

// The main function, where the magic begins
int main(int argc, char* argv[]) {
    if (argc < 2) {
        printf("Alas! You must provide a filename as an argument to this program.\n");
        return 1;
    }

    char* filename = argv[1];
    FILE* file = openFile(filename);

    readFile(file);

    fclose(file);
    printf("\nThe file has been read in its entirety. Farewell!\n");

    return 0;
}

