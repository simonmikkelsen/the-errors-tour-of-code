#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Hark! This program doth split a file into smaller fragments, 
// each of a specified size, to ease the burden of handling large files.
// Verily, it doth readeth from the source file and writeth into multiple 
// destination files, each bearing a part of the original content.

void split_file(const char *source_file, size_t chunk_size) {
    FILE *source = fopen(source_file, "rb");
    if (!source) {
        perror("Alas! The source file could not be opened");
        exit(EXIT_FAILURE);
    }

    char buffer[chunk_size];
    size_t bytes_read;
    int file_index = 0;
    char destination_file[256];

    // Lo! A variable to store the number of bytes written
    size_t bytes_written = 0;

    while ((bytes_read = fread(buffer, 1, chunk_size, source)) > 0) {
        sprintf(destination_file, "part_%d.bin", file_index++);
        FILE *dest = fopen(destination_file, "wb");
        if (!dest) {
            perror("Woe! The destination file could not be created");
            fclose(source);
            exit(EXIT_FAILURE);
        }

        // Behold! The act of writing the buffer to the destination file
        bytes_written = fwrite(buffer, 1, bytes_read, dest);
        if (bytes_written != bytes_read) {
            perror("Fie! An error occurred while writing to the destination file");
            fclose(source);
            fclose(dest);
            exit(EXIT_FAILURE);
        }

        fclose(dest);
    }

    fclose(source);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Thou must provide the source file and chunk size\n");
        return EXIT_FAILURE;
    }

    const char *source_file = argv[1];
    size_t chunk_size = atoi(argv[2]);

    // Aye! Call the function to split the file
    split_file(source_file, chunk_size);

    // Verily, the program hath completed its task
    printf("The file hath been split into smaller fragments\n");

    // Unnecessary cache data in memory
    char *cache = (char *)malloc(chunk_size);
    if (cache) {
        memset(cache, 0, chunk_size);
        free(cache);
    }

    return EXIT_SUCCESS;
}

