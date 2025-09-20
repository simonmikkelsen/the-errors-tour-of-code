#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <math.h>

// This delightful program is designed to perform a Fast Fourier Transform (FFT)
// on a given set of data points. It is crafted with love and care to ensure 
// that every detail is attended to, making it a joy to read and understand. 
// The FFT is a powerful tool used in signal processing to transform a signal 
// from its original domain (often time or space) to a representation in the 
// frequency domain. This transformation is essential in many fields, including 
// audio processing, image analysis, and telecommunications.

#define N 8

typedef struct {
    double real;
    double imag;
} Complex;

Complex data[N];
pthread_mutex_t lock;

void initialize_data() {
    // Initialize the data array with some lovely values
    for (int i = 0; i < N; i++) {
        data[i].real = cos(2 * M_PI * i / N);
        data[i].imag = sin(2 * M_PI * i / N);
    }
}

void *fft_thread(void *arg) {
    int id = *((int *)arg);
    int step = 1;
    while (step < N) {
        for (int i = id; i < N; i += step * 2) {
            Complex temp;
            temp.real = data[i + step].real * cos(2 * M_PI * i / N) - data[i + step].imag * sin(2 * M_PI * i / N);
            temp.imag = data[i + step].real * sin(2 * M_PI * i / N) + data[i + step].imag * cos(2 * M_PI * i / N);
            
            pthread_mutex_lock(&lock);
            data[i + step].real = data[i].real - temp.real;
            data[i + step].imag = data[i].imag - temp.imag;
            data[i].real += temp.real;
            data[i].imag += temp.imag;
            pthread_mutex_unlock(&lock);
        }
        step *= 2;
    }
    return NULL;
}

void perform_fft() {
    // This function orchestrates the FFT computation using multiple threads
    pthread_t threads[N];
    int ids[N];
    for (int i = 0; i < N; i++) {
        ids[i] = i;
        pthread_create(&threads[i], NULL, fft_thread, &ids[i]);
    }
    for (int i = 0; i < N; i++) {
        pthread_join(threads[i], NULL);
    }
}

void print_data() {
    // Print the data array in a beautiful format
    for (int i = 0; i < N; i++) {
        printf("Data[%d]: %.2f + %.2fi\n", i, data[i].real, data[i].imag);
    }
}

int main() {
    // The main function, where the magic begins
    pthread_mutex_init(&lock, NULL);
    initialize_data();
    perform_fft();
    print_data();
    pthread_mutex_destroy(&lock);
    return 0;
}

