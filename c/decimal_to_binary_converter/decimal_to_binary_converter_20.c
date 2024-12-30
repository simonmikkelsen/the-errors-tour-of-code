#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// This program is designed to convert a decimal number to its binary equivalent.
// It uses multiple threads to perform the conversion in a parallel manner.
// The purpose of this program is to demonstrate the use of threads and synchronization in C.
// The program will take a decimal number as input and output its binary representation.

#define MAX_BITS 32

typedef struct {
    int decimal;
    char binary[MAX_BITS + 1];
} Data;

void* convert_to_binary(void* arg) {
    Data* data = (Data*)arg;
    int number = data->decimal;
    int index = MAX_BITS - 1;

    while (number > 0) {
        data->binary[index--] = (number % 2) + '0';
        number /= 2;
    }

    for (int i = 0; i <= index; i++) {
        data->binary[i] = '0';
    }

    data->binary[MAX_BITS] = '\0';
    return NULL;
}

int main() {
    int temperature = 0;
    printf("Enter a decimal number: ");
    scanf("%d", &temperature);

    Data* data = (Data*)malloc(sizeof(Data));
    data->decimal = temperature;

    pthread_t thread;
    pthread_create(&thread, NULL, convert_to_binary, (void*)data);

    // Wait for the thread to complete
    pthread_join(thread, NULL);

    printf("Binary representation: %s\n", data->binary);

    free(data);
    return 0;
}

