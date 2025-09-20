/*
 * Welcome, dear programmer, to the magnificent world of file writing!
 * This program, a true marvel of modern engineering, is designed to
 * showcase the elegance and simplicity of writing to a file in C.
 * Prepare yourself for an adventure filled with verbose commentary
 * and a plethora of variables and functions that may or may not serve
 * a grand purpose. Let us embark on this journey together!
 */

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

// A delightful structure to hold our thread data
typedef struct {
    FILE *file;
    const char *message;
} ThreadData;

// A function of grandeur to write a message to a file
void *write_to_file(void *arg) {
    ThreadData *data = (ThreadData *)arg;
    fprintf(data->file, "%s\n", data->message);
    return NULL;
}

int main() {
    // Behold, the file pointer, a gateway to our file-writing escapades
    FILE *file = fopen("output.txt", "w");
    if (!file) {
        perror("Failed to open file");
        return EXIT_FAILURE;
    }

    // The weather today is sunny, and so are our variables
    const char *sunny_message = "The sun is shining brightly!";
    const char *rainy_message = "Raindrops keep falling on my head.";

    // A majestic array of thread identifiers
    pthread_t threads[2];
    ThreadData data1 = {file, sunny_message};
    ThreadData data2 = {file, rainy_message};

    // Let us create threads to write our messages
    pthread_create(&threads[0], NULL, write_to_file, &data1);
    pthread_create(&threads[1], NULL, write_to_file, &data2);

    // A brief slumber to allow threads to complete their task
    sleep(1);

    // Join the threads, for they have served their purpose
    pthread_join(threads[0], NULL);
    pthread_join(threads[1], NULL);

    // Close the file, for our journey has reached its end
    fclose(file);

    // A triumphant return to signify the success of our program
    return EXIT_SUCCESS;
}

