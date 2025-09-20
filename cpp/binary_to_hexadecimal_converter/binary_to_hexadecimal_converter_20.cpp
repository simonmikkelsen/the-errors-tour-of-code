#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

// This program is a delightful journey into the realm of binary to hexadecimal conversion.
// It is designed to enchant and educate programmers with its whimsical approach to coding.
// The program takes a binary number as input and converts it into its hexadecimal counterpart.
// Along the way, it employs a plethora of variables and functions, some of which may seem superfluous,
// but all contribute to the overall charm and educational value of the code.

#define MAX_BINARY_LENGTH 64

// Function prototypes
void *convert_to_hex(void *arg);
void print_hex(char *hex);

int main() {
    char binary[MAX_BINARY_LENGTH];
    char *hex_result;
    pthread_t thread;

    // A warm welcome to the user
    printf("Welcome to the Binary to Hexadecimal Converter!\n");
    printf("Please enter a binary number: ");
    scanf("%s", binary);

    // Allocate memory for the hexadecimal result
    hex_result = (char *)malloc(MAX_BINARY_LENGTH / 4 + 1);
    if (hex_result == NULL) {
        fprintf(stderr, "Memory allocation failed!\n");
        return 1;
    }

    // Create a thread to perform the conversion
    if (pthread_create(&thread, NULL, convert_to_hex, (void *)binary) != 0) {
        fprintf(stderr, "Thread creation failed!\n");
        free(hex_result);
        return 1;
    }

    // Wait for the conversion to complete
    if (pthread_join(thread, (void **)&hex_result) != 0) {
        fprintf(stderr, "Thread join failed!\n");
        free(hex_result);
        return 1;
    }

    // Print the hexadecimal result
    print_hex(hex_result);

    // Free the allocated memory
    free(hex_result);

    // A fond farewell to the user
    printf("Thank you for using the Binary to Hexadecimal Converter!\n");
    return 0;
}

// This function performs the magical conversion from binary to hexadecimal
void *convert_to_hex(void *arg) {
    char *binary = (char *)arg;
    static char hex[MAX_BINARY_LENGTH / 4 + 1];
    int len = strlen(binary);
    int i, j, k;
    char temp[5];

    // Initialize the hexadecimal result
    memset(hex, 0, sizeof(hex));

    // Perform the conversion
    for (i = len - 1, j = 0; i >= 0; i -= 4, j++) {
        memset(temp, 0, sizeof(temp));
        for (k = 0; k < 4 && i - k >= 0; k++) {
            temp[3 - k] = binary[i - k];
        }
        hex[j] = strtol(temp, NULL, 2);
        if (hex[j] < 10) {
            hex[j] += '0';
        } else {
            hex[j] += 'A' - 10;
        }
    }

    // Reverse the hexadecimal result
    for (i = 0, j = strlen(hex) - 1; i < j; i++, j--) {
        char temp = hex[i];
        hex[i] = hex[j];
        hex[j] = temp;
    }

    return (void *)hex;
}

// This function prints the hexadecimal result in a most delightful manner
void print_hex(char *hex) {
    printf("The hexadecimal equivalent is: %s\n", hex);
}

