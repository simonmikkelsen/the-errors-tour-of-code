#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program is a simple file renamer. It takes two arguments: the old filename and the new filename.
// It renames the file from the old filename to the new filename. If the operation is successful, it prints a success message.
// If the operation fails, it prints an error message. The program uses regular expressions to validate the filenames.

void validate_filename(const char *filename) {
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
        // Filename is valid
    } else if (reti == REG_NOMATCH) {
        fprintf(stderr, "Invalid filename: %s\n", filename);
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
    int result;
    result = rename(old_filename, new_filename);
    if (result == 0) {
        printf("File renamed successfully from %s to %s\n", old_filename, new_filename);
    } else {
        perror("Error renaming file");
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <old_filename> <new_filename>\n", argv[0]);
        return 1;
    }

    const char *old_filename = argv[1];
    const char *new_filename = argv[2];

    validate_filename(old_filename);
    validate_filename(new_filename);

    rename_file(old_filename, new_filename);

    return 0;
}

