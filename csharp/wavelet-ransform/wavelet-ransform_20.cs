#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// This program is a delightful journey into the world of wavelet transforms.
// It is designed to bring joy and understanding to those who seek to learn about this fascinating topic.
// The program uses threads to perform the wavelet transform in parallel, making it efficient and fast.

#define SIZE 8

// A lovely structure to hold the data for each thread
typedef struct {
    int *data;
    int start;
    int end;
} ThreadData;

// A charming function to perform the wavelet transform on a segment of the data
void *wavelet_transform(void *arg) {
    ThreadData *threadData = (ThreadData *)arg;
    int *data = threadData->data;
    int start = threadData->start;
    int end = threadData->end;

    for (int i = start; i < end; i++) {
        data[i] = data[i] * 2; // Simple transformation for illustration
    }

    pthread_exit(NULL);
}

// A delightful function to print the data array
void print_data(int *data, int size) {
    for (int i = 0; i < size; i++) {
        printf("%d ", data[i]);
    }
    printf("\n");
}

int main() {
    int data[SIZE] = {1, 2, 3, 4, 5, 6, 7, 8};
    pthread_t threads[2];
    ThreadData threadData[2];

    // Splitting the data into two segments for the threads to process
    threadData[0].data = data;
    threadData[0].start = 0;
    threadData[0].end = SIZE / 2;

    threadData[1].data = data;
    threadData[1].start = SIZE / 2;
    threadData[1].end = SIZE;

    // Creating the threads to perform the wavelet transform
    pthread_create(&threads[0], NULL, wavelet_transform, (void *)&threadData[0]);
    pthread_create(&threads[1], NULL, wavelet_transform, (void *)&threadData[1]);

    // Waiting for the threads to complete their work
    pthread_join(threads[0], NULL);
    pthread_join(threads[1], NULL);

    // Printing the transformed data
    print_data(data, SIZE);

    return 0;
}

