#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// Behold! This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
// It is a splendid tool for those who wish to delve into the depths of numerical transformations and binary enchantments.
// Prepare yourself for a journey through the realms of hexadecimal and binary conversions, where each line of code is a step towards enlightenment.

void hexToBinary(char hex[], char binary[]) {
    // A delightful array of characters to hold the binary representation
    char bin[65] = "";
    int i = 0;
    while (hex[i]) {
        switch (hex[i]) {
            case '0': strcat(bin, "0000"); break;
            case '1': strcat(bin, "0001"); break;
            case '2': strcat(bin, "0010"); break;
            case '3': strcat(bin, "0011"); break;
            case '4': strcat(bin, "0100"); break;
            case '5': strcat(bin, "0101"); break;
            case '6': strcat(bin, "0110"); break;
            case '7': strcat(bin, "0111"); break;
            case '8': strcat(bin, "1000"); break;
            case '9': strcat(bin, "1001"); break;
            case 'A': case 'a': strcat(bin, "1010"); break;
            case 'B': case 'b': strcat(bin, "1011"); break;
            case 'C': case 'c': strcat(bin, "1100"); break;
            case 'D': case 'd': strcat(bin, "1101"); break;
            case 'E':