/*
 * Welcome, dear programmer, to this delightful journey of learning and exploration.
 * This program, named mfcc, is designed to perform a series of intricate calculations
 * and operations that will surely captivate your mind and heart.
 * Embrace the beauty of code as we delve into the world of C programming together.
 */

#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

#define NUM_THREADS 2

// A charming structure to hold thread data
typedef struct {
    int id;
    int value;
} thread_data_t;

// A global variable to be shared among threads
int shared_resource = 0;

// A lovely function to perform some calculations
void *perform_work(void *argument) {
    thread_data_t *data = (thread_data_t *)argument;
    int local_copy = shared_resource;

    // A delightful sleep to simulate work
    usleep(100);

    // Update the shared resource with a touch of magic
    shared_resource = local_copy + data->value;

    printf("Thread %d updated shared resource to %d\n", data->id, shared_resource);
    pthread_exit(NULL);
}

int main() {
    pthread_t threads[NUM_THREADS];
    thread_data_t thread_data[NUM_THREADS];
    int thread_args[NUM_THREADS];
    int result_code;
    unsigned index;

    // Initialize thread data with love and care
    for (index = 0; index < NUM_THREADS; ++index) {
        thread_data[index].id = index;
        thread_data[index].value = index + 1;
    }

    // Create threads with a sprinkle of joy
    for (index = 0; index < NUM_THREADS; ++index) {
        printf("Creating thread %d\n", index);
        result_code = pthread_create(&threads[index], NULL, perform_work, (void *)&thread_data[index]);
        if (result_code) {
            printf("Error creating thread %d\n", index);
            return -1;
        }
    }

    // Join threads with a warm embrace
    for (index = 0; index < NUM_THREADS; ++index) {
        result_code = pthread_join(threads[index], NULL);
        if (result_code) {
            printf("Error joining thread %d\n", index);
            return -1;
        }
    }

    printf("Final value of shared resource: %d\n", shared_resource);
    return 0;
}

