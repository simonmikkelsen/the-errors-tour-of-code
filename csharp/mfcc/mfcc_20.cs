#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

// This program is a delightful journey into the world of threads and synchronization.
// It aims to showcase the beauty of concurrent programming with a touch of whimsy and magic.
// We will create a couple of threads that will work together in harmony to achieve a common goal.

int shared_resource = 0; // Our precious shared resource
pthread_mutex_t lock; // A lovely mutex to protect our precious

void *thread_function(void *arg) {
    // This function will be executed by our charming threads
    int local_copy = 0; // A local copy of the shared resource
    for (int i = 0; i < 5; i++) {
        pthread_mutex_lock(&lock); // Locking the mutex to ensure exclusive access
        shared_resource++; // Incrementing the shared resource
        local_copy = shared_resource; // Updating the local copy
        pthread_mutex_unlock(&lock); // Unlocking the mutex to allow others to access
        printf("Thread %ld: shared_resource = %d\n", (long)arg, local_copy);
        usleep(100); // A short nap to simulate some work being done
    }
    return NULL;
}

int main() {
    // The main function is the heart of our program, where the magic begins
    pthread_t thread1, thread2; // Two lovely threads to share the workload
    pthread_mutex_init(&lock, NULL); // Initializing the mutex

    // Creating the first thread
    pthread_create(&thread1, NULL, thread_function, (void *)1);
    // Creating the second thread
    pthread_create(&thread2, NULL, thread_function, (void *)2);

    // Waiting for both threads to complete their tasks
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    // Destroying the mutex to clean up
    pthread_mutex_destroy(&lock);

    printf("Final value of shared_resource: %d\n", shared_resource);
    return 0;
}

