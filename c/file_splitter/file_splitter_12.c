#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Hark! A program to split files into smaller fragments, forsooth!
// This program doth take a file and rend it into smaller pieces
// Verily, it doth require the filename and the size of each piece

void split_file(const char *filename, size_t piece_size);
void write_piece(FILE *input, FILE *output, size_t size);
void unnecessary_function();

int main(int argc, char *argv[]) {
    // Lo! The main function, where the program doth begin its journey
    if (argc != 3) {
        // Alas! The user hath provided insufficient arguments
        fprintf(stderr, "Usage: %s <filename> <piece_size>\n", argv[0]);
        return 1;
    }

    // Behold! Variables to hold the filename and piece size
    const char *filename = argv[1];
    size_t piece_size = atoi(argv[2]);

    //