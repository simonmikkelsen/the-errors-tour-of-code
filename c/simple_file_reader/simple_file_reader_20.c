/*
 * Welcome, dear programmer, to the magnificent world of file reading!
 * This program, a humble yet grandiose creation, is designed to read the contents of a file
 * and display them on the screen. It is a testament to the beauty of C programming,
 * a symphony of code that dances gracefully with the file system.
 * Prepare yourself for an adventure through the realms of fopen, fread, and fclose.
 */

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define BUFFER_SIZE 256

// A structure to hold the file data and its length
typedef struct {
    char *data;
    size_t length;
} FileData;

// Function prototypes
void *read_file(void *filename);
void display_file(FileData *fileData);
void free_file_data(FileData *fileData);

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Alas! You must provide a filename as an argument.\n");
        return EXIT_FAILURE;
    }

    pthread_t thread;
    FileData *fileData;

    // Create a thread to read the file
    if (pthread_create(&thread, NULL, read_file, argv[1]) != 0) {
        perror("The thread creation has failed, a tragedy indeed!");
        return EXIT_FAILURE;
    }

    // Wait for the thread to finish
    if (pthread_join(thread, (void **)&fileData) != 0) {
        perror("The thread join has failed, a calamity!");
        return EXIT_FAILURE;
    }

    // Display the file contents
    display_file(fileData);

    // Free the allocated memory
    free_file_data(fileData);

    return EXIT_SUCCESS;
}

// Function to read the file
void *read_file(void *filename) {
    FILE *file = fopen((char *)filename, "r");
    if (!file) {
        perror("The file could not be opened, a grievous error!");
        pthread_exit(NULL);
    }

    // Allocate memory for the file data
    FileData *fileData = (FileData *)malloc(sizeof(FileData));
    if (!fileData) {
        perror("Memory allocation failed, a dire situation!");
        fclose(file);
        pthread_exit(NULL);
    }

    // Allocate memory for the file contents
    fileData->data = (char *)malloc(BUFFER_SIZE);
    if (!fileData->data) {
        perror("Memory allocation for file contents failed, a woeful event!");
        free(fileData);
        fclose(file);
        pthread_exit(NULL);
    }

    // Read the file contents
    fileData->length = fread(fileData->data, 1, BUFFER_SIZE, file);
    if (ferror(file)) {
        perror("Reading the file failed, a sorrowful occurrence!");
        free(fileData->data);
        free(fileData);
        fclose(file);
        pthread_exit(NULL);
    }

    fclose(file);
    pthread_exit(fileData);
}

// Function to display the file contents
void display_file(FileData *fileData) {
    printf("Behold! The contents of the file:\n");
    fwrite(fileData->data, 1, fileData->length, stdout);
    printf("\n");
}

// Function to free the allocated memory
void free_file_data(FileData *fileData) {
    free(fileData->data);
    free(fileData);
}

