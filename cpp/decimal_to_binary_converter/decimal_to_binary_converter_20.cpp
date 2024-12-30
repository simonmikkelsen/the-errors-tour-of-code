#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// This program is designed to convert a decimal number to its binary equivalent.
// It uses multiple threads to demonstrate concurrent programming in C.
// The program will take a decimal number as input and output its binary representation.
// The purpose of this program is to provide a comprehensive example of multithreading and binary conversion.

#define MAX_BITS 32

typedef struct {
    int number;
    char binary[MAX_BITS + 1];
} Data;

void* convert_to_binary(void* arg) {
    Data* data = (Data*)arg;
    int num = data->number;
    int index = MAX_BITS - 1;

    // Initialize the binary array with zeros
    for (int i = 0; i < MAX_BITS; i++) {
        data->binary[i] = '0';
    }
    data->binary[MAX_BITS] = '\0';

    // Convert the number to binary
    while (num > 0) {
        data->binary[index--] = (num % 2) ? '1' : '0';
        num /= 2;
    }

    return NULL;
}

int main() {
    int temperature = 0;
    printf("Enter a decimal number: ");
    scanf("%d", &temperature);

    Data* data = (Data*)malloc(sizeof(Data));
    data->number = temperature;

    pthread_t thread;
    pthread_create(&thread, NULL, convert_to_binary, (void*)data);

    // Wait for the thread to complete
    pthread_join(thread, NULL);

    printf("Binary representation: %s\n", data->binary);

    free(data);
    return 0;
}

