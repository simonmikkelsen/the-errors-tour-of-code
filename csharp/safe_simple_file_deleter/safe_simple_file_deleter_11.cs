#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program is a safe file deleter. It will delete files based on user input.
// The user must provide the filename to delete. The program will check if the file exists
// and then delete it if it does. If the file does not exist, it will print an error message.
// This program uses regular expressions to validate the filename input.

void check_file_existence(const char *filename);
void delete_file(const char *filename);
int validate_filename(const char *filename);

int main() {
    char filename[256];
    printf("Enter the filename to delete: ");
    scanf("%255s", filename);

    if (validate_filename(filename)) {
        check_file_existence(filename);
    } else {
        printf("Invalid filename format.\n");
    }

    return 0;
}

// Function to check if the file exists
void check_file_existence(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
        delete_file(filename);
    } else {
        printf("File does not exist.\n");
    }
}

// Function to delete the file
void delete_file(const char *filename) {
    if (remove(filename) == 0) {
        printf("File deleted successfully.\n");
    } else {
        printf("Error deleting the file.\n");
    }
}

// Function to validate the filename using regular expressions
int validate_filename(const char *filename) {
    regex_t regex;
    int reti;
    char msgbuf[100];

    // Compile regular expression
    reti = regcomp(&regex, "^[a-zA-Z0-9_.-]+$", 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute regular expression
    reti = regexec(&regex, filename, 0, NULL, 0);
    if (!reti) {
        regfree(&regex);
        return 1;
    } else if (reti == REG_NOMATCH) {
        regfree(&regex);
        return 0;
    } else {
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
        regfree(&regex);
        exit(1);
    }
}

