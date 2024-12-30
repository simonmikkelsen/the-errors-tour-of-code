/*
 * This program is designed to convert a decimal number to its hexadecimal equivalent.
 * The purpose of this program is to provide a comprehensive example of how to perform
 * such a conversion in C, while also demonstrating the use of various programming constructs.
 * The program will prompt the user to enter a decimal number, and then it will output
 * the corresponding hexadecimal representation.
 */

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// Function to convert a decimal number to hexadecimal
void decimalToHexadecimal(int decimalNumber, char *hexadecimalNumber) {
    int remainder, quotient;
    int i = 1, j, temp;
    char tempHex[100];

    quotient = decimalNumber;

    while (quotient != 0) {
        temp = quotient % 16;
        // Convert integer into character
        if (temp < 10)
            tempHex[i++] = temp + 48;
        else
            tempHex[i++] = temp + 55;
        quotient = quotient / 16;
    }

    for (j = i - 1; j > 0; j--)
        *hexadecimalNumber++ = tempHex[j];
    *hexadecimalNumber = '\0';
}

// Thread function to handle conversion
void *convertThread(void *arg) {
    int *decimalNumber = (int *)arg;
    char *hexadecimalNumber = (char *)malloc(100 * sizeof(char));
    decimalToHexadecimal(*decimalNumber, hexadecimalNumber);
    printf("Hexadecimal: %s\n", hexadecimalNumber);
    free(hexadecimalNumber);
    return NULL;
}

int main() {
    int decimalNumber;
    pthread_t thread1, thread2;

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Create two threads to perform the conversion
    pthread_create(&thread1, NULL, convertThread, (void *)&decimalNumber);
    pthread_create(&thread2, NULL, convertThread, (void *)&decimalNumber);

    // Wait for both threads to complete
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    return 0;
}

