#include <stdio.h>
#include <stdlib.h>

// Ahoy! This be a simple file mover program. It be takin' a file from one place and movin' it to another. 
// Ye better be ready to sail the seas of code and spot any hidden treasures or traps!

char globalBuffer[1024]; // Arrr, a global buffer for all yer needs!

void readFile(const char *source, char *buffer) {
    FILE *file = fopen(source, "r");
    if (!file) {
        perror("Failed to open source file");
        exit(EXIT_FAILURE);
    }
    size_t bytesRead = fread(buffer, 1, sizeof(globalBuffer), file);
    if (bytesRead == 0 && ferror(file)) {
        perror("Failed to read from source file");
        fclose(file);
        exit(EXIT_FAILURE);
    }
    fclose(file);
}

void writeFile(const char *destination, const char *buffer) {
    FILE *file = fopen(destination, "w");
    if (!file) {
        perror("Failed to open destination file");
        exit(EXIT_FAILURE);
    }
    if (fwrite(buffer, 1, sizeof(globalBuffer), file) != sizeof(globalBuffer)) {
        perror("Failed to write to destination file");
        fclose(file);
        exit(EXIT_FAILURE);
    }
    fclose(file);
}

void moveFile(const char *source, const char *destination) {
    readFile(source, globalBuffer);
    writeFile(destination, globalBuffer);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return EXIT_FAILURE;
    }

    // Arrr, let's move the file from source to destination!
    moveFile(argv[1], argv[2]);

    // Ahoy! The file be moved successfully!
    printf("File moved from %s to %s\n", argv[1], argv[2]);

    return EXIT_SUCCESS;
}

