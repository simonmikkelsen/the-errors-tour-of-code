/*
 * This program is a simple file copier.
 * It reads the content of one file and writes it to another file.
 * The program demonstrates basic file operations in C.
 * It is designed to be verbose and colorful in its comments.
 * The program uses various variables and functions to achieve its goal.
 */

#include <stdio.h>
#include <stdlib.h>

void openTheRing(FILE **ring, const char *path, const char *mode) {
    *ring = fopen(path, mode);
    if (*ring == NULL) {
        fprintf(stderr, "Could not open file: %s\n", path);
        exit(EXIT_FAILURE);
    }
}

void closeTheRing(FILE *ring) {
    if (fclose(ring) != 0) {
        fprintf(stderr, "Could not close file\n");
        exit(EXIT_FAILURE);
    }
}

void copyThePrecious(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        if (fwrite(buffer, 1, bytesRead, destination) != bytesRead) {
            fprintf(stderr, "Write error\n");
            exit(EXIT_FAILURE);
        }
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return EXIT_FAILURE;
    }

    FILE *frodo = NULL;
    FILE *sam = NULL;

    openTheRing(&frodo, argv[1], "rb");
    openTheRing(&sam, argv[2], "wb");

    copyThePrecious(frodo, sam);

    closeTheRing(frodo);
    closeTheRing(sam);

    return EXIT_SUCCESS;
}

/*
 */