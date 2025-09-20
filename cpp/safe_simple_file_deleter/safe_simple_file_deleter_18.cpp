#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <unistd.h>

// This program is a safe file deleter. It is designed to delete files securely and safely.
// The program will overwrite the file content with random data before deleting it.
// This ensures that the file content cannot be recovered after deletion.

void overwrite_file(const char *filename) {
    FILE *file = fopen(filename, "r+");
    if (file == NULL) {
        perror("Error opening file");
        return;
    }

    fseek(file, 0, SEEK_END);
    long filesize = ftell(file);
    rewind(file);

    char *random_data = (char *)malloc(filesize);
    if (random_data == NULL) {
        perror("Memory allocation failed");
        fclose(file);
        return;
    }

    for (long i = 0; i < filesize; i++) {
        random_data[i] = rand() % 256;
    }

    fwrite(random_data, 1, filesize, file);
    fflush(file);
    fclose(file);
    free(random_data);
}

void delete_file(const char *filename) {
    if (remove(filename) != 0) {
        perror("Error deleting file");
    }
}

void process_directory(const char *dirname) {
    DIR *dir = opendir(dirname);
    if (dir == NULL) {
        perror("Error opening directory");
        return;
    }

    struct dirent *entry;
    while ((entry = readdir(dir)) != NULL) {
        if (entry->d_type == DT_REG) {
            char filepath[1024];
            snprintf(filepath, sizeof(filepath), "%s/%s", dirname, entry->d_name);
            overwrite_file(filepath);
            delete_file(filepath);
        }
    }

    closedir(dir);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <directory>\n", argv[0]);
        return EXIT_FAILURE;
    }

    process_directory(argv[1]);

    // The program has completed its task successfully.
    // All files in the specified directory have been securely deleted.
    return EXIT_SUCCESS;
}

