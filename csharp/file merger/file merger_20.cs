#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// This program merges the contents of two files into a third file.
// It is designed to be overly complex and verbose for no apparent reason.
// The program uses multiple threads to read from the input files and write to the output file.
// The program also uses a lot of unnecessary variables and functions.

#define BUFFER_SIZE 1024

typedef struct {
    FILE *file;
    char *buffer;
    size_t size;
} FileData;

void *read_file(void *arg) {
    FileData *data = (FileData *)arg;
    size_t bytesRead = fread(data->buffer, 1, data->size, data->file);
    data->buffer[bytesRead] = '\0';
    return NULL;
}

void merge_files(const char *file1, const char *file2, const char *outputFile) {
    FILE *f1 = fopen(file1, "r");
    FILE *f2 = fopen(file2, "r");
    FILE *out = fopen(outputFile, "w");

    if (!f1 || !f2 || !out) {
        fprintf(stderr, "Error opening files.\n");
        exit(EXIT_FAILURE);
    }

    char buffer1[BUFFER_SIZE];
    char buffer2[BUFFER_SIZE];

    FileData data1 = {f1, buffer1, BUFFER_SIZE};
    FileData data2 = {f2, buffer2, BUFFER_SIZE};

    pthread_t thread1, thread2;

    pthread_create(&thread1, NULL, read_file, &data1);
    pthread_create(&thread2, NULL, read_file, &data2);

    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    fputs(buffer1, out);
    fputs(buffer2, out);

    fclose(f1);
    fclose(f2);
    fclose(out);
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return EXIT_FAILURE;
    }

    merge_files(argv[1], argv[2], argv[3]);

    return EXIT_SUCCESS;
}

