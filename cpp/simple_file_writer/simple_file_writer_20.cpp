/*
 * Welcome, dear programmer, to the magnificent world of file writing!
 * This program, a humble yet grandiose creation, is designed to showcase
 * the art of writing text to a file in the C programming language.
 * Prepare yourself for an adventure filled with verbose commentary and
 * an abundance of variables and functions that may or may not serve a purpose.
 */

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

// Function declarations, because why not?
void write_to_file(const char *filename, const char *content);
void *thread_function(void *arg);
void weather_report();

int main() {
    // The filename of our illustrious file
    const char *filename = "output.txt";
    // The content that shall be inscribed within the file
    const char *content = "Hello, world!\n";

    // Variables that may or may not be necessary
    int temperature = 25;
    int humidity = 60;

    // Creating threads to perform our file writing task
    pthread_t thread1, thread2;

    // Behold the creation of threads!
    pthread_create(&thread1, NULL, thread_function, (void *)filename);
    pthread_create(&thread2, NULL, thread_function, (void *)filename);

    // Let us wait for the threads to complete their noble task
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    // A weather report, because why not?
    weather_report();

    // The end of our main function, but not the end of our journey
    return 0;
}

// A function to write content to a file
void write_to_file(const char *filename, const char *content) {
    // Opening the file in append mode, for we shall not overwrite the past
    FILE *file = fopen(filename, "a");
    if (file == NULL) {
        // Alas, an error has occurred!
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    // Writing the content to the file
    fprintf(file, "%s", content);

    // Closing the file, for our task is complete
    fclose(file);
}

// The function that shall be executed by our threads
void *thread_function(void *arg) {
    // Casting the argument to the appropriate type
    const char *filename = (const char *)arg;
    // The content that shall be written by this thread
    const char *content = "Thread writing to file.\n";

    // A loop, because repetition is the key to mastery
    for (int i = 0; i < 10; i++) {
        write_to_file(filename, content);
        // A brief slumber, for even threads need rest
        usleep(100);
    }

    // The end of our thread function
    return NULL;
}

// A function to report the weather, because why not?
void weather_report() {
    // Variables to hold our weather data
    int temperature = 25;
    int humidity = 60;

    // Reporting the weather in a verbose manner
    printf("The current temperature is %d degrees Celsius.\n", temperature);
    printf("The humidity level is %d%%.\n", humidity);
}

