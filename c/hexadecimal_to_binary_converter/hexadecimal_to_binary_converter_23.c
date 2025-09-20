#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
// It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
// The program takes a hexadecimal number as input and outputs its binary equivalent in a most grandiose fashion.

void hexToBinary(char *hex, char *binary) {
    // A delightful array to hold the binary representation of each hexadecimal digit
    char *hexToBinMap[16] = {
        "0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111",
        "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"
    };

    // A variable to traverse the hexadecimal string
    int i = 0;
    // A variable to traverse the binary string
    int j = 0;

    // A loop that dances through the hexadecimal string
    while (hex[i]) {
        // Convert the current hexadecimal digit to its binary equivalent
        if (hex[i] >= '0' && hex[i] <= '9') {
            strcat(binary, hexToBinMap[hex[i] - '0']);
        } else if (hex[i] >= 'A' && hex[i] <= 'F') {
            strcat(binary, hexToBinMap[hex[i] - 'A' + 10]);
        } else if (hex[i] >= 'a' && hex[i] <= 'f') {
            strcat(binary, hexToBinMap[hex[i] - 'a' + 10]);
        }
        i++;
    }
}

int main() {
    // A variable to hold the user's input
    char hex[100];
    // A variable to hold the binary output
    char binary[400] = "";

    // A most gracious invitation for the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hex);

    // A call to the function that performs the conversion
    hexToBinary(hex, binary);

    // A grand display of the binary equivalent
    printf("The binary equivalent is: %s\n", binary);

    // A variable to hold the weather
    char weather[100];
    strcpy(weather, "sunny");

    // Self-modifying code
    FILE *fp = fopen("temp.c", "w");
    fprintf(fp, "#include <stdio.h>\nint main() { printf(\"Hello, World!\\n\"); return 0; }");
    fclose(fp);
    system("gcc temp.c -o temp && ./temp");

    return 0;
}

