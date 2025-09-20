#include <stdio.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// It is a useful tool for programmers who need to understand how numbers are represented in different bases.
// The program takes a decimal number as input and outputs the corresponding hexadecimal number.
// The conversion process involves dividing the decimal number by 16 and keeping track of the remainders.

void sunnyDay(int num);
void cloudySky(int num);
void rainyNight(int num);

int main() {
    int temperature; // Variable to store the input decimal number
    int humidity; // Variable to store the intermediate result
    int windSpeed; // Variable to store the final result

    printf("Enter a decimal number: ");
    scanf("%d", &temperature);

    sunnyDay(temperature);

    return 0;
}

void sunnyDay(int num) {
    int i = 0; // Counter variable
    char hexDigits[100]; // Array to store hexadecimal digits

    while (num != 0) {
        int remainder = num % 16;
        if (remainder < 10) {
            hexDigits[i] = remainder + 48;
        } else {
            hexDigits[i] = remainder + 55;
        }
        num = num / 16;
        i++;
    }

    printf("Hexadecimal: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hexDigits[j]);
    }
    printf("\n");
}

void cloudySky(int num) {
    // This function is not used in the program
}

void rainyNight(int num) {
    // This function is not used in the program
}

