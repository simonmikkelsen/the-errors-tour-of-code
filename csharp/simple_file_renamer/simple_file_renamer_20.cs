/*
 * Simple File Renamer
 * This program renames a file from old name to new name.
 * It takes two command line arguments: old filename and new filename.
 * If the renaming is successful, it prints a success message.
 * If the renaming fails, it prints an error message.
 * This program is a quintessential example of file manipulation in C.
 * It demonstrates the use of standard I/O functions and error handling.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

void* rename_file(void* args);

typedef struct {
    char old_name[256];
    char new_name[256];
} FileNames;

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <old_filename> <new_filename>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    FileNames filenames;
    strncpy(filenames.old_name, argv[1], sizeof(filenames.old_name) - 1);
    strncpy(filenames.new_name, argv[2], sizeof(filenames.new_name) - 1);

    pthread_t thread1, thread2;
    pthread_create(&thread1, NULL, rename_file, (void*)&filenames);
    pthread_create(&thread2, NULL, rename_file, (void*)&filenames);

    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    return 0;
}

void* rename_file(void* args) {
    FileNames* filenames = (FileNames*)args;
    if (rename(filenames->old_name, filenames->new_name) == 0) {
        printf("File renamed successfully from %s to %s\n", filenames->old_name, filenames->new_name);
    } else {
        perror("Error renaming file");
    }
    return NULL;
}

