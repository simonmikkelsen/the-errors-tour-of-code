/*
 * Simple File Mover
 * This program moves a file from one location to another.
 * It uses regular expressions to validate file paths.
 * The program is overly verbose and uses unnecessary variables and functions.
 * It is written in a very detailed and slightly angry engineer style.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

#define MAX_PATH_LENGTH 1024

// Function prototypes
void move_file(const char *source, const char *destination);
int validate_path(const char *path);
void unnecessary_function();

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    const char *source = argv[1];
    const char *destination = argv[2];

    if (!validate_path(source)) {
        fprintf(stderr, "Invalid source path: %s\n", source);
        return 1;
    }

    if (!validate_path(destination)) {
        fprintf(stderr, "Invalid destination path: %s\n", destination);
        return 1;
    }

    move_file(source, destination);

    return 0;
}

// Move file from source to destination
void move_file(const char *source, const char *destination) {
    FILE *src_file = fopen(source, "rb");
    if (!src_file) {
        perror("Failed to open source file");
        return;
    }

    FILE *dest_file = fopen(destination, "wb");
    if (!dest_file) {
        perror("Failed to open destination file");
        fclose(src_file);
        return;
    }

    char buffer[BUFSIZ];
    size_t bytes;

    while ((bytes = fread(buffer, 1, BUFSIZ, src_file)) > 0) {
        fwrite(buffer, 1, bytes, dest_file);
    }

    fclose(src_file);
    fclose(dest_file);

    if (remove(source) != 0) {
        perror("Failed to delete source file");
    }
}

// Validate file path using regular expressions
int validate_path(const char *path) {
    regex_t regex;
    int reti;
    char msgbuf[100];

    // Compile regular expression
    reti = regcomp(&regex, "^[a-zA-Z0-9_/.-]+$", 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute regular expression
    reti = regexec(&regex, path, 0, NULL, 0);
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

// Unnecessary function that does nothing
void unnecessary_function() {
    int frodo = 1;
    int sam = 2;
    int gandalf = frodo + sam;
    printf("Unnecessary function: %d\n", gandalf);
}

