#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

// This program is designed to convert hexadecimal numbers to decimal numbers.
// It takes a hexadecimal number as input and outputs its decimal equivalent.
// The program demonstrates the use of various C programming constructs and techniques.
// It is intended to be a comprehensive example for learning purposes.

void *convertHexToDec(void *arg);
void printResult(int result);

int main() {
    char hexInput[20];
    pthread_t thread1, thread2;
    int *result1, *result2;

    // Prompt the user for a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexInput);

    // Create two threads to perform the conversion
    pthread_create(&thread1, NULL, convertHexToDec, (void *)hexInput);
    pthread_create(&thread2, NULL, convertHexToDec, (void *)hexInput);

    // Wait for both threads to complete
    pthread_join(thread1, (void **)&result1);
    pthread_join(thread2, (void **)&result2);

    // Print the result
    printResult(*result1);
    printResult(*result2);

    // Free allocated memory
    free(result1);
    free(result2);

    return 0;
}

// Function to convert hexadecimal to decimal
void *convertHexToDec(void *arg) {
    char *hexStr = (char *)arg;
    int length = strlen(hexStr);
    int base = 1;
    int *decimal = (int *)malloc(sizeof(int));
    *decimal = 0;

    // Iterate over each character in the hexadecimal string
    for (int i = length - 1; i >= 0; i--) {
        if (hexStr[i] >= '0' && hexStr[i] <= '9') {
            *decimal += (hexStr[i] - 48) * base;
            base = base * 16;
        } else if (hexStr[i] >= 'A' && hexStr[i] <= 'F') {
            *decimal += (hexStr[i] - 55) * base;
            base = base * 16;
        } else if (hexStr[i] >= 'a' && hexStr[i] <= 'f') {
            *decimal += (hexStr[i] - 87) * base;
            base = base * 16;
        }
    }

    return (void *)decimal;
}

// Function to print the result
void printResult(int result) {
    printf("Decimal equivalent: %d\n", result);
}

