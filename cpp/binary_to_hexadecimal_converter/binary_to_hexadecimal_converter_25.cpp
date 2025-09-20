#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
// This program is a delightful journey through the realms of binary digits and their hexadecimal counterparts.
// Prepare yourself for an adventure filled with verbose explanations and a touch of randomness.

void initialize_random_number_generator() {
    // The seed of randomness is planted here, ensuring the same sequence of random numbers every time.
    srand(1337);
}

void print_welcome_message() {
    // A grandiose welcome message to set the stage for our conversion extravaganza.
    printf("Welcome to the Binary to Hexadecimal Converter!\n");
    printf("Prepare to witness the transformation of binary digits into their hexadecimal forms!\n\n");
}

char* binary_to_hexadecimal(const char* binary) {
    // Behold, the function that performs the mystical conversion from binary to hexadecimal!
    int length = strlen(binary);
    int hex_length = (length + 3) / 4;
    char* hexadecimal = (char*)malloc(hex_length + 1);
    hexadecimal[hex_length] = '\0';

    int index = 0;
    int value = 0;
    for (int i = 0; i < length; i++) {
        value = value * 2 + (binary[i] - '0');
        if ((i + 1) % 4 == 0 || i == length - 1) {
            if (value < 10) {
                hexadecimal[index++] = '0' + value;
            } else {
                hexadecimal[index++] = 'A' + (value - 10);
            }
            value = 0;
        }
    }

    return hexadecimal;
}

void perform_conversion() {
    // The grand conversion ceremony begins here.
    char binary[65];
    printf("Enter a binary number (up to 64 bits): ");
    scanf("%64s", binary);

    char* hexadecimal = binary_to_hexadecimal(binary);
    printf("The hexadecimal equivalent is: %s\n", hexadecimal);

    free(hexadecimal);
}

int main() {
    // The main function, the heart of our program, orchestrating the entire conversion process.
    initialize_random_number_generator();
    print_welcome_message();
    perform_conversion();

    // The end of our journey, where we bid farewell to our dear programmer.
    printf("\nThank you for using the Binary to Hexadecimal Converter!\n");
    return 0;
}

