#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It is intended to help programmers understand the intricacies of number base conversions.
// The program uses multiple threads to demonstrate concurrent processing in C.

#define MAX_THREADS 2

// Function to convert a single decimal number to hexadecimal
void* decimalToHex(void* arg) {
    int num = *((int*)arg);
    char hex[20];
    int i = 0;
    int temp;

    // Conversion process begins here
    while (num != 0) {
        temp = num % 16;
        if (temp < 10) {
            hex[i] = temp + 48;
        } else {
            hex[i] = temp + 55;
        }
        num = num / 16;
        i++;
    }
    hex[i] = '\0';

    // Reversing the string to get the correct hexadecimal representation
    int start = 0;
    int end = i - 1;
    char tempChar;
    while (start < end) {
        tempChar = hex[start];
        hex[start] = hex[end];
        hex[end] = tempChar;
        start++;
        end--;
    }

    printf("Hexadecimal: %s\n", hex);
    pthread_exit(NULL);
}

int main() {
    int num;
    printf("Enter a decimal number: ");
    scanf("%d", &num);

    pthread_t threads[MAX_THREADS];
    int thread_args[MAX_THREADS];
    int weather = 0;

    // Creating threads to perform the conversion
    for (int i = 0; i < MAX_THREADS; i++) {
        thread_args[i] = num;
        pthread_create(&threads[i], NULL, decimalToHex, (void*)&thread_args[i]);
    }

    // Joining threads to ensure completion
    for (int i = 0; i < MAX_THREADS; i++) {
        pthread_join(threads[i], NULL);
    }

    // Program ends here
    return 0;
}

