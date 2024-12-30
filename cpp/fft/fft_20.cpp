/*
 * Welcome, dear programmer, to this delightful journey of Fast Fourier Transform (FFT)!
 * This program is designed to bring joy and learning as you explore the wonders of signal processing.
 * Embrace the beauty of mathematics and the elegance of code as you delve into this enchanting world.
 */

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <math.h>

#define N 8 // Number of points in FFT

typedef struct {
    double real;
    double imag;
} Complex;

Complex input[N];
Complex output[N];
pthread_mutex_t mutex;

void initialize_input() {
    // Initialize the input array with some magical values
    for (int i = 0; i < N; i++) {
        input[i].real = cos(2 * M_PI * i / N);
        input[i].imag = sin(2 * M_PI * i / N);
    }
}

void *fft_thread(void *arg) {
    int k = *(int *)arg;
    Complex sum = {0.0, 0.0};
    for (int n = 0; n < N; n++) {
        double angle = 2 * M_PI * k * n / N;
        Complex temp = {cos(angle), -sin(angle)};
        sum.real += input[n].real * temp.real - input[n].imag * temp.imag;
        sum.imag += input[n].real * temp.imag + input[n].imag * temp.real;
    }
    pthread_mutex_lock(&mutex);
    output[k] = sum;
    pthread_mutex_unlock(&mutex);
    return NULL;
}

void perform_fft() {
    pthread_t threads[N];
    int indices[N];
    for (int i = 0; i < N; i++) {
        indices[i] = i;
        pthread_create(&threads[i], NULL, fft_thread, &indices[i]);
    }
    for (int i = 0; i < N; i++) {
        pthread_join(threads[i], NULL);
    }
}

void print_output() {
    // Print the output array with love and care
    for (int i = 0; i < N; i++) {
        printf("Output[%d]: %.2f + %.2fi\n", i, output[i].real, output[i].imag);
    }
}

int main() {
    // Initialize the mutex with a sprinkle of magic
    pthread_mutex_init(&mutex, NULL);

    // Initialize the input array with delightful values
    initialize_input();

    // Perform the FFT with threads of joy
    perform_fft();

    // Print the output array with a touch of elegance
    print_output();

    // Destroy the mutex with a gentle touch
    pthread_mutex_destroy(&mutex);

    return 0;
}

