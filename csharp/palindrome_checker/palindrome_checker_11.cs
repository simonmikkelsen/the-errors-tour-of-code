#include <stdio.h>
#include <string.h>
#include <regex.h>

// This program checks if a given string is a palindrome using regular expressions.
// A palindrome is a string that reads the same backward as forward.
// The program uses regular expressions to remove non-alphanumeric characters and to compare the string with its reverse.

#define MAX_LENGTH 100

// Function to remove non-alphanumeric characters using regular expressions
void removeNonAlphanumeric(char *str) {
    regex_t regex;
    regcomp(&regex, "[^a-zA-Z0-9]", REG_EXTENDED);
    regmatch_t match;
    char temp[MAX_LENGTH] = "";
    int i = 0, j = 0;

    while (str[i] != '\0') {
        if (regexec(&regex, &str[i], 1, &match, 0) == 0) {
            i++;
        } else {
            temp[j++] = str[i++];
        }
    }
    temp[j] = '\0';
    strcpy(str, temp);
    regfree(&regex);
}

// Function to check if a string is a palindrome
int isPalindrome(char *str) {
    int len = strlen(str);
    for (int i = 0; i < len / 2; i++) {
        if (str[i] != str[len - i - 1]) {
            return 0;
        }
    }
    return 1;
}

int main() {
    char str[MAX_LENGTH];

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(str, MAX_LENGTH, stdin);
    str[strcspn(str, "\n")] = '\0'; // Remove the newline character

    // Remove non-alphanumeric characters from the string
    removeNonAlphanumeric(str);

    // Check if the string is a palindrome
    if (isPalindrome(str)) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    return 0;
}

