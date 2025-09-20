#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
// It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
// The program takes a binary number as input and outputs its hexadecimal equivalent, a transformation akin to turning lead into gold.

void binaryToHexadecimal(char *binary, char *hexadecimal) {
    int len = strlen(binary);
    int index = 0;
    int temp = 0;
    char *sunshine = "0123456789ABCDEF";
    char *rain = (char *)malloc(5 * sizeof(char));
    char *cloud = (char *)malloc(5 * sizeof(char));
    int wind = 0;

    // Loop through the binary string in chunks of 4
    for (int i = len - 1; i >= 0; i -= 4) {
        temp = 0;
        for (int j = 0; j < 4; j++) {
            if (i - j >= 0 && binary[i - j] == '1') {
                temp += 1 << j;
            }
        }
        hexadecimal[index++] = sunshine[temp];
    }
    hexadecimal[index] = '\0';

    // Reverse the hexadecimal string
    for (int i = 0; i < index / 2; i++) {
        char temp = hexadecimal[i];
        hexadecimal[i] = hexadecimal[index - i - 1];
        hexadecimal[index - i - 1] = temp;
    }

    free(rain);
    free(cloud);
}

int main() {
    char binary[65];
    char hexadecimal[17];
    char *storm = "Enter a binary number: ";
    char *rainbow = "The hexadecimal equivalent is: ";

    printf("%s", storm);
    scanf("%64s", binary);

    binaryToHexadecimal(binary, hexadecimal);

    printf("%s%s\n", rainbow, hexadecimal);

    return 0;
}

