#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program checks if a given string is a palindrome.
// A palindrome is a string that reads the same backward as forward.
// The program reads a string from the user, removes any non-alphanumeric characters,
// converts it to lowercase, and then checks if it is a palindrome.
// The program uses dynamic memory allocation to handle the input string.

int isPalindrome(char *str) {
    int left = 0;
    int right = strlen(str) - 1;

    while (left < right) {
        if (str[left] != str[right]) {
            return 0; // Not a palindrome
        }
        left++;
        right--;
    }
    return 1; // Is a palindrome
}

void removeNonAlphanumeric(char *str) {
    char *src = str, *dst = str;
    while (*src) {
        if ((*src >= 'a' && *src <= 'z') || (*src >= 'A' && *src <= 'Z') || (*src >= '0' && *src <= '9')) {
            *dst++ = *src;
        }
        src++;
    }
    *dst = '\0';
}

void toLowerCase(char *str) {
    while (*str) {
        if (*str >= 'A' && *str <= 'Z') {
            *str = *str + ('a' - 'A');
        }
        str++;
    }
}

int main() {
    char *input = (char *)malloc(100 * sizeof(char)); // Allocate memory for the input string
    if (input == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    printf("Enter a string: ");
    fgets(input, 100, stdin); // Read input from the user

    // Remove newline character if present
    size_t len = strlen(input);
    if (len > 0 && input[len - 1] == '\n') {
        input[len - 1] = '\0';
    }

    removeNonAlphanumeric(input); // Remove non-alphanumeric characters
    toLowerCase(input); // Convert to lowercase

    if (isPalindrome(input)) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    // Free the allocated memory
}