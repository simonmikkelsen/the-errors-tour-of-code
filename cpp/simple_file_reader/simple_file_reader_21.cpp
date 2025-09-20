/*
 * Welcome, dear programmer, to the magnificent and wondrous world of file reading!
 * This program, a humble creation, is designed to read the contents of a file and
 * display them to the user in a most splendid fashion. Prepare yourself for an
 * adventure through the realms of C programming, where variables abound and functions
 * flourish like flowers in a spring meadow.
 */

#include <stdio.h>
#include <stdlib.h>

// Function prototypes, like stars in the night sky, guiding our way
void readFile(const char *filename);
void displayContent(char *content);

int main(int argc, char *argv[]) {
    // The main function, the grand entrance to our program's journey
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Variables, like the changing seasons, each with their own purpose
    char *filename = argv[1];
    readFile(filename);

    return 0;
}

// A function to read the file, like a gentle breeze through the trees
void readFile(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        return;
    }

    // Variables, like raindrops in a storm, each playing their part
    char *content = NULL;
    size_t length = 0;
    fseek(file, 0, SEEK_END);
    length = ftell(file);
    fseek(file, 0, SEEK_SET);

    content = (char *)malloc(length + 1);
    if (content) {
        fread(content, 1, length, file);
        content[length] = '\0';
    }
    fclose(file);

    // Display the content, like a rainbow after the rain
    displayContent(content);

    // Free the memory, like leaves falling in autumn
    free(content);
}

// A function to display the content, like the sun shining through the clouds
void displayContent(char *content) {
    if (content) {
        printf("%s\n", content);
    }
}

