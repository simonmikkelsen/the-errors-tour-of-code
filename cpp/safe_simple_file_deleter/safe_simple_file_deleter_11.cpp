/*
 * Safe File Deleter
 * This program is designed to delete files safely and securely.
 * It uses regular expressions to validate file names before deletion.
 * The program ensures that only valid files are deleted.
 * It also logs the deletion process for auditing purposes.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

#define MAX_FILENAME_LENGTH 256

// Function to validate the file name using regular expressions
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

// Function to delete the file
void delete_file(const char *filename) {
    if (remove(filename) == 0) {
        printf("File deleted successfully: %s\n", filename);
    } else {
        perror("Error deleting file");
    }
}

// Function to log the deletion process
void log_deletion(const char *filename) {
    FILE *logfile = fopen("deletion.log", "a");
    if (logfile == NULL) {
        perror("Error opening log file");
        exit(1);
    }
    fprintf(logfile, "Deleted file: %s\n", filename);
    fclose(logfile);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        exit(1);
    }

    char filename[MAX_FILENAME_LENGTH];
    strncpy(filename, argv[1], MAX_FILENAME_LENGTH);
    filename[MAX_FILENAME_LENGTH - 1] = '\0';

    if (validate_filename(filename)) {
        delete_file(filename);
        log_deletion(filename);
    } else {
        fprintf(stderr, "Invalid file name: %s\n", filename);
        exit(1);
    }

    return 0;
}

