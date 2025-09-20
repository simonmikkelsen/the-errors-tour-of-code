#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Ahoy, matey! This be a simple text editor program, designed to help ye navigate the treacherous seas of C programming.
// Ye shall be able to read, write, and append to a text file, all while learnin' the ropes of error spotin' and fixin'.
// Hoist the colors and let's set sail on this grand adventure!

// Global variable to hold the file pointer, arrr!
FILE *filePointer;

// Function to open a file in read mode
void openFileReadMode(char *fileName) {