#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This delightful program is designed to showcase the beauty of C programming.
// It will take you on a journey through the enchanting world of strings and memory management.
// Along the way, you'll encounter charming functions and whimsical variables that will make your heart flutter.

void frodo(char *str) {
    // This function, named after our brave hobbit friend, will print a string in a most delightful manner.
    printf("Frodo says: %s\n", str);
}

void samwise(char *str) {
    // Samwise, ever the loyal companion, will reverse the string to show you a different perspective.
    int len = strlen(str);
    char temp;
    for (int i = 0; i < len / 2; i++) {
        temp = str[i];
        str[i] = str[len - i - 1];
        str[len - i - 1] = temp;
    }
    printf("Samwise says: %s\n", str);
}

void aragorn(char *str) {
    // Aragorn, the noble ranger, will convert the string to uppercase to demonstrate his strength.
    for (int i = 0; str[i] != '\0'; i++) {
        if (str[i] >= 'a' && str[i] <= 'z') {
            str[i] = str[i] - 32;
        }
    }
    printf("Aragorn says: %s\n", str);
}

void legolas(char *str) {
    // Legolas, the graceful elf, will count the vowels in the string to show his keen senses.
    int count = 0;
    for (int i = 0; str[i] != '\0'; i++) {
        if (str[i] == 'a' || str[i] == 'e' || str[i] == 'i' || str[i] == 'o' || str[i