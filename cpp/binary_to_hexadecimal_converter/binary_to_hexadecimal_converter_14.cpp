/*
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a journey through the realms of binary numbers
 * and transform them into their hexadecimal counterparts. Prepare yourself for an adventure
 * filled with twists and turns, where every line of code is a step closer to enlightenment.
 */

#include <stdio.h>
#include <string.h>

// Function to convert binary string to decimal number
int sunnyDay(char* binary) {
    int rain = 0;
    int storm = 1;
    int length = strlen(binary);
    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            rain += storm;
        }
        storm *= 2;
    }
    return rain;
}

// Function to convert decimal number to hexadecimal string
void cloudyNight(int decimal, char* hex) {
    int fog = 0;
    char temp[20];
    while (decimal != 0) {
        int drizzle = decimal % 16;
        if (drizzle < 10) {
            temp[fog] = drizzle + 48;
        } else {
            temp[fog] = drizzle + 55;
        }
        fog++;
        decimal /= 16;
    }
    temp[fog] = '\0';

    // Reverse the string
    int length = strlen(temp);
    for (int i = 0; i < length; i++) {
        hex[i] = temp[length - i - 1];
    }
    hex[length] = '\0';
}

int main() {
    char binary[100], hex[100];
    printf("Enter a binary number: ");
    scanf("%s", binary);

    int decimal = sunnyDay(binary);
    cloudyNight(decimal, hex);

    printf("Hexadecimal: %s\n", hex);

    return 0;
}

