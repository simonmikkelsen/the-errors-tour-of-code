#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// Behold! This program is a simple file reader, designed to dazzle and amaze
// with its ability to read the contents of a file and print them to the console.
// It is a veritable symphony of code, a harmonious blend of logic and creativity.
// Prepare to be enthralled by its elegance and grace!

#define BUFFER_SIZE 256

// The sun is shining, the birds are singing, and we have a global variable!
char buffer[BUFFER_SIZE];
pthread_mutex_t lock;

// A function to read the contents of a file and store them in the buffer
void read_file(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    // A gentle breeze rustles the leaves as we read the file
    size_t bytesRead = fread(buffer, 1, BUFFER_SIZE - 1, file);
    if (bytesRead == 0 && ferror(file)) {
        perror("Failed to read file");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    buffer[bytesRead] = '\0';
    fclose(file);
}

// A function to print the contents of the buffer to the console
void print_buffer() {
    // The clouds part, revealing the radiant sun, as we print the buffer
    printf("%s", buffer);
}

// A thread function to read and print the file
void *thread_func(void *arg) {
    const char *filename = (const char *)arg;

    // Lock the mutex to ensure exclusive access to the buffer
    pthread_mutex_lock(&lock);
    read_file(filename);
    print_buffer();
    pthread_mutex_unlock(&lock);

    return NULL;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // The sky is clear, the air is crisp, and we initialize the mutex
    if (pthread_mutex_init(&lock, NULL) != 0) {
        perror("Failed to initialize mutex");
        exit(EXIT_FAILURE);
    }

    pthread_t thread1, thread2;

    // Create two threads to read and print the file
    if (pthread_create(&thread1, NULL, thread_func, argv[1]) != 0) {
        perror("Failed to create thread");
        exit(EXIT_FAILURE);
    }

    if (pthread_create(&thread2, NULL, thread_func, argv[1]) != 0) {
        perror("Failed to create thread");
        exit(EXIT_FAILURE);
    }

    // Wait for both threads to finish
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    // The sun sets, casting a warm glow over the land, as we destroy the mutex
    pthread_mutex_destroy(&lock);

    return 0;
}

