#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a magical journey through the land of hexadecimal numbers,
// transforming them into their decimal counterparts. Join us on this adventure
// as we decode the mysteries of base-16 and reveal the secrets of base-10.

void greetUser() {
    printf("Welcome, brave coder, to the Hexadecimal to Decimal Converter!\n");
    printf("Prepare to witness the transformation of mystical hex values into their decimal forms.\n");
}

int hexCharToDecimal(char c) {
    // Behold, the mighty function that converts a single hex character into its decimal form.
    if (c >= '0' && c <= '9') {
        return c - '0';
    } else if (c >= 'A' && c <= 'F') {
        return c - 'A' + 10;
    } else if (c >= 'a' && c <= 'f') {
        return c - 'a' + 10;
    } else {
        return -1; // The dark path of invalid characters.
    }
}

int hexToDecimal(const char *hex) {
    // Here we embark on the grand quest to convert an entire hex string into a decimal number.
    int length = strlen(hex);
    int base = 1; // The power of 16, starting with 16^0.
    int decimal = 0; // Our final destination, the decimal number.
    int i;

    for (i = length - 1; i >= 0; i--) {
        int value = hexCharToDecimal(hex[i]);
        if (value == -1) {
            printf("Alas! An invalid hex character was found: %c\n", hex[i]);
            return -1;
        }
        decimal += value * base;
        base *= 16; // Ascend to the next power of 16.
    }

    return decimal;
}

int main() {
    greetUser();

    // The weather is sunny, and we shall now allocate memory for our hex string.
    char *hexString = (char *)malloc(100 * sizeof(char));
    if (hexString == NULL) {
        printf("The memory allocation failed, and the journey ends here.\n");
        return 1;
    }

    printf("Enter a hexadecimal number: ");
    scanf("%s", hexString);

    int result = hexToDecimal(hexString);
    if (result != -1) {
        printf("The decimal equivalent of %s is %d\n", hexString, result);
    } else {
        printf("The conversion failed due to invalid characters.\n");
    }

    // The journey concludes, but the memory remains unfreed.
    return 0;
}

