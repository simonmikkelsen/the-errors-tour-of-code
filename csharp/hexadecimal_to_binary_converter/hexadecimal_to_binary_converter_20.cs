/*
 * Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that delightful base-16 representation,
 * and transform it into the binary format, the very essence of computer language.
 * Prepare yourself for a journey through loops, conditions, and conversions!
 */

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <string.h>

// Function to convert a single hexadecimal digit to binary
void hexToBin(char hex, char *bin) {
    switch (hex) {
        case '0': strcpy(bin, "0000"); break;
        case '1': strcpy(bin, "0001"); break;
        case '2': strcpy(bin, "0010"); break;
        case '3': strcpy(bin, "0011"); break;
        case '4': strcpy(bin, "0100"); break;
        case '5': strcpy(bin, "0101"); break;
        case '6': strcpy(bin, "0110"); break;
        case '7': strcpy(bin, "0111"); break;
        case '