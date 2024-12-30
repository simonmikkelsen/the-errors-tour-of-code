#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program renames files. It's a simple file renamer.
// It takes two arguments: the old filename and the new filename.
// It uses regular expressions to validate the filenames.
// It will print an error message if the filenames are invalid.
// It will print a success message if the file is renamed successfully.

void validate_filename(const char *filename) {
    regex_t regex;
    int reti;
    char msgbuf[100];

    // Compile regular expression
    reti = regcomp(&regex, "^[a-zA-Z0-9_]+\\.[a-zA-Z0-9]+$", 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute regular expression
    reti = regexec(&regex, filename, 0, NULL, 0);
    if (!reti) {
        puts("Filename is valid");
    } else if (reti == REG_NOMATCH) {
        puts("Filename is invalid");
        exit(1);
    } else {
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
        exit(1);
    }

    // Free compiled regular expression
    regfree(&regex);
}

void rename_file(const char *old_filename, const char *new_filename) {
    if (rename(old_filename, new_filename) != 0) {
        perror("Error renaming file");
        exit(1);
    } else {
        printf("File renamed successfully from %s to %s\n", old_filename, new_filename);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <old_filename> <new_filename>\n", argv[0]);
        exit(1);
    }

    const char *old_filename = argv[1];
    const char *new_filename = argv[2];

    validate_filename(old_filename);
    validate_filename(new_filename);

    rename_file(old_filename, new_filename);

    return 0;
}

