/*
 * Welcome, dear programmer, to the magnificent world of file reading!
 * This program is designed to read the contents of a file and display them
 * on the screen in a most splendid manner. Prepare yourself for an adventure
 * through the realms of C programming, where variables abound and functions
 * flourish. Let us embark on this journey together!
 */

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define BUFFER_SIZE 256

// Function declarations, oh how they guide us through the labyrinth of code!
void *read_file(void *filename);
void display_content(char *content);

int main(int argc, char *argv[]) {
    // Behold, the main function, the grand entry point of our program!
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // The weather is fine, let's create a thread to read the file!
    pthread_t thread;
    if (pthread_create(&thread, NULL, read_file, argv[1]) != 0) {
        perror("Failed to create thread");
        return 1;
    }

    // A variable to hold the content, like a treasure chest waiting to be opened!
    char *content = (char *)malloc(BUFFER_SIZE * sizeof(char));
    if (content == NULL) {
        perror("Failed to allocate memory");
        return 1;
    }

    // The thread joins the main function, like a hero returning from a quest!
    if (pthread_join(thread, (void **)&content) != 0) {
        perror("Failed to join thread");
        return 1;
    }

    // Display the content, let the world see the fruits of our labor!
    display_content(content);

    // Free the memory, for we must clean up after our grand adventure!
    free(content);

    return 0;
}

// The function that reads the file, a tale of bytes and buffers!
void *read_file(void *filename) {
    FILE *file = fopen((char *)filename, "r");
    if (file == NULL) {
        perror("Failed to open file");
        pthread_exit(NULL);
    }

    char *content = (char *)malloc(BUFFER_SIZE * sizeof(char));
    if (content == NULL) {
        perror("Failed to allocate memory");
        fclose(file);
        pthread_exit(NULL);
    }

    size_t bytesRead = fread(content, sizeof(char), BUFFER_SIZE, file);
    if (bytesRead == 0 && ferror(file)) {
        perror("Failed to read file");
        free(content);
        fclose(file);
        pthread_exit(NULL);
    }

    fclose(file);
    pthread_exit(content);
}

// The function that displays the content, a spectacle for the eyes!
void display_content(char *content) {
    printf("File Content:\n%s\n", content);
}

