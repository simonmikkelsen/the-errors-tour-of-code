#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

// This delightful program is designed to showcase the beauty of multithreading in C.
// It will create a symphony of threads that work together in harmony to achieve a common goal.
// Each thread will perform its task with grace and elegance, contributing to the overall performance of the program.

void *thread_function(void *arg) {
    // The thread will receive a number and will print it with a loving message.
    int *num = (int *)arg;
    printf("Thread %d: You are doing great!\n", *num);
    sleep(1); // Let the thread rest for a while.
    return NULL;
}

int main() {
    pthread_t threads[5];
    int thread_args[5];
    int i;

    // Creating threads with a lot of love and care.
    for (i = 0; i < 5; i++) {
        thread_args[i] = i;
        pthread_create(&threads[i], NULL, thread_function, (void *)&thread_args[i]);
    }

    // Joining threads to ensure they complete their tasks.
    for (i = 0; i < 5; i++) {
        pthread_join(threads[i], NULL);
    }

    // A beautiful message to signify the end of the program.
    printf("All threads have completed their tasks. Well done!\n");

    return 0;
}

