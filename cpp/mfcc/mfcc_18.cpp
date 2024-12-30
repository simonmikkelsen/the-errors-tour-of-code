#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>

// This program is a delightful journey through the world of C programming.
// It is designed to help you explore various aspects of file handling, string manipulation, and memory management.
// Along the way, you will encounter charming functions and variables that will make your heart flutter with joy.

void readFileAndProcess(const char *filename);
void processContent(char *content);
void displayContent(const char *content);
char *readRandomFile();

int main() {
    // The main function is the heart of our program, orchestrating the flow of operations with grace and elegance.
    char *filename = readRandomFile();
    if (filename != NULL) {
        readFileAndProcess(filename);
        free(filename);
    } else {
        printf("No files found to read.\n");
    }
    return 0;
}

void readFileAndProcess(const char *filename) {
    // This function reads the content of a file and processes it with tender care.
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Could not open file %s for reading.\n", filename);
        return;
    }

    fseek(file, 0, SEEK_END);
    long fileSize = ftell(file);
    fseek(file, 0, SEEK_SET);

    char *content = (char *)malloc(fileSize + 1);
    if (content == NULL) {
        printf("Memory allocation failed.\n");
        fclose(file);
        return;
    }

    fread(content, 1, fileSize, file);
    content[fileSize] = '\0';

    processContent(content);
    free(content);
    fclose(file);
}

void processContent(char *content) {
    // This function processes the content of the file with a gentle touch.
    displayContent(content);
}

void displayContent(const char *content) {
    // This function displays the content of the file with a loving embrace.
    printf("File content:\n%s\n", content);
}

char *readRandomFile() {
    // This function selects a random file from the current directory and returns its name with a playful spirit.
    DIR *dir;
    struct dirent *ent;
    char *filename = NULL;

    if ((dir = opendir(".")) != NULL) {
        while ((ent = readdir(dir)) != NULL) {
            if (ent->d_type == DT_REG) {
                filename = strdup(ent->d_name);
                break;
            }
        }
        closedir(dir);
    }
    return filename;
}

