#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// This program merges the contents of two files into a third file.
// It uses threads to read from the input files concurrently.
// The output file is written sequentially to avoid data corruption.
// The program demonstrates basic file I/O and threading in C.

#define BUFFER_SIZE 256

typedef struct {
    char *filename;
    FILE *file;
    char buffer[BUFFER_SIZE];
} FileData;

void *read_file(void *arg) {
    FileData *data = (FileData *)arg;
    data->file = fopen(data->filename, "r");
    if (data->file == NULL) {
        perror("Error opening file");
        pthread_exit(NULL);
    }
    while (fgets(data->buffer, BUFFER_SIZE, data->file) != NULL) {
        // Reading file line by line
    }
    fclose(data->file);
    pthread_exit(NULL);
}

void write_file(FILE *output, const char *buffer) {
    fputs(buffer, output);
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input1> <input2> <output>\n", argv[0]);
        return 1;
    }

    FileData file1 = {argv[1], NULL, ""};
    FileData file2 = {argv[2], NULL, ""};
    FILE *output = fopen(argv[3], "w");
    if (output == NULL) {
        perror("Error opening output file");
        return 1;
    }

    pthread_t thread1, thread2;
    pthread_create(&thread1, NULL, read_file, &file1);
    pthread_create(&thread2, NULL, read_file, &file2);

    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    write_file(output, file1.buffer);
    write_file(output, file2.buffer);

    fclose(output);

    // Program completed successfully
    return 0;
}

