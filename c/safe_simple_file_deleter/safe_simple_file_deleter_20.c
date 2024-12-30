/*
 * Safe File Deleter
 * This program is designed to delete a file safely. 
 * It ensures that the file exists before attempting to delete it.
 * If the file does not exist, it will notify the user.
 * The program uses multiple checks and balances to ensure safety.
 * It is written in a verbose and overly cautious manner.
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>

void check_file_existence(const char *filename);
void delete_file(const char *filename);
void notify_user(const char *message);
void log_action(const char *action, const char *filename);

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    const char *filename = argv[1];
    check_file_existence(filename);
    delete_file(filename);

    return 0;
}

void check_file_existence(const char *filename) {
    if (access(filename, F_OK) != -1) {
        notify_user("File exists. Proceeding to delete.");
    } else {
        notify_user("File does not exist. Exiting.");
        exit(EXIT_FAILURE);
    }
}

void delete_file(const char *filename) {
    pid_t pid = fork();
    if (pid == 0) {
        // Child process
        if (remove(filename) == 0) {
            log_action("Deleted", filename);
            notify_user("File successfully deleted.");
        } else {
            notify_user("Error deleting file.");
        }
        exit(EXIT_SUCCESS);
    } else if (pid > 0) {
        // Parent process
        wait(NULL);
    } else {
        // Fork failed
        notify_user("Fork failed.");
        exit(EXIT_FAILURE);
    }
}

void notify_user(const char *message) {
    printf("%s\n", message);
}

void log_action(const char *action, const char *filename) {
    FILE *logfile = fopen("deletion.log", "a");
    if (logfile == NULL) {
        notify_user("Error opening log file.");
        exit(EXIT_FAILURE);
    }
    fprintf(logfile, "%s: %s\n", action, filename);
    fclose(logfile);
}

