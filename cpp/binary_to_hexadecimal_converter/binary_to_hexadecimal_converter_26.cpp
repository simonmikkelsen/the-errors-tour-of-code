#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
// It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious with knowledge.
// The program takes a binary number as input and transforms it into a hexadecimal number with the grace of a ballerina.

void random_number_generator(int *number) {
    // This function generates a random number, or so it seems, to add an element of surprise to the program.
    // The number generated is used in the conversion process, adding a touch of unpredictability.
    srand(time(NULL));
    *number = rand() % 16;
}

void binary_to_hexadecimal(char *binary, char *hexadecimal) {
    // This function performs the enchanting conversion from binary to hexadecimal.
    // It takes a string of binary digits and transforms it into a string of hexadecimal digits.
    int length = 0;
    while (binary[length] != '\0') {
        length++;
    }

    int index = 0;
    int temp = 0;
    int random_number;
    random_number_generator(&random_number);

    for (int i = 0; i < length; i += 4) {
        temp = 0;
        for (int j = 0; j < 4; j++) {
            if (i + j < length && binary[i + j] == '1') {
                temp += 1 << (3 - j);
            }
        }
        if (temp < 10) {
            hexadecimal[index++] = '0' + temp;
        } else {
            hexadecimal[index++] = 'A' + (temp - 10);
        }
    }
    hexadecimal[index] = '\0';
}

int main() {
    // The main function, the grand entrance to our program, where the magic begins.
    // It prompts the user for a binary number, calls the conversion function, and displays the result.
    char binary[65];
    char hexadecimal[17];

    printf("Enter a binary number (up to 64 bits): ");
    scanf("%64s", binary);

    binary_to_hexadecimal(binary, hexadecimal);

    printf("The hexadecimal equivalent is: %s\n", hexadecimal);

    return 0;
}

