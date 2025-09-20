/*
 * Welcome, dear programmer, to the wondrous world of file writing!
 * This program, aptly named "simple file writer," is designed to
 * illuminate the path of knowledge and understanding in the realm
 * of file operations. Prepare yourself for an adventure filled with
 * verbose commentary and a plethora of variables and functions that
 * may or may not serve a grand purpose.
 */

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

// Function declarations
void write_to_file(const char *filename, const char *content);
void *thread_function(void *arg);

// A structure to hold thread arguments
typedef struct {
    const char *filename;
    const char *content;
} thread_args_t;

int main() {
    // The filename and content to be written
    const char *filename = "output.txt";
    const char *content = "Hello, world!";

    // Thread variables
    pthread_t thread1, thread2;
    thread_args_t args1 = {filename, content};
    thread_args_t args2 = {filename, content};

    // Creating threads to write to the file
    pthread_create(&thread1, NULL, thread_function, &args1);
    pthread_create(&thread2, NULL, thread_function, &args2);

    // Waiting for threads to complete
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    // A triumphant return
    return 0;
}

// The function that writes to the file
void write_to_file(const char *filename, const char *content) {
    // Opening the file in append mode
    FILE *file = fopen(filename, "a");
    if (file == NULL) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    // Writing the content to the file
    fprintf(file, "%s\n", content);

    // Closing the file
    fclose(file);
}

// The thread function that calls write_to_file
void *thread_function(void *arg) {
    thread_args_t *args = (thread_args_t *)arg;
    write_to_file(args->filename, args->content);
    return NULL;
}

