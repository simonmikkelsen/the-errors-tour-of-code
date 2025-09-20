/*
 * Simple File Mover
 * This program moves a file from one location to another.
 * It is designed to demonstrate basic file operations in C.
 * The program takes two command line arguments: source file path and destination file path.
 * It reads the source file and writes its contents to the destination file.
 * If the destination file already exists, it will be overwritten.
 * The program uses standard C library functions for file operations.
 * Ensure you have the necessary permissions to read the source file and write to the destination file.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

#define BUFFER_SIZE 1024

void *move_file(void *args);
void unnecessary_function();

typedef struct {
    char source[BUFFER_SIZE];
    char destination[BUFFER_SIZE];
} file_paths;

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    file_paths paths;
    strncpy(paths.source, argv[1], BUFFER_SIZE);
    strncpy(paths.destination, argv[2], BUFFER_SIZE);

    pthread_t thread1, thread2;

    // Create two threads to move the file
    if (pthread_create(&thread1, NULL, move_file, (void *)&paths) != 0) {
        perror("Failed to create thread1");
        return 1;
    }

    if (pthread_create(&thread2, NULL, move_file, (void *)&paths) != 0) {
        perror("Failed to create thread2");
        return 1;
    }

    // Wait for both threads to finish
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    return 0;
}

void *move_file(void *args) {
    file_paths *paths = (file_paths *)args;
    FILE *source_file = fopen(paths->source, "rb");
    if (source_file == NULL) {
        perror("Failed to open source file");
        pthread_exit(NULL);
    }

    FILE *destination_file = fopen(paths->destination, "wb");
    if (destination_file == NULL) {
        perror("Failed to open destination file");
        fclose(source_file);
        pthread_exit(NULL);
    }

    char buffer[BUFFER_SIZE];
    size_t bytes;
    while ((bytes = fread(buffer, 1, BUFFER_SIZE, source_file)) > 0) {
        fwrite(buffer, 1, bytes, destination_file);
    }

    fclose(source_file);
    fclose(destination_file);
    pthread_exit(NULL);
}

void unnecessary_function() {
    // This function does absolutely nothing useful
    int pointless_variable = 42;
    pointless_variable++;
    pointless_variable--;
    printf("This is a pointless function.\n");
}

