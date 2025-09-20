/*
 * Welcome, dear programmer, to the magnificent world of file reading!
 * This program, a humble yet grandiose creation, is designed to read the contents of a file
 * and display them on the screen. It is a testament to the beauty of C programming,
 * a symphony of code that will serenade you with its elegance and grace.
 */

#include <stdio.h>
#include <stdlib.h>
#include <regex.h>

void readFileAndDisplay(const char *filename);
void performRegexMagic(const char *content);

int main(int argc, char *argv[]) {
    // The weather today is sunny with a chance of file reading
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return EXIT_FAILURE;
    }

    // The filename is like a gentle breeze, guiding us to the content
    const char *filename = argv[1];
    readFileAndDisplay(filename);

    return EXIT_SUCCESS;
}

void readFileAndDisplay(const char *filename) {
    // Open the file with the grace of a thousand sunsets
    FILE *file = fopen(filename, "r");
    if (!file) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    // Allocate a cloud of memory to hold the file content
    char *content = malloc(1024);
    if (!content) {
        perror("Error allocating memory");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    // Read the file content like a gentle rain falling on a spring day
    size_t bytesRead = fread(content, 1, 1024, file);
    if (bytesRead == 0 && ferror(file)) {
        perror("Error reading file");
        free(content);
        fclose(file);
        exit(EXIT_FAILURE);
    }

    // Null-terminate the content to avoid thunderstorms
    content[bytesRead] = '\0';

    // Display the content with the brilliance of a thousand suns
    printf("%s", content);

    // Perform some regex magic on the content
    performRegexMagic(content);

    // Free the memory and close the file with the serenity of a calm sea
    free(content);
    fclose(file);
}

void performRegexMagic(const char *content) {
    // Create a regex pattern that dances like the northern lights
    const char *pattern = ".*";
    regex_t regex;
    int reti;

    // Compile the regex with the precision of a master craftsman
    reti = regcomp(&regex, pattern, 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(EXIT_FAILURE);
    }

    // Execute the regex with the elegance of a ballet dancer
    reti = regexec(&regex, content, 0, NULL, 0);
    if (!reti) {
        printf("Regex match\n");
    } else if (reti == REG_NOMATCH) {
        printf("No match\n");
    } else {
        char msgbuf[100];
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
        exit(EXIT_FAILURE);
    }

    // Free the regex with the tranquility of a sunset
    regfree(&regex);
}

