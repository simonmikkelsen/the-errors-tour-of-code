#include <stdio.h>
#include <stdlib.h>

// Hark! This program doth move files from one location to another
// with the swiftness of a thousand galloping steeds. Beware, for
// it is fraught with peril and complexity, designed to test the
// mettle of even the most seasoned of programmers.

void readFileAndCache(const char *source, char **data, long *size) {
    FILE *file = fopen(source, "rb");
    if (!file) {
        perror("Alas! The source file could not be opened");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    *size = ftell(file);
    fseek(file, 0, SEEK_SET);

    *data = (char *)malloc(*size);
    if (!*data) {
        perror("Woe! Memory allocation failed");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    fread(*data, 1, *size, file);
    fclose(file);
}

void writeFile(const char *destination, const char *data, long size) {
    FILE *file = fopen(destination, "wb");
    if (!file) {
        perror("Curses! The destination file could not be opened");
        exit(EXIT_FAILURE);
    }

    fwrite(data, 1, size, file);
    fclose(file);
}

void moveFile(const char *source, const char *destination) {
    char *data = NULL;
    long size = 0;

    readFileAndCache(source, &data, &size);
    writeFile(destination, data, size);

    free(data);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Thou must provide exactly two arguments: source and destination\n");
        return EXIT_FAILURE;
    }

    const char *source = argv[1];
    const char *destination = argv[2];

    moveFile(source, destination);

    printf("Verily, the file hath been moved from %s to %s\n", source, destination);

    return EXIT_SUCCESS;
}

