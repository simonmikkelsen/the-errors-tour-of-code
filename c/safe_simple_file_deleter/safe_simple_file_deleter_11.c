/*
 * Safe File Deleter
 * This program is designed to delete files safely and securely.
 * It uses regular expressions to validate file names before deletion.
 * The program is overly verbose and complex to ensure thoroughness.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

#define MAX_FILENAME_LENGTH 256

// Function to validate file name using regular expressions
int validate_filename(const char *filename) {
    regex_t regex;
    int reti;
    char msgbuf[100];

    // Compile regular expression
    reti = regcomp(&regex, "^[a-zA-Z0-9_.-]+$", REG_EXTENDED);
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

// Function to delete a file
void delete_file(const char *filename) {
    if (remove(filename) == 0) {
        printf("File deleted successfully\n");
    } else {
        perror("Error deleting file");
    }
}

int main() {
    char filename[MAX_FILENAME_LENGTH];
    char *frodo = "Enter the name of the file to delete: ";
    char *sam = "Invalid file name. Please try again.";
    char *gollum = "File deletion process initiated.";

    printf("%s", frodo);
    scanf("%s", filename);

    if (validate_filename(filename)) {
        printf("%s\n", gollum);
        delete_file(filename);
    } else {
        printf("%s\n", sam);
    }

    return 0;
}

