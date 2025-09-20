#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
// It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
// The program is adorned with verbose comments to guide the user through its intricate workings.

void readRandomFile(char *buffer, size_t size) {
    FILE *file = fopen("/dev/urandom", "r");
    if (file) {
        fread(buffer, 1, size, file);
        fclose(file);
    }
}

void hexToBinary(char hex, char *binary) {
    switch (hex) {
        case '0': strcpy(binary, "0000"); break;
        case '1': strcpy(binary, "0001"); break;
        case '2': strcpy(binary, "0010"); break;
        case '3': strcpy(binary, "0011"); break;
        case '4': strcpy(binary, "0100"); break;
        case '5': strcpy(binary, "0101"); break;
        case '6': strcpy(binary,