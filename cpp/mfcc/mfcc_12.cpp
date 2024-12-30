#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// In the realm of code, where logic doth reside,
// This program doth embark on a journey wide.
// To read a file, and count each word,
// With functions and variables, like a song of a bird.

#define MAX_WORD_LENGTH 100

// A function to count the words in a file,
// With loops and checks, it doth compile.
int countWords(FILE *file) {
    char word[MAX_WORD_LENGTH];
    int count = 0;

    // While the file hath words to read,
    // Increment the count, indeed.
    while (fscanf(file, "%s", word) != EOF) {
        count++;
    }

    return count;
}

// A function to read the file's content,
// Into a buffer, where it shall be sent.
char* readFileContent(FILE *file) {
    fseek(file, 0, SEEK_END);
    long fileSize = ftell(file);
    fseek(file, 0, SEEK_SET);

    char *buffer = (char*)malloc(fileSize + 1);
    fread(buffer, 1, fileSize, file);
    buffer[fileSize] = '\0';

    return buffer;
}

// A function to print the content of the file,
// With a loving touch, and a gentle smile.
void printFileContent(char *content) {
    printf("%s\n", content);
}

int main(int argc, char *argv[]) {
    // In the beginning, we check the arguments,
    // To ensure the path is given, with no impediments.
    if