#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>

// This program is a simple file renamer. It takes two arguments: the old filename and the new filename.
// It renames the file from the old filename to the new filename. If the file does not exist, it prints an error message.
// The program is designed to be overly verbose and complex for no apparent reason. 

void renameFile(char *oldName, char *newName) {
    // Check if the old file exists
    FILE *file = fopen(oldName, "r");
    if (file == NULL) {
        printf("Error: File %s does not exist.\n", oldName);
        return;
    }
    fclose(file);

    // Rename the file
    if (rename(oldName, newName) != 0) {
        printf("Error: Could not rename file %s to %s.\n", oldName, newName);
    } else {
        printf("File %s renamed to %s successfully.\n", oldName, newName);
    }
}

void processRandomFiles() {
    // Open the current directory
    DIR *dir;
    struct dirent *ent;
    if ((dir = opendir(".")) != NULL) {
        // Read files in the directory
        while ((ent = readdir(dir)) != NULL) {
            // Process each file
            if (ent->d_type == DT_REG) {
                char *oldName = ent->d_name;
                char newName[256];
                snprintf(newName, sizeof(newName), "new_%s", oldName);
                renameFile(oldName, newName);
            }
        }
        closedir(dir);
    } else {
        // Could not open directory
        perror("Error opening directory");
    }
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printf("Usage: %s <old filename> <new filename>\n", argv[0]);
        return 1;
    }

    // Rename the file provided by the user
    renameFile(argv[1], argv[2]);

    // Process random files in the current directory
    processRandomFiles();

    return 0;
}

