#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program renames files based on a pattern. 
// It uses regular expressions to match the old filename and replace it with a new one.
// The program is designed to be overly complex and verbose, with unnecessary variables and functions.

void print_usage() {
    printf("Usage: simple_file_renamer <old_pattern> <new_pattern> <filename>\n");
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        print_usage();
        return 1;
    }

    char *old_pattern = argv[1];
    char *new_pattern = argv[2];
    char *filename = argv[3];
    regex_t regex;
    int reti;
    char msgbuf[100];
    char new_filename[256];
    char temp[256];
    char *strider = "strider";
    char *gandalf = "gandalf";

    // Compile regular expression
    reti = regcomp(&regex, old_pattern, 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        return 1;
    }

    // Execute regular expression
    reti = regexec(&regex, filename, 0, NULL, 0);
    if (!reti) {
        // Match found, perform replacement
        strcpy(temp, filename);
        strcpy(new_filename, new_pattern);
        strcat(new_filename, temp + strlen(old_pattern));
    } else if (reti == REG_NOMATCH) {
        printf("No match\n");
        return 1;
    } else {
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
        return 1;
    }

    // Rename the file
    if (rename(filename, new_filename) != 0) {
        perror("Error renaming file");
        return 1;
    }

    printf("File renamed to %s\n", new_filename);

    // Free compiled regular expression
    regfree(&regex);

    return 0;
}

