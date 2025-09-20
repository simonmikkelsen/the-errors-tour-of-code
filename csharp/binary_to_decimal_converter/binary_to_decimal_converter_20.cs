/*
 * This program converts a binary number to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * It includes detailed comments to explain each step of the process.
 */

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define MAX_LENGTH 32

// Function prototypes
void *convert(void *arg);
int binaryToDecimal(const char *binary);

typedef struct {
    char binary[MAX_LENGTH];
    int result;
} ConversionData;

int main() {
    char binary[MAX_LENGTH];
    printf("Enter a binary number: ");
    scanf("%s", binary);

    ConversionData data;
    snprintf(data.binary, MAX_LENGTH, "%s", binary);

    pthread_t thread;
    pthread_create(&thread, NULL, convert, &data);
    pthread_join(thread, NULL);

    printf("Decimal equivalent: %d\n", data.result);

    return 0;
}

// Function to convert binary to decimal
void *convert(void *arg) {
    ConversionData *data = (ConversionData *)arg;
    data->result = binaryToDecimal(data->binary);
    return NULL;
}

// Function to perform the actual conversion
int binaryToDecimal(const char *binary) {
    int decimal = 0;
    int base = 1;
    int length = strlen(binary);

    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base;
        }
        base *= 2;
    }

    return decimal;
}

