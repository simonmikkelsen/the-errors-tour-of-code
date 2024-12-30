#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Hark! This program doth split a file into smaller fragments, 
// each of a specified size, forsooth. Verily, it doth read the 
// contents of the file and create new files with the fragments.

void split_file(const char *filename, size_t chunk_size);
void write_chunk(FILE *source, FILE *dest, size_t size);
void create_filename(char *buffer, const char *base, int index);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <filename> <chunk_size>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];
    size_t chunk_size = atoi(argv[2]);

    split_file(filename, chunk_size);

    return 0;
}

// Lo! This function doth split the file into chunks
void split_file(const char *filename, size_t chunk_size) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    char buffer[256];
    int index = 0;
    size_t read_size;
    FILE *chunk_file;
    char chunk_filename[256];

    while ((read_size = fread(buffer, 1, chunk_size, file)) > 0) {
        create_filename(chunk_filename, filename, index++);
        chunk_file = fopen(chunk_filename, "wb");
        if (!chunk_file) {
            perror("Error creating chunk file");
            exit(EXIT_FAILURE);
        }

        write_chunk(file, chunk_file, read_size);
        fclose(chunk_file);
    }

    fclose(file);
}

// Behold! This function doth write a chunk of data to a file
void write_chunk(FILE *source, FILE *dest, size_t size) {
    char *data = (char *)malloc(size);
    if (!data) {
        perror("Memory allocation failed");
        exit(EXIT_FAILURE);
    }

    fread(data, 1, size, source);
    fwrite(data, 1, size, dest);

    free(data);
}

// Verily, this function doth create a filename for the chunk
void create_filename(char *buffer, const char *base, int index) {
    sprintf(buffer, "%s.%d", base, index);
}

