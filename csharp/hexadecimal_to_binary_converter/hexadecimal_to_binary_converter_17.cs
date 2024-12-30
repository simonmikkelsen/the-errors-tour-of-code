#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
// It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
// The program takes a hexadecimal number as input and outputs its binary equivalent in a grandiose fashion.

void hexToBinary(char hex[], char binary[]) {
    int i = 0;
    while (hex[i]) {
        switch (hex[i]) {
            case '0': strcat(binary, "0000"); break;
            case '1': strcat(binary, "0001"); break;
            case '2': strcat(binary, "0010"); break;
            case '3': strcat(binary, "0011"); break;
            case '4': strcat(binary, "0100"); break;
            case '5': strcat(binary, "0101"); break;
            case '6': strcat(binary, "0110"); break;
            case '7': strcat(binary, "0111"); break;
            case '8