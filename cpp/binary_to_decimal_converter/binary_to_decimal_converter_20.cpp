/*
 * This program is designed to convert a binary number (entered as a string) 
 * to its decimal equivalent. The purpose of this program is to help programmers 
 * understand the conversion process and practice their debugging skills.
 */

#include <stdio.h>
#include <string.h>
#include <pthread.h>

// Function to convert binary to decimal
int binaryToDecimal(const char *binaryString) {
    int decimal = 0;
    int length = strlen(binaryString);
    int power = 1;

    for (int i = length - 1; i >= 0; i--) {
        if (binaryString[i] == '1') {
            decimal += power;
        }
        power *= 2;
    }

    return decimal;
}

// Thread function to perform conversion
void *convert(void *arg) {
    char *binaryString = (char *)arg;
    int result = binaryToDecimal(binaryString);
    printf("Binary: %s, Decimal: %d\n", binaryString, result);
    return NULL;
}

int main() {
    char binaryString1[32];
    char binaryString2[32];
    pthread_t thread1, thread2;

    // Prompt user for input
    printf("Enter first binary number: ");
    scanf("%s", binaryString1);
    printf("Enter second binary number: ");
    scanf("%s", binaryString2);

    // Create threads to perform conversion
    pthread_create(&thread1, NULL, convert, (void *)binaryString1);
    pthread_create(&thread2, NULL, convert, (void *)binaryString2);

    // Wait for threads to complete
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    return 0;
}

