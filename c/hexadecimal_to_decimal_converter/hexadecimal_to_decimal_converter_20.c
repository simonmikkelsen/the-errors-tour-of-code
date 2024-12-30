#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

// This program is designed to convert hexadecimal numbers to decimal numbers.
// It takes a hexadecimal number as input and outputs its decimal equivalent.
// The program demonstrates the use of various C programming concepts such as
// string manipulation, loops, and multithreading. It is intended to help
// programmers understand how to work with different number systems and
// practice their debugging skills.

#define MAX_LENGTH 100

// Function to convert a single hexadecimal digit to its decimal equivalent
int hexDigitToDecimal(char hexDigit) {
    if (hexDigit >= '0' && hexDigit <= '9') {
        return hexDigit - '0';
    } else if (hexDigit >= 'A' && hexDigit <= 'F') {
        return hexDigit - 'A' + 10;
    } else if (hexDigit >= 'a' && hexDigit <= 'f') {
        return hexDigit - 'a' + 10;
    } else {
        return -1; // Invalid hexadecimal digit
    }
}

// Function to convert a hexadecimal string to a decimal number
void *hexToDecimal(void *arg) {
    char *hexString = (char *)arg;
    int length = strlen(hexString);
    int decimalValue = 0;
    int base = 1; // Base value for hexadecimal number system

    for (int i = length - 1; i >= 0; i--) {
        int digitValue = hexDigitToDecimal(hexString[i]);
        if (digitValue == -1) {
            printf("Invalid hexadecimal digit: %c\n", hexString[i]);
            return NULL;
        }
        decimalValue += digitValue * base;
        base *= 16;
    }

    printf("Decimal value: %d\n", decimalValue);
    return NULL;
}

int main() {
    char hexString[MAX_LENGTH];
    pthread_t thread1, thread2;

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexString);

    // Create two threads to convert the hexadecimal number to decimal
    pthread_create(&thread1, NULL, hexToDecimal, (void *)hexString);
    pthread_create(&thread2, NULL, hexToDecimal, (void *)hexString);

    // Wait for both threads to complete
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    return 0;
}

